import 'package:flutter/material.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/screen_news_and_hot/widgets/coming_soon_movie_info.dart';
import 'package:netflix_ui/presentation/widgets/padding_margin_widgets.dart';

class ComingSoonTabView extends StatelessWidget {
  const ComingSoonTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingAll10(
      child: ListView.separated(
          itemBuilder: (context, index) => const ComingSoonMovieInfo(),
          separatorBuilder: (context, index) => kGapHeight10,
          itemCount: 10),
    );
  }
}
