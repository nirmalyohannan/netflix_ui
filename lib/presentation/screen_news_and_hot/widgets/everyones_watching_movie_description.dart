import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/data/model/movies_list_model.dart';
import 'package:netflix_ui/logic/fetch_from_youtube.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class EveryonesWatchingMovieDescription extends StatefulWidget {
  const EveryonesWatchingMovieDescription({
    Key? key,
    required this.trailerUrl,
    required this.movieModel,
  }) : super(key: key);

  final String trailerUrl;
  final MovieModel movieModel;

  @override
  State<EveryonesWatchingMovieDescription> createState() =>
      _EveryonesWatchingMovieDescriptionState();
}

class _EveryonesWatchingMovieDescriptionState
    extends State<EveryonesWatchingMovieDescription> {
  VideoPlayerController? videoController;
  String? thumbnailUrl;

  @override
  void initState() {
    try {
      fetchFromYoutube(
        url: widget.trailerUrl,
        skipFetchIfExistsInCache: true,
        onVideoBufferFinished: (videoFile) => setState(() => videoController =
            VideoPlayerController.file(videoFile)..initialize()),
      );
    } catch (e) {
      log(e.toString());
    }
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    videoController?.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Builder(builder: (context) {
            if (videoController == null) {
              return Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.movieModel.imageUrl,
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.fitWidth,
                  ),
                  const Center(child: CircularProgressIndicator()),
                ],
              );
            }
            return InkWell(
                onTap: () => videoController!.value.isPlaying
                    ? videoController!.pause()
                    : videoController!.play(),
                child: VideoPlayer(videoController!));
          }),
        ),
        kGapHeight20,
        Row(
          children: [
            Expanded(
              child: Text(
                widget.movieModel.movieName,
                style: TextStyle(
                    fontSize: kFontSizeMovieTitle, fontWeight: FontWeight.bold),
              ),
            ),
            kGapWidth20,
            _VerticalIconButton(
              iconData: Icons.send_outlined,
              iconSize: 30,
              title: "Share",
              onPressed: () {
                Share.share(widget.trailerUrl);
              },
            ),
            kGapWidth10,
            _VerticalIconButton(
              iconData: Icons.add,
              iconSize: 30,
              title: "My List",
              onPressed: () {},
            ),
            kGapWidth10,
            if (videoController != null)
              ListenableBuilder(
                  listenable: videoController!,
                  builder: (context, child) {
                    return _VerticalIconButton(
                      iconData: videoController!.value.isPlaying
                          ? CupertinoIcons.pause_fill
                          : CupertinoIcons.play_arrow_solid,
                      iconSize: 30,
                      title:
                          videoController!.value.isPlaying ? "Pause" : "Play",
                      onPressed: () {
                        videoController!.value.isPlaying
                            ? videoController!.pause()
                            : videoController!.play();
                      },
                    );
                  }),
            kGapWidth10,
          ],
        ),
        kGapHeight10,
        Text(
          widget.movieModel.movieName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kGapHeight10,
        Text(
          widget.movieModel.descriptions,
        ),
        kGapHeight20,
        kGapHeight10,
      ],
    );
  }
}

class _VerticalIconButton extends StatefulWidget {
  const _VerticalIconButton({
    Key? key,
    required this.iconData,
    required this.title,
    this.iconSize = 25,
    required this.onPressed,
  }) : super(key: key);
  final IconData iconData;
  final String title;
  final double iconSize;
  final Function onPressed;

  @override
  State<_VerticalIconButton> createState() => _VerticalIconButtonState();
}

class _VerticalIconButtonState extends State<_VerticalIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.iconData,
            color: colorIcon,
            size: widget.iconSize,
          ),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
