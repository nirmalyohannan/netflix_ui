import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/presentation/widgets/custom_network_image.dart';

class ComingSoonMovieDescription extends StatelessWidget {
  const ComingSoonMovieDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _LeftSideDateSection(width: 30),
        kGapWidth10,
        _RightSideMovieSection(
            width: size.width - 30 - 30) //remaining space for the section
      ],
    );
  }
}

class _RightSideMovieSection extends StatelessWidget {
  const _RightSideMovieSection({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
            "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/9ijMGlJKqcslswWUzTEwScm82Gs.jpg",
            width: width,
            placeholderHeight: 200,
          ),
          kGapHeight20,
          Row(
            children: [
              Expanded(
                child: Text(
                  "Mandalorian",
                  style: TextStyle(
                      fontSize: kFontSizeMovieTitle,
                      fontWeight: FontWeight.bold),
                ),
              ),
              kGapWidth20,
              const _VerticalIconButton(
                iconData: Icons.notifications_active_outlined,
                title: "Remind Me",
              ),
              kGapWidth10,
              const _VerticalIconButton(
                iconData: Icons.info_outline,
                title: "Info",
              ),
              kGapWidth10,
            ],
          ),
          const Text("Coming on Friday"),
          kGapHeight10,
          const Text(
            "Mandalorian",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          kGapHeight10,
          const Text(
            "After the fall of the Galactic Empire, lawlessness has spread throughout the galaxy. A lone gunfighter makes his way through the outer reaches, earning his keep as a bounty hunter.",
          )
        ],
      ),
    );
  }
}

class _VerticalIconButton extends StatelessWidget {
  const _VerticalIconButton({
    Key? key,
    required this.iconData,
    required this.title,
  }) : super(key: key);
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: colorIcon,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class _LeftSideDateSection extends StatelessWidget {
  const _LeftSideDateSection({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Text(
            "FEB",
            style: TextStyle(
                fontSize: kFontSizeHeadLine1 - 8,
                fontWeight: FontWeight.bold,
                color: colorTextGrey),
          ),
          Text(
            "14",
            style: TextStyle(
              fontSize: kFontSizeAppBarTitle - 4,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
