import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/data/screen_home/trending_now_model.dart';

import 'package:netflix_ui/presentation/widgets/Widget_title.dart';
import 'package:netflix_ui/presentation/widgets/poster_card.dart';

class CardsScrollView extends StatelessWidget {
  const CardsScrollView({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  final String title;
  final TrendingNowModel? data;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetTitle(title),
        kGapHeight10,
        SizedBox(
          height: size.width / 2.2,
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => data == null
                  ? SizedBox(
                      width: size.width / 2.2,
                      child: const CircularProgressIndicator(
                        color: colorText,
                      ))
                  : PosterCard(imageUrl: data!.imageUrls[index]),
              separatorBuilder: (context, index) => kGapWidth10,
              itemCount: 10),
        )
      ],
    );
  }
}
