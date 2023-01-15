import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_ui/core/tmdb_api_url.dart';

import 'package:netflix_ui/data/screen_home/trending_now_model.dart';

//:::::::::::::::;
Rx<TrendingNowModel?> trendingNowModel = Rxn<TrendingNowModel?>();
//::::::::
void getTrendingNowData() async {
  try {
    var response = await http.get(Uri.parse(TmdbApiUrl.trendingNowUrl));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      trendingNowModel.value = TrendingNowModel.fromJson(json);
    }
  } catch (e) {
    log("getTrendingNow: Failed to load Data!");
  }
}
