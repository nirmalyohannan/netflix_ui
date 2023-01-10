import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/presentation/screen_downloads/screen_downloads.dart';
import 'package:netflix_ui/presentation/screen_fast_laughs/screen_fast_laughs.dart';
import 'package:netflix_ui/presentation/screen_main/widgets/bottom_nav_bar.dart';

import 'package:netflix_ui/presentation/screen_news_and_hot/screen_news_and_hot.dart';
import 'package:netflix_ui/presentation/screen_search/screen_search.dart';

import '../screen_home/screen_home.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewsAndHot(),
    const ScreenFastLaughs(),
    const ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(child: Obx(() => _pages[bottomNavBarIndex.value])),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
