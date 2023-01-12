import 'package:flutter/material.dart';

class PosterCard extends StatelessWidget {
  const PosterCard({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
