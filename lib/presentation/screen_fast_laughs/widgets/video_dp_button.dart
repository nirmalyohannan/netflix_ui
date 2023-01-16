import 'package:flutter/material.dart';

class VideoDpButton extends StatelessWidget {
  const VideoDpButton({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(side: BorderSide.none),
      elevation: 8,
      shadowColor: Colors.black,
      child: CircleAvatar(
        foregroundImage: NetworkImage(imageUrl),
        radius: 25,
      ),
    );
  }
}
