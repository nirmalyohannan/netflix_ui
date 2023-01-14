import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/core/colors.dart';
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
