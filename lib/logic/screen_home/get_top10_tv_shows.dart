import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_ui/core/tmdb_api_url.dart';

import 'package:netflix_ui/data/screen_home/card_scroll_view_model.dart';

//:::::::::::::::;
Rx<CardScrollViewModel?> top10TvShows = Rxn<CardScrollViewModel?>();
//::::::::
void getTop10TvShows() async {
  try {
    var response = await http.get(Uri.parse(TmdbApiUrl.top10TvShowsUrl));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      top10TvShows.value = CardScrollViewModel.fromJson(json);
    }
  } catch (e) {
    log("getTop10TvShows: Failed to load Data!");
  }
}
