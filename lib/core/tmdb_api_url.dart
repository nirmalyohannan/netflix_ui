import 'package:netflix_ui/core/api_key.dart';

class TmdbApiUrl {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static const youtubeBaseUrl = "https://www.youtube.com/watch?v=";
  static const downloadUrl = "$baseUrl/trending/movie/day?api_key=$apiKey";
  static const trendingNowUrl = "$baseUrl/trending/movie/day?api_key=$apiKey";
  static const top10TvShowsUrl = "$baseUrl/tv/popular?api_key=$apiKey";
  static const topRatedMoviesUrls = "$baseUrl/movie/top_rated?api_key=$apiKey";
  static const upcomingMoviesUrl = "$baseUrl/movie/upcoming?api_key=$apiKey";
  static const popularMoviesUrl = "$baseUrl/movie/popular?api_key=$apiKey";
  static const nowPlayingUrl = "$baseUrl/movie//now_playing?api_key=$apiKey";
  static const searchBaseUrl = "$baseUrl/search/multi?api_key=$apiKey&query=";
}
