import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_ui/core/api_key.dart';
import 'package:netflix_ui/core/tmdb_api_url.dart';

import 'package:netflix_ui/data/model/movies_list_model.dart';

//:::::::::::::::;
Rx<MoviesListModel?> everyonesWatchingMoviesData = Rxn<MoviesListModel?>();
var trailerUrlList = [].obs;
//::::::::
void getEveryonesWatchingMoviesData() async {
  try {
    var response = await http.get(Uri.parse(TmdbApiUrl.nowPlayingUrl));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      MoviesListModel moviesListModel = MoviesListModel.fromJson(json);
      everyonesWatchingMoviesData.value = moviesListModel;
      //::::::::::::::::::::::::::::::::
      for (var element in moviesListModel.movieModelList) {
        String uri =
            "${TmdbApiUrl.baseUrl}/movie/${element.id}/videos?api_key=$apiKey";
        var response = await http.get(Uri.parse(uri));

        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);
          String key = json["results"][0]["key"];
          String trailerUrl = "${TmdbApiUrl.youtubeBaseUrl}$key";
          trailerUrlList.add(trailerUrl);
        }
      }
    }
  } catch (e) {
    log("getEveryonesWatchingMoviesData: Failed to load Data!");
  }
}
