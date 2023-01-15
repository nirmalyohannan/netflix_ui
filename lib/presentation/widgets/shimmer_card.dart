import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    Key? key,
    required this.placeholderHeight,
    this.width,
    required this.placeholderWidth,
  }) : super(key: key);

  final double? placeholderHeight;
  final double? width;
  final double? placeholderWidth;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: colorText.withOpacity(0.3),
      highlightColor: colorText.withOpacity(0.4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: placeholderHeight,
        width: width ?? placeholderWidth,
      ),
    );
  }
}
