import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/logic/screen_new_and_hot/get_coming_soon_movies.dart';
import 'package:netflix_ui/presentation/screen_news_and_hot/widgets/coming_soon_movie_description.dart';
import 'package:netflix_ui/presentation/widgets/shimmer_card.dart';

class ComingSoonTabView extends StatelessWidget {
  const ComingSoonTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: kPaddingAll10,
      child: ListView.separated(
          itemBuilder: (context, index) => Obx(() =>
              comingSoonMoviesData.value == null
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: ShimmerCard(
                          placeholderHeight: size.width,
                          placeholderWidth: size.width),
                    )
                  : ComingSoonMovieDescription(
                      data: comingSoonMoviesData.value!.movieModelList[index])),
          separatorBuilder: (context, index) => kGapHeight10,
          itemCount: 10),
    );
  }
}
