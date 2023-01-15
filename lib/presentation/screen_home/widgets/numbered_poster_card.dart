import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/presentation/widgets/poster_card.dart';

class NumberedPosterCard extends StatelessWidget {
  const NumberedPosterCard({
    Key? key,
    required this.number,
    required this.imageUrl,
    this.height,
  }) : super(key: key);
  final int number;
  final String imageUrl;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width /
              2.5, //to increase the width of stack more than the poster card
        ),
        PosterCard(
          imageUrl: imageUrl,
          height: height,
        ),
        Positioned(
          left: 0,
          child: Stack(
            children: [
              Text(
                number.toString(),
                style: TextStyle(
                  fontFamily: GoogleFonts.openSans().fontFamily,
                  foreground: Paint()
                    ..strokeWidth = 6
                    ..color = colorText
                    ..style = PaintingStyle.stroke,
                  height: 0.1,
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                number.toString(),
                style: TextStyle(
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    height: 0.1,
                    fontSize: 120,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ],
          ),
        )
      ],
    );
  }
}
