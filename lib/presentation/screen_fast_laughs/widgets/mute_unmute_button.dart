import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class MuteUnmuteButton extends StatefulWidget {
  const MuteUnmuteButton({
    Key? key,
    required this.videoController,
  }) : super(key: key);

  final PodPlayerController videoController;
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
          if (widget.videoController.isMute) {
            widget.videoController.unMute();
            iconData = Icons.volume_up_outlined;
          } else {
            widget.videoController.mute();
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
