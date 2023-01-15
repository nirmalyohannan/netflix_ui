import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/presentation/widgets/custom_network_image.dart';
import 'package:netflix_ui/presentation/widgets/shimmer_card.dart';

class HomeScreenMainPoster extends StatelessWidget {
  const HomeScreenMainPoster({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        imageUrl == null
            ? ShimmerCard(
                placeholderHeight: size.width, placeholderWidth: size.width)
            : CustomNetworkImage(
                imageUrl!,
                width: size.width,
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
