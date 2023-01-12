import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/presentation/widgets/poster_card.dart';

class NumberedPosterCard extends StatelessWidget {
  const NumberedPosterCard({Key? key, required this.number}) : super(key: key);
  final int number;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width /
              2.5, //to increase the width of stack more than the poster card
        ),
        const PosterCard(
            imageUrl:
                "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7WUHnWGx5OO145IRxPDUkQSh4C7.jpg"),
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
