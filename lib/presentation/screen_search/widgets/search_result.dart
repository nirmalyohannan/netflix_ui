import 'package:flutter/material.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/data/model/movies_list_model.dart';
import 'package:netflix_ui/data/screen_search/search_list_model.dart';
import 'package:netflix_ui/presentation/widgets/poster_card.dart';
import 'package:netflix_ui/presentation/widgets/widget_title.dart';

class WidgetSearchResult extends StatelessWidget {
  const WidgetSearchResult({
    super.key,
    required this.data,
  });

  final List<SearchMovieModel> data;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kGapHeight10,
          const WidgetTitle("Result"),
          kGapHeight10,
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 2 / 3,
              children: List.generate(data.length,
                  (index) => PosterCard(imageUrl: data[index].posterUrl)),
            ),
          )
        ],
      ),
    );
  }
}
