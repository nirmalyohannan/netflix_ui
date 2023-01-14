import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
    this.imageUrl, {
    super.key,
    this.width,
    this.fit,
    this.placeholderWidth = 200,
    this.placeholderHeight = 100,
  });
  final String imageUrl;
  final double? width;
  final BoxFit? fit;
  final double? placeholderHeight;
  final double? placeholderWidth;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      width: width,
      imageUrl: imageUrl,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: colorText.withOpacity(0.3),
        highlightColor: colorText.withOpacity(0.4),
        child: Container(
          color: Colors.white,
          height: placeholderHeight,
          width: width ?? placeholderWidth,
        ),
      ),
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
