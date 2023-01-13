import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/screen_home/widgets/cards_scroll_view.dart';
import 'package:netflix_ui/presentation/screen_home/widgets/home_screen_app_bar.dart';
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

class HomeScreenMainPoster extends StatelessWidget {
  const HomeScreenMainPoster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image.network(
          filterQuality: FilterQuality.high,
          "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/sv1xJUazXeYqALzczSZ3O6nkH75.jpg",
          width: MediaQuery.of(context).size.width,
        ),
        const _HomeScreenMainPosterBottomOptions()
      ],
    );
  }
}

class _HomeScreenMainPosterBottomOptions extends StatelessWidget {
  const _HomeScreenMainPosterBottomOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black.withOpacity(0),
          Colors.black,
          Colors.black,
        ],
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [_MyListButton(), _PlayButton(), _InfoButton()],
      ),
    );
  }
}

class _InfoButton extends StatelessWidget {
  const _InfoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(
          Icons.info_outline,
          color: colorIcon,
        ),
        Text("Info"),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: colorButtonWhite,
      onPressed: () {},
      child: Row(
        children: const [
          Icon(
            Icons.play_arrow,
            size: 30,
          ),
          Text(
            "Play",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class _MyListButton extends StatelessWidget {
  const _MyListButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(
          Icons.add,
          color: colorIcon,
        ),
        Text("My List"),
      ],
    );
  }
}
