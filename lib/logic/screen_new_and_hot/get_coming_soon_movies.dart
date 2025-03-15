import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_ui/core/tmdb_api_url.dart';

import 'package:netflix_ui/data/model/movies_list_model.dart';

//:::::::::::::::;
Rx<MoviesListModel?> comingSoonMoviesData = Rxn<MoviesListModel?>();
//::::::::
void getComingSoonMoviesData() async {
  try {
    var response = await http.get(Uri.parse(TmdbApiUrl.upcomingMoviesUrl));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var moviesListModel = MoviesListModel.fromJson(json);
      moviesListModel.movieModelList
          .removeWhere((element) => element.imageUrl.contains("null"));
      comingSoonMoviesData.value = moviesListModel;
    }
  } catch (e) {
    log("getComingSoonMoviesData: Failed to load Data!");
  }
}
