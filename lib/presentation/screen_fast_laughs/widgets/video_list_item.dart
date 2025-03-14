import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_ui/presentation/screen_fast_laughs/widgets/animated_linear_progress_indicator.dart';
import 'package:netflix_ui/presentation/screen_fast_laughs/widgets/video_dp_button.dart';
import 'package:netflix_ui/presentation/screen_fast_laughs/widgets/video_interaction_button.dart';
import 'package:path_provider/path_provider.dart';

import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoListItem extends StatefulWidget {
  const VideoListItem({
    required this.index,
    required this.videoUrl,
    Key? key,
  }) : super(key: key);

  final int index;
  final String videoUrl;

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  VideoPlayerController? videoController;

  String? thumbnailUrl;
  bool isVideoLoading = true;
  String? errorMessage;

  @override
  void initState() {
    fetchFromYoutube(
      skipFetchIfExistsInCache: true,
      onThumbnailLoaded: onThumbnailLoaded,
      onVideoBufferFinished: onVideoAvailable,
    );
    super.initState();
  }

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Builder(builder: (context) {
          if (errorMessage != null) {
            return Center(child: Text(errorMessage!));
          }
          if (videoController == null || isVideoLoading) {
            return Stack(
              alignment: AlignmentDirectional.center,
              children: [
                if (thumbnailUrl != null)
                  CachedNetworkImage(
                    imageUrl: thumbnailUrl!,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.fitHeight,
                  ),
                const Center(child: CircularProgressIndicator()),
              ],
            );
          }
          return Column(
            children: [
              Flexible(
                child: InkWell(
                  onTap: onVideoTapped,
                  child: VideoPlayer(videoController!),
                ),
              ),
              ListenableBuilder(
                  listenable: videoController!,
                  builder: (context, child) {
                    var currentVal = videoController!.value.position.inSeconds /
                        videoController!.value.duration.inSeconds;

                    return AnimatedLinearProgressIndicator(value: currentVal);
                  })
            ],
          );
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: _RightSideButtonsSection(
              videoController: videoController,
              videoUrl: widget.videoUrl,
            ),
          ),
        )
      ],
    );
  }

  void onVideoTapped() {
    if (videoController!.value.isPlaying) {
      videoController!.pause();
    } else {
      videoController!.play();
    }
  }

  void onThumbnailLoaded(url) => setState(() => thumbnailUrl = url);

  void onVideoAvailable(File videoFile) async {
    try {
      videoController = VideoPlayerController.file(videoFile);
      await videoController!.initialize();
      videoController!.play();
      isVideoLoading = false;
      setState(() {});
    } catch (e) {
      errorMessage = e.toString();
      setState(() {});
    }
  }

  void fetchFromYoutube(
      {final int bufferSize = 1024 * 1024 * 10,
      ValueChanged<String>? onThumbnailLoaded,
      FutureOr<void> Function(File video)? onVideoAvailable,
      ValueChanged<File>? onVideoBufferFinished,
      VoidCallback? onEachBufferAdded,
      bool skipFetchIfExistsInCache = false}) async {
    var url = widget.videoUrl;
    final YoutubeExplode yt = YoutubeExplode();
    var video = await yt.videos.get(url); //Get Video Details

    //Setting video Cache File for saving the video Stream
    var cacheDirectory = await getApplicationCacheDirectory();
    String videoFileName = "${video.id}_video.mp4";
    File videoFile = File("${cacheDirectory.path}/$videoFileName");
    bool isVideoFileExists = await videoFile.exists();

    if (skipFetchIfExistsInCache && isVideoFileExists) {
      await onVideoAvailable?.call(videoFile);
      onVideoBufferFinished?.call(videoFile);
      return;
    }
    if (isVideoFileExists == false) {
      await videoFile.create();
    }

    //On Thumbnail Loaded
    onThumbnailLoaded?.call(video.thumbnails.highResUrl);

    var manifest = await yt.videos.streams.getManifest(video.id);
    var streamClient = yt.videos.streams;

    //Get Video Stream
    var videoStream = streamClient.get(manifest.videoOnly.bestQuality);
    var videoStreamConsumer = videoFile.openWrite(); //Stream Consumer
    // var videoStreamObject = videoStream
    //     .pipe(videoStreamConsumer); //Passing Steam Consumer to video Stream

    List<int> buffer = []; //Buffer: Temporary Storage for Stream
    bool isOnAvailableCalled = false;

    videoStream.listen((event) async {
      buffer.addAll(event);
      //if buffer length is greater than buffer size
      if (buffer.length > bufferSize) {
        videoStreamConsumer.add(buffer);
        buffer = []; //Clear Buffer
        if (onVideoAvailable != null && !isOnAvailableCalled) {
          await onVideoAvailable(videoFile);
          isOnAvailableCalled = true;
        }
        onEachBufferAdded?.call();
      }
    }, onDone: () async {
      videoStreamConsumer.add(buffer);
      buffer = [];
      if (onVideoAvailable != null && !isOnAvailableCalled) {
        onVideoAvailable(videoFile);
        isOnAvailableCalled = true;
      }
      onEachBufferAdded?.call();

      await videoStreamConsumer.flush();
      await videoStreamConsumer.close();
      onVideoBufferFinished?.call(videoFile);
    });
  }
}

class _RightSideButtonsSection extends StatefulWidget {
  const _RightSideButtonsSection(
      {Key? key, required this.videoController, required this.videoUrl})
      : super(key: key);
  final String videoUrl;
  final VideoPlayerController? videoController;

  @override
  State<_RightSideButtonsSection> createState() =>
      _RightSideButtonsSectionState();
}

class _RightSideButtonsSectionState extends State<_RightSideButtonsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const VideoDpButton(
            imageUrl:
                "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7WUHnWGx5OO145IRxPDUkQSh4C7.jpg"),
        VideoInteractButton(
          iconData: Icons.emoji_emotions,
          buttonName: "LOL",
          onPressed: () {},
        ),
        VideoInteractButton(
          iconData: Icons.add,
          buttonName: "My List",
          onPressed: () {},
        ),
        VideoInteractButton(
          iconData: Icons.send_outlined,
          buttonName: "Share",
          onPressed: () {
            Share.share(widget.videoUrl);
          },
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: widget.videoController == null
              ? const SizedBox.shrink()
              : ListenableBuilder(
                  listenable: widget.videoController!,
                  builder: (context, child) {
                    return VideoInteractButton(
                      iconData: widget.videoController!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      buttonName: widget.videoController!.value.isPlaying
                          ? "Pause"
                          : "Play",
                      onPressed: () {
                        setState(() {
                          widget.videoController!.value.isPlaying
                              ? widget.videoController!.pause()
                              : widget.videoController!.play();
                        });
                      },
                    );
                  }),
        ),
      ],
    );
  }
}
