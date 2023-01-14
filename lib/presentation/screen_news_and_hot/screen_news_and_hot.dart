import 'package:flutter/material.dart';
import 'package:netflix_ui/presentation/screen_news_and_hot/widgets/coming_soon_tab_view.dart';
import 'package:netflix_ui/presentation/screen_news_and_hot/widgets/everyones_watching_tab_view.dart';
import 'package:netflix_ui/presentation/screen_news_and_hot/widgets/new_and_hot_tab_bar.dart';
import 'package:netflix_ui/presentation/widgets/custom_app_bar.dart';

class ScreenNewsAndHot extends StatelessWidget {
  const ScreenNewsAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: CustomAppBar(
              title: "New and Hot",
              // bottom: _CustomTabBar(selectedTab: selectedTab),
              bottom: NewAndHotTabBar(),
            ),
          ),
          body: TabBarView(
            children: [
              ComingSoonTabView(),
              EveryonesWatchingTabView(),
            ],
          )),
    );
  }
}
