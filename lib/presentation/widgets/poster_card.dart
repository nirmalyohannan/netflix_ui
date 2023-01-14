import 'package:flutter/material.dart';
import 'package:netflix_ui/presentation/widgets/custom_network_image.dart';

class PosterCard extends StatelessWidget {
  const PosterCard({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CustomNetworkImage(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
