import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_ui/core/tmdb_api_url.dart';
import 'package:netflix_ui/data/screen_downloads/download_images_model.dart';

//:::::::::::::::;
Rx<DownloadsImagesModel?> downloadImagesModel = Rxn<DownloadsImagesModel>();
//::::::::
void getDownloadsImages() async {
  try {
    var response = await http.get(Uri.parse(TmdbApiUrl.downloadUrl));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      downloadImagesModel.value = DownloadsImagesModel.fromJson(json);
    }
  } catch (e) {
    log("getDownloadsImages: Failed to load Data!");
  }
}
