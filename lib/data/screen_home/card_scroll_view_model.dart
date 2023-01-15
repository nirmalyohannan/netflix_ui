import 'package:netflix_ui/core/tmdb_api_url.dart';

class CardScrollViewModel {
  List<String> imageUrls = [];

  CardScrollViewModel(this.imageUrls);

  CardScrollViewModel.fromJson(Map<String, dynamic> json) {
    for (int index = 0; index < json["results"].length; index++) {
      imageUrls.add(
          "${TmdbApiUrl.imageBaseUrl}${json["results"][index]["poster_path"]}");
    }
  }
}
