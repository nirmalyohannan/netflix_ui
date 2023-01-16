import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/presentation_constants.dart';

class VideoInteractButton extends StatelessWidget {
  const VideoInteractButton({
    Key? key,
    required this.iconData,
    required this.buttonName,
    required this.onPressed,
  }) : super(key: key);
  final IconData iconData;
  final String buttonName;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          kGapHeight20,
          kGapHeight20,
          Icon(
            iconData,
            size: 35,
            color: colorIcon,
            shadows: const [
              Shadow(
                  color: Colors.black45, blurRadius: 20.0, offset: Offset(3, 3))
            ],
          ),
          Text(buttonName)
        ],
      ),
    );
  }
}
