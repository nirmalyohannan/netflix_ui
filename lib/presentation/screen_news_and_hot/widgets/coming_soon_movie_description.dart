import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/data/model/movies_list_model.dart';
import 'package:netflix_ui/presentation/widgets/custom_network_image.dart';

class ComingSoonMovieDescription extends StatelessWidget {
  const ComingSoonMovieDescription({Key? key, required this.data})
      : super(key: key);

  final MovieModel data;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LeftSideDateSection(width: 30, data: data),
        kGapWidth10,
        _RightSideMovieSection(
            width: size.width - 30 - 30,
            data: data) //remaining space for the section
      ],
    );
  }
}

class _RightSideMovieSection extends StatelessWidget {
  const _RightSideMovieSection({
    Key? key,
    required this.width,
    required this.data,
  }) : super(key: key);

  final double width;
  final MovieModel data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
            data.imageUrl,
            width: width,
            placeholderHeight: 200,
          ),
          kGapHeight20,
          Row(
            children: [
              Expanded(
                child: Text(
                  data.movieName,
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
          kGapHeight10,
          const Text("Coming on Friday"),
          kGapHeight10,
          Text(
            data.movieName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          kGapHeight10,
          Text(
            data.descriptions,
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
  const _LeftSideDateSection({
    Key? key,
    required this.width,
    required this.data,
  }) : super(key: key);
  final double width;
  final MovieModel data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Text(
            data.releaseDate.month,
            style: TextStyle(
                fontSize: kFontSizeHeadLine1 - 8,
                letterSpacing: -1,
                fontWeight: FontWeight.bold,
                color: colorTextGrey),
          ),
          Text(
            data.releaseDate.date,
            style: TextStyle(
                fontSize: kFontSizeAppBarTitle - 6,
                fontWeight: FontWeight.bold,
                letterSpacing: -1),
          )
        ],
      ),
    );
  }
}
