import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_ui/core/tmdb_api_url.dart';

import 'package:netflix_ui/data/screen_home/card_scroll_view_model.dart';

//:::::::::::::::;
Rx<CardScrollViewModel?> trendingNowModel = Rxn<CardScrollViewModel?>();
//::::::::
void getTrendingNowData() async {
  try {
    var response = await http.get(Uri.parse(TmdbApiUrl.trendingNowUrl));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      trendingNowModel.value = CardScrollViewModel.fromJson(json);
    }
  } catch (e) {
    log("getTrendingNow: Failed to load Data!");
  }
}
