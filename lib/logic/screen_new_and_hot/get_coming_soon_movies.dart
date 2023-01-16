import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_ui/core/tmdb_api_url.dart';

import 'package:netflix_ui/data/screen_new_and_hot/coming_soon_movies_model.dart';

//:::::::::::::::;
Rx<ComingSoonMoviesModel?> comingSoonMoviesData = Rxn<ComingSoonMoviesModel?>();
//::::::::
void getComingSoonMoviesData() async {
  try {
    var response = await http.get(Uri.parse(TmdbApiUrl.upcomingMoviesUrl));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      comingSoonMoviesData.value = ComingSoonMoviesModel.fromJson(json);
    }
  } catch (e) {
    log("getComingSoonMoviesData: Failed to load Data!");
  }
}
