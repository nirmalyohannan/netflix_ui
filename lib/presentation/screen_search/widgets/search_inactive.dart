import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/presentation_constants.dart';
import 'package:netflix_ui/data/model/movies_list_model.dart';
import 'package:netflix_ui/logic/screen_home/get_trending_now.dart';
import 'package:netflix_ui/logic/screen_new_and_hot/get_everyones_watching_movies.dart';
import 'package:netflix_ui/presentation/widgets/shimmer_card.dart';
import 'package:netflix_ui/presentation/widgets/widget_title.dart';

class WidgetSearchInactive extends StatelessWidget {
  const WidgetSearchInactive({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kGapHeight10,
          const WidgetTitle("Top Searches"),
          kGapHeight10,
          Expanded(
            child: Obx(
              (() {
                bool isDataLoaded = everyonesWatchingMoviesData.value != null;

                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: isDataLoaded
                      ? everyonesWatchingMoviesData.value!.movieModelList.length
                      : 10,
                  separatorBuilder: (BuildContext context, int index) =>
                      kGapHeight10,
                  itemBuilder: (BuildContext context, int index) => isDataLoaded
                      ? TopSearchTile(
                          data: everyonesWatchingMoviesData
                              .value!.movieModelList[index],
                        )
                      : ShimmerCard(
                          placeholderHeight: 150,
                          placeholderWidth:
                              MediaQuery.of(context).size.width - 20),
                );
              }),
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
    required this.data,
  }) : super(key: key);
  final MovieModel data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            data.imageUrl,
            width: size.width / 2.5,
            fit: BoxFit.cover,
          ),
        ),
        kGapWidth10,
        Expanded(
          child: Text(
            data.movieName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
