import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/presentation/widgets/custom_network_image.dart';

class HomeScreenMainPoster extends StatelessWidget {
  const HomeScreenMainPoster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomNetworkImage(
          "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/sv1xJUazXeYqALzczSZ3O6nkH75.jpg",
          width: MediaQuery.of(context).size.width,
          placeholderHeight: 400,
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
