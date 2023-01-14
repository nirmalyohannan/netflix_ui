import 'package:flutter/material.dart';
import 'package:netflix_ui/core/constants.dart';

import 'package:netflix_ui/presentation/widgets/Widget_title.dart';
import 'package:netflix_ui/presentation/widgets/poster_card.dart';

class CardsScrollView extends StatelessWidget {
  const CardsScrollView({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetTitle(title),
        kGapHeight10,
        SizedBox(
          height: MediaQuery.of(context).size.width / 2.2,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const PosterCard(
                  imageUrl:
                      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7WUHnWGx5OO145IRxPDUkQSh4C7.jpg"),
              separatorBuilder: (context, index) => kGapWidth10,
              itemCount: 10),
        )
      ],
    );
  }
}
