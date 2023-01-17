import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/data/screen_search/search_list_model.dart';
import 'package:netflix_ui/logic/screen_search/get_search_result.dart';
import 'package:netflix_ui/presentation/screen_search/widgets/search_inactive.dart';
import 'package:netflix_ui/presentation/screen_search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

TextEditingController searchController = TextEditingController();

class _ScreenSearchState extends State<ScreenSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            controller: searchController,
            style: const TextStyle(color: colorText),
            backgroundColor: Colors.grey[900],
            itemColor: Colors.grey,
            onChanged: (value) {
              setState(() {
                log("Starting Search");
                getSearchResult(value);
              });
            },
          ),
          Obx(() {
            SearchListModel? searchData = searchResultData.value;

            return searchController.text.isEmpty
                ? const WidgetSearchInactive()
                : searchData == null
                    ? const SizedBox()
                    : WidgetSearchResult(
                        data: searchResultData.value!.movieModelList,
                      );
          })
        ],
      ),
    );
  }
}
