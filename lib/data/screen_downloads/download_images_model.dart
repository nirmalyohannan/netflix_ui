import 'package:netflix_ui/core/tmdb_api_url.dart';

class DownloadsImagesModel {
  String imageUrl1;
  String imageUrl2;
  String imageUrl3;

  DownloadsImagesModel(this.imageUrl1, this.imageUrl2, this.imageUrl3);

  DownloadsImagesModel.fromJson(Map<String, dynamic> json)
      : imageUrl1 =
            "${TmdbApiUrl.imageBaseUrl}${json["results"][0]["poster_path"]}",
        imageUrl2 =
            "${TmdbApiUrl.imageBaseUrl}${json["results"][1]["poster_path"]}",
        imageUrl3 =
            "${TmdbApiUrl.imageBaseUrl}${json["results"][2]["poster_path"]}";
}
