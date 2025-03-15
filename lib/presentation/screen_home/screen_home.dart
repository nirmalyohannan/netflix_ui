import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/logic/screen_home/get_south_indian_movies.dart';
import 'package:netflix_ui/logic/screen_home/get_tense_dramas.dart';
import 'package:netflix_ui/logic/screen_home/get_top10_tv_shows.dart';
import 'package:netflix_ui/logic/screen_home/get_trending_now.dart';
import 'package:netflix_ui/presentation/screen_home/widgets/cards_scroll_view.dart';
import 'package:netflix_ui/presentation/screen_home/widgets/home_screen_app_bar.dart';
import 'package:netflix_ui/presentation/screen_home/widgets/home_screen_main_poster.dart';
import 'package:netflix_ui/presentation/screen_home/widgets/number_cards_scroll_view.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  var showAppBar = true.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    listenOnScrollChange();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(() {});
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Obx(() => Stack(
            children: [
              ListView(
                shrinkWrap: true,
                controller: scrollController,
                children: [
                  const HomeScreenMainPoster(),
                  // const CardsScrollView(title: "Released in the Past Year"),
                  CardsScrollView(
                    title: "Trending Now",
                    data: trendingNowModel.value,
                  ),
                  NumberCardsScrollView(
                    title: "Top 10 Indian TV Show",
                    data: top10TvShows.value,
                  ),
                  CardsScrollView(
                    title: "Tense Dramas",
                    data: tenseDramasModel.value,
                  ),
                  CardsScrollView(
                    title: "South Indian Cinemas",
                    data: southIndianMoviesModel.value,
                  ),
                  kGapHeight10,
                ],
              ),
              showAppBar.value
                  ? const HomeScreenAppBar()
                  : const SizedBox.shrink(),
            ],
          )),
    );
  }

  void listenOnScrollChange() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.addListener(() {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          showAppBar.value = false;
        } else if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          showAppBar.value = true;
        }
      });
    });
  }
}
