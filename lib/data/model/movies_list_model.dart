import 'package:netflix_ui/core/tmdb_api_url.dart';

class MoviesListModel {
  List<MovieModel> movieModelList = [];

  MoviesListModel(this.movieModelList);

  MoviesListModel.fromJson(Map<String, dynamic> json) {
    for (int index = 0; index < json["results"].length; index++) {
      movieModelList.add(
        MovieModel(
          json["results"][index]["id"].toString(),
          json["results"][index]["title"],
          "${TmdbApiUrl.imageBaseUrl}${json["results"][index]["backdrop_path"]}",
          "${TmdbApiUrl.imageBaseUrl}${json["results"][index]["poster_path"]}",
          json["results"][index]["overview"],
          ReleaseDate.fromString(json["results"][index]["release_date"] ??
              json["results"][index]["first_air_date"]),
        ),
      );
    }
  }
}

class MovieModel {
  String id;
  String imageUrl;
  String posterUrl;
  String movieName;
  String descriptions;
  ReleaseDate releaseDate;
  MovieModel(
    this.id,
    this.movieName,
    this.imageUrl,
    this.posterUrl,
    this.descriptions,
    this.releaseDate,
  );
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
  ReleaseDate.fromString(String? yyMmDd) {
    if (yyMmDd != null) {
      List temp = yyMmDd.split("-");
      year = temp[0];
      month = _months[int.parse(temp[1]) - 1];
      date = temp[2];
    } else {
      year = "N/A";
      month = "N/A";
      date = "N/A";
    }
  }
}
