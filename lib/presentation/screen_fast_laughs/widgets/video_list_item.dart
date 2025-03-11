import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/presentation/screen_fast_laughs/widgets/mute_unmute_button.dart';
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
  Timer? timer;
  bool isVideoLoading = true;
  bool isBufferingFinished = false;

  @override
  void initState() {
    fetchFromYoutube(
      skipFetchIfExistsInCache: true,
      onThumbnailLoaded: onThumbnailLoaded,
      onVideoAvailable: onVideoAvailable,
      onVideoBufferFinished: () => setState(() {
        isBufferingFinished = true;
      }),
    );
    super.initState();
  }

  @override
  void dispose() {
    videoController?.dispose();
    timer?.cancel();
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
    return Stack(
      children: [
        InkWell(
          onTap: onVideoTapped,
          child: VideoPlayer(videoController!),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MuteUnmuteButton(
                  videoController: videoController!,
                ),
                _RightSideButtonsSection(
                  videoController: videoController!,
                  videoUrl: widget.videoUrl,
                ),
              ],
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

  void onVideoAvailable(file) async {
    videoController = VideoPlayerController.file(file);
    await videoController!.initialize();
    videoController!.addListener(() {
      timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
        if (isBufferingFinished == false) {
          videoController!.play();
        } else {
          timer.cancel();
        }
      });
    });
    videoController!.play();
    isVideoLoading = false;
    setState(() {});
  }

  void fetchFromYoutube(
      {ValueChanged<String>? onThumbnailLoaded,
      ValueChanged<File>? onVideoAvailable,
      VoidCallback? onVideoBufferFinished,
      bool skipFetchIfExistsInCache = false}) async {
    var url = widget.videoUrl;
    final YoutubeExplode yt = YoutubeExplode();
    var video = await yt.videos.get(url); //Get Video Details

    //Setting video Cache File for saving the video Stream
    var cacheDirectory = await getApplicationCacheDirectory();
    String fileName = "${video.id}.mp4";
    File videoFile = File("${cacheDirectory.path}/$fileName");

    if (skipFetchIfExistsInCache && videoFile.existsSync()) {
      onVideoAvailable?.call(videoFile);
      onVideoBufferFinished?.call();
      return;
    }

    //On Thumbnail Loaded
    onThumbnailLoaded?.call(video.thumbnails.highResUrl);

    //Get Video Stream
    var manifest = await yt.videos.streams.getManifest(video.id);
    var videoStreamClient = yt.videos.streams;
    var videoStream = videoStreamClient.get(manifest.videoOnly.bestQuality);

    var fileStream = videoFile.openWrite(); //Stream Consumer
    var streamObject =
        videoStream.pipe(fileStream); //Passing Steam Consumer to video Stream
    await Future.delayed(const Duration(milliseconds: 100));

    //initialise player
    onVideoAvailable?.call(videoFile);

    //wait for stream to finish
    await streamObject;
    //close stream
    await fileStream.flush();
    await fileStream.close();

    onVideoBufferFinished?.call();
  }
}

class _RightSideButtonsSection extends StatefulWidget {
  const _RightSideButtonsSection(
      {Key? key, required this.videoController, required this.videoUrl})
      : super(key: key);
  final String videoUrl;
  final VideoPlayerController videoController;

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
        ListenableBuilder(
            listenable: widget.videoController,
            builder: (context, child) {
              return VideoInteractButton(
                iconData: widget.videoController.value.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow,
                buttonName:
                    widget.videoController.value.isPlaying ? "Pause" : "Play",
                onPressed: () {
                  setState(() {
                    widget.videoController.value.isPlaying
                        ? widget.videoController.pause()
                        : widget.videoController.play();
                  });
                },
              );
            }),
      ],
    );
  }
}
