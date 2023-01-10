import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/presentation/screen_search/widgets/search_inactive.dart';
import 'package:netflix_ui/presentation/screen_search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            style: const TextStyle(color: textColor),
            backgroundColor: Colors.grey[900],
            itemColor: Colors.grey,
          ),
          // const WidgetSearchInactive(),
          const WidgetSearchResult()
        ],
      ),
    );
  }
}
