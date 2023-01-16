import 'package:flutter/material.dart';
import 'package:netflix_ui/presentation/screen_fast_laughs/widgets/mute_unmute_button.dart';
import 'package:netflix_ui/presentation/screen_fast_laughs/widgets/video_dp_button.dart';
import 'package:netflix_ui/presentation/screen_fast_laughs/widgets/video_interaction_button.dart';
import 'package:pod_player/pod_player.dart';
import 'package:share_plus/share_plus.dart';

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
  late final PodPlayerController videoController;
  @override
  void initState() {
    videoController = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube(widget.videoUrl),
        podPlayerConfig: const PodPlayerConfig(
          isLooping: true,
        ))
      ..initialise();
    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        PodVideoPlayer(
          controller: videoController,
          frameAspectRatio: 9 / 16,
          videoAspectRatio: 9 / 16,
          podProgressBarConfig:
              const PodProgressBarConfig(height: 0, circleHandlerRadius: 0),
          alwaysShowProgressBar: false,
          overlayBuilder: (options) {
            return const SizedBox();
          },
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
                  videoController: videoController,
                ),
                _RightSideButtonsSection(
                  videoController: videoController,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _RightSideButtonsSection extends StatefulWidget {
  const _RightSideButtonsSection({
    Key? key,
    required this.videoController,
  }) : super(key: key);
  final PodPlayerController videoController;

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
            Share.share(widget.videoController.videoUrl ?? "No Url Available");
          },
        ),
        VideoInteractButton(
          iconData: widget.videoController.isVideoPlaying
              ? Icons.pause
              : Icons.play_arrow,
          buttonName: widget.videoController.isVideoPlaying ? "Pause" : "Play",
          onPressed: () {
            setState(() {
              widget.videoController.isVideoPlaying
                  ? widget.videoController.pause()
                  : widget.videoController.play();
            });
          },
        ),
      ],
    );
  }
}
