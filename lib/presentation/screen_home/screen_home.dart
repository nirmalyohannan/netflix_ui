import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/presentation/screen_home/widgets/cards_scroll_view.dart';
import 'package:netflix_ui/presentation/screen_home/widgets/home_screen_app_bar.dart';
import 'package:netflix_ui/presentation/screen_home/widgets/home_screen_main_poster.dart';
import 'package:netflix_ui/presentation/screen_home/widgets/number_cards_scroll_view.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    var scrollNotifier = true.obs;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection scrollDirection = notification.direction;

          if (scrollDirection == ScrollDirection.reverse) {
            scrollNotifier.value = false;
          } else if (scrollDirection == ScrollDirection.forward) {
            scrollNotifier.value = true;
          }
          return true;
        },
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                const HomeScreenMainPoster(),
                const CardsScrollView(title: "Released in the Past Year"),
                const NumberCardsScrollView(title: "Top 10 Indian TV Show"),
                const CardsScrollView(title: "Trending Now"),
                const CardsScrollView(title: "Tense Dramas"),
                const CardsScrollView(title: "South Indian Cinemas"),
                kGapHeight10,
              ],
            ),
            HomeScreenAppBar(scrollNotifier: scrollNotifier),
          ],
        ),
      ),
    );
  }
}
