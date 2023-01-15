import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/presentation/widgets/custom_network_image.dart';

class EveryonesWatchingMovieDescription extends StatelessWidget {
  const EveryonesWatchingMovieDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomNetworkImage(
          "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/33j33midGw49BBxiqlNZeZ6PZ0O.jpg",
          placeholderWidth: size.width,
          placeholderHeight: 200,
        ),
        kGapHeight20,
        Row(
          children: [
            Expanded(
              child: Text(
                "WandaVision",
                style: TextStyle(
                    fontSize: kFontSizeMovieTitle, fontWeight: FontWeight.bold),
              ),
            ),
            kGapWidth20,
            const _VerticalIconButton(
              iconData: Icons.send_outlined,
              iconSize: 30,
              title: "Share",
            ),
            kGapWidth10,
            const _VerticalIconButton(
              iconData: Icons.add,
              iconSize: 30,
              title: "My List",
            ),
            kGapWidth10,
            const _VerticalIconButton(
              iconData: CupertinoIcons.play_arrow_solid,
              iconSize: 30,
              title: "Play",
            ),
            kGapWidth10,
          ],
        ),
        kGapHeight10,
        const Text(
          "WandaVision",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kGapHeight10,
        const Text(
          "Wanda Maximoff and Vision—two super-powered beings living idealized suburban lives—begin to suspect that everything is not as it seems.",
        ),
        kGapHeight20,
        kGapHeight10,
      ],
    );
  }
}

class _VerticalIconButton extends StatelessWidget {
  const _VerticalIconButton(
      {Key? key,
      required this.iconData,
      required this.title,
      this.iconSize = 25})
      : super(key: key);
  final IconData iconData;
  final String title;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: colorIcon,
          size: iconSize,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
