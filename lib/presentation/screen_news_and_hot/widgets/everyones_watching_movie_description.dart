import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/data/model/movies_list_model.dart';
import 'package:pod_player/pod_player.dart';
import 'package:share_plus/share_plus.dart';

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
  late final PodPlayerController videoController;

  @override
  void initState() {
    videoController = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube(
          widget.trailerUrl,
        ),
        podPlayerConfig: const PodPlayerConfig(autoPlay: false))
      ..initialise();

    videoController.hideOverlay();

    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CustomNetworkImage(
        //   "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/33j33midGw49BBxiqlNZeZ6PZ0O.jpg",
        //   placeholderWidth: size.width,
        //   placeholderHeight: 200,
        // ),
        PodVideoPlayer(
          controller: videoController,
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
            _VerticalIconButton(
              iconData: videoController.isVideoPlaying
                  ? CupertinoIcons.pause_fill
                  : CupertinoIcons.play_arrow_solid,
              iconSize: 30,
              title: videoController.isVideoPlaying ? "Pause" : "Play",
              onPressed: () {
                setState(() {
                  videoController.isVideoPlaying
                      ? videoController.pause()
                      : videoController.play();
                  videoController.hideOverlay();
                });
              },
            ),
            kGapWidth10,
          ],
        ),
        kGapHeight10,
        Text(
          widget.movieModel.movieName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
