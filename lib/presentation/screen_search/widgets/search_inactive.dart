import 'package:flutter/cupertino.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/screen_search/widgets/search_title.dart';

class WidgetSearchInactive extends StatelessWidget {
  const WidgetSearchInactive({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kGapHeight10,
          const SearchTitle("Top Searches"),
          kGapHeight10,
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) =>
                  kGapHeight10,
              itemBuilder: (BuildContext context, int index) =>
                  const TopSearchTile(),
            ),
          ),
        ],
      ),
    );
  }
}

class TopSearchTile extends StatelessWidget {
  const TopSearchTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/iHSwvRVsRyxpX7FE7GbviaDvgGZ.jpg",
            width: size.width / 2.5,
            fit: BoxFit.cover,
          ),
        ),
        kGapWidth10,
        const Expanded(
          child: Text(
            "Wednesday",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          color: colorIcon,
          size: 45,
        ),
        kGapWidth10
      ],
    );
  }
}
