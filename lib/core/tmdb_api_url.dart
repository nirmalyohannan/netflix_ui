import 'package:netflix_ui/core/api_key.dart';

class TmdbApiUrl {
  static const _baseUrl = "https://api.themoviedb.org/3";
  static const imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static const downloadUrl = "$_baseUrl/trending/movie/day?api_key=$apiKey";
  static const trendingNowUrl = "$_baseUrl/trending/movie/day?api_key=$apiKey";
}
