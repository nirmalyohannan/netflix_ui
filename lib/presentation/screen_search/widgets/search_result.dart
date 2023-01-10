import 'package:flutter/material.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/screen_search/widgets/search_title.dart';

class WidgetSearchResult extends StatelessWidget {
  const WidgetSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapHeight10,
          const SearchTitle("Result"),
          gapHeight10,
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 2 / 3,
              children: List.generate(
                  10,
                  (index) => ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                            "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7WUHnWGx5OO145IRxPDUkQSh4C7.jpg"),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
