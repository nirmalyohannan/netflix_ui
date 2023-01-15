import 'package:netflix_ui/core/tmdb_api_url.dart';

class TrendingNowModel {
  List<String> imageUrls = [];

  TrendingNowModel(this.imageUrls);

  TrendingNowModel.fromJson(Map<String, dynamic> json) {
    for (int index = 0; index < json["results"].length; index++) {
      imageUrls.add(
          "${TmdbApiUrl.imageBaseUrl}${json["results"][index]["poster_path"]}");
    }
  }
}
