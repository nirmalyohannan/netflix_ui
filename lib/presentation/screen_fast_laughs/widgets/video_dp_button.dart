import 'package:cached_network_image/cached_network_image.dart';
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
        foregroundImage: CachedNetworkImageProvider(imageUrl),
        radius: 25,
      ),
    );
  }
}
