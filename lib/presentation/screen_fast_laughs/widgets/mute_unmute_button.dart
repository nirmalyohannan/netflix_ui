import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MuteUnmuteButton extends StatefulWidget {
  const MuteUnmuteButton({
    Key? key,
    required this.videoController,
  }) : super(key: key);

  final VideoPlayerController videoController;
  @override
  State<MuteUnmuteButton> createState() => _MuteUnmuteButtonState();
}

class _MuteUnmuteButtonState extends State<MuteUnmuteButton> {
  IconData iconData = Icons.volume_up_outlined;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.videoController.value.volume == 0) {
            widget.videoController.setVolume(1);
            iconData = Icons.volume_up_outlined;
          } else {
            widget.videoController.setVolume(0);
            iconData = Icons.volume_off_outlined;
          }
        });
      },
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.black,
        child: Icon(iconData),
      ),
    );
  }
}
