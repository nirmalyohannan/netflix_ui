import 'package:netflix_ui/core/tmdb_api_url.dart';

class ComingSoonMoviesModel {
  List<MovieModel> movieModels = [];

  ComingSoonMoviesModel(this.movieModels);

  ComingSoonMoviesModel.fromJson(Map<String, dynamic> json) {
    for (int index = 0; index < json["results"].length; index++) {
      movieModels.add(
        MovieModel(
          json["results"][index]["title"],
          "${TmdbApiUrl.imageBaseUrl}${json["results"][index]["backdrop_path"]}",
          json["results"][index]["overview"],
          ReleaseDate.fromString(json["results"][index]["release_date"]),
        ),
      );
    }
  }
}

class MovieModel {
  String imageUrl;
  String movieName;
  String descriptions;
  ReleaseDate releaseDate;
  MovieModel(
      this.movieName, this.imageUrl, this.descriptions, this.releaseDate);
}

class ReleaseDate {
  String year = '';
  String month = '';
  String date = '';
  final List _months = [
    'JAN',
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ];
  ReleaseDate.fromString(String yyMmDd) {
    List temp = yyMmDd.split("-");
    year = temp[0];
    month = _months[int.parse(temp[1]) - 1];
    date = temp[2];
  }
}
