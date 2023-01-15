import 'package:get/get.dart';
import 'package:netflix_ui/logic/screen_home/get_trending_now.dart';

Rx<String?> mainPosterUrl = Rxn<String?>();

Future<void> loopMainPoster() async {
  while (trendingNowModel.value == null) {
    await Future.delayed(const Duration(seconds: 1));
  }
  // int length = trendingNowModel.value!.imageUrls.length;
  for (int index = 0; index < 10; index++) {
    mainPosterUrl.value = trendingNowModel.value!.imageUrls[index];
    await Future.delayed(const Duration(seconds: 4));
    index = index == 9 ? 0 : index;
  }
}
