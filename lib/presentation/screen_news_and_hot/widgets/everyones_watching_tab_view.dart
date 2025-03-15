import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/logic/screen_new_and_hot/get_everyones_watching_movies.dart';
import 'package:netflix_ui/presentation/screen_news_and_hot/widgets/everyones_watching_movie_description.dart';

class EveryonesWatchingTabView extends StatefulWidget {
  const EveryonesWatchingTabView({
    Key? key,
  }) : super(key: key);

  @override
  State<EveryonesWatchingTabView> createState() =>
      _EveryonesWatchingTabViewState();
}

class _EveryonesWatchingTabViewState extends State<EveryonesWatchingTabView> {
  List<FocusNode> focusNodes = [];
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (trailerUrlList.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(color: colorText),
        );
      }
      focusNodes = List.generate(trailerUrlList.length, (index) => FocusNode());
      return Padding(
        padding: kPaddingAll10,
        child: ListView.separated(
            itemCount: trailerUrlList.length,
            separatorBuilder: (context, index) => kGapHeight10,
            itemBuilder: (context, index) => EveryonesWatchingMovieDescription(
                  trailerUrl: trailerUrlList[index],
                  movieModel:
                      everyonesWatchingMoviesData.value!.movieModelList[index],
                )),
      );
    });
  }
}
