import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/presentation/widgets/shimmer_card.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
    this.imageUrl, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.placeholderWidth = 200,
    this.placeholderHeight = 100,
  });
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? placeholderHeight;
  final double? placeholderWidth;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      width: width,
      height: height,
      imageUrl: imageUrl,
      placeholder: (context, url) => ShimmerCard(
          placeholderHeight: placeholderHeight,
          width: width,
          placeholderWidth: placeholderWidth),
      // placeholder: (context, url) => SizedBox(
      //     width: width ?? 200,
      //     height: placeholderHeight ?? 200,
      //     child: const CircularProgressIndicator()),
      // progressIndicatorBuilder: (context, url, progress) => SizedBox(
      //     width: width ?? 200,
      //     height: placeholderHeight ?? 200,
      //     child: CircularProgressIndicator(
      //       value: progress.downloaded / (progress.totalSize ?? 10.0),
      //     )),
      errorWidget: (context, url, error) => const Text("Failed To Load Image"),
    );
  }
}
