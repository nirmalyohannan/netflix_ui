import 'package:flutter/material.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/data/screen_home/card_scroll_view_model.dart';
import 'package:netflix_ui/presentation/screen_home/widgets/numbered_poster_card.dart';
import 'package:netflix_ui/presentation/widgets/Widget_title.dart';
import 'package:netflix_ui/presentation/widgets/shimmer_card.dart';

class NumberCardsScrollView extends StatelessWidget {
  const NumberCardsScrollView({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  final String title;
  final CardScrollViewModel? data;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardHeight = size.width / 2.2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetTitle(title),
        kGapHeight10,
        SizedBox(
          height: cardHeight,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => data == null
                  ? ShimmerCard(
                      placeholderHeight: cardHeight,
                      placeholderWidth: cardHeight / 1.4)
                  : NumberedPosterCard(
                      number: index + 1,
                      imageUrl: data!.imageUrls[index],
                      height: cardHeight,
                    ),
              itemCount: 10),
        )
      ],
    );
  }
}
