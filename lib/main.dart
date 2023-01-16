import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/logic/screen_home/get_south_Indian_movies.dart';
import 'package:netflix_ui/logic/screen_home/get_tense_dramas.dart';
import 'package:netflix_ui/logic/screen_home/get_top10_tv_shows.dart';
import 'package:netflix_ui/logic/screen_home/get_trending_now.dart';
import 'package:netflix_ui/logic/screen_home/loop_main_poster.dart';
import 'package:netflix_ui/logic/screen_new_and_hot/get_coming_soon_movies.dart';
import 'package:netflix_ui/logic/screen_new_and_hot/get_everyones_watching_movies.dart';
import 'package:netflix_ui/presentation/screen_main/screen_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]); //To turn off screen rotation for the app
    getTrendingNowData();
    getTop10TvShows();
    loopMainPoster();
    getTenseDramasData();
    getSouthIndianMoviesData();
    getComingSoonMoviesData();
    getEveryonesWatchingMoviesData();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          backgroundColor: colorBackground,
          scaffoldBackgroundColor: colorBackground,
          textTheme: const TextTheme(
              bodyText1: TextStyle(color: colorText),
              bodyText2: TextStyle(color: colorText))),
      home: ScreenMain(),
    );
  }
}
