import 'package:flutter/material.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/screen_news_and_hot/widgets/everyones_watching_movie_description.dart';

class EveryonesWatchingTabView extends StatelessWidget {
  const EveryonesWatchingTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingAll10,
      child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => kGapHeight10,
          itemBuilder: (context, index) =>
              const EveryonesWatchingMovieDescription()),
    );
  }
}
