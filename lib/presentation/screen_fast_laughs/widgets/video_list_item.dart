import 'package:flutter/material.dart';
import 'package:netflix_ui/presentation/screen_fast_laughs/widgets/mute_unmute_button.dart';
import 'package:netflix_ui/presentation/screen_fast_laughs/widgets/video_dp_button.dart';
import 'package:netflix_ui/presentation/screen_fast_laughs/widgets/video_interaction_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

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
  late final VideoPlayerController videoController;
  @override
  void initState() {
    // videoController = PodPlayerController(
    //     playVideoFrom: PlayVideoFrom.youtube(widget.videoUrl),
    //     podPlayerConfig: const PodPlayerConfig(
    //       isLooping: true,
    //     ))
    //   ..initialise();

    videoController =
        VideoPlayerController.networkUrl(Uri.dataFromString(widget.videoUrl))
          ..initialize().then((value) => videoController.play());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoPlayer(videoController),
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
            Share.share(
                widget.videoController.dataSource ?? "No Url Available");
          },
        ),
        VideoInteractButton(
          iconData: widget.videoController.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow,
          buttonName: widget.videoController.value.isPlaying ? "Pause" : "Play",
          onPressed: () {
            setState(() {
              widget.videoController.value.isPlaying
                  ? widget.videoController.pause()
                  : widget.videoController.play();
            });
          },
        ),
      ],
    );
  }
}
