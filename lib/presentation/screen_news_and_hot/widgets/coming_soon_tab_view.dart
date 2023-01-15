import 'package:flutter/material.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/presentation/screen_news_and_hot/widgets/coming_soon_movie_description.dart';

class ComingSoonTabView extends StatelessWidget {
  const ComingSoonTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingAll10,
      child: ListView.separated(
          itemBuilder: (context, index) => const ComingSoonMovieDescription(),
          separatorBuilder: (context, index) => kGapHeight10,
          itemCount: 10),
    );
  }
}
