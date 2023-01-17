import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_ui/core/tmdb_api_url.dart';
import 'package:netflix_ui/data/screen_search/search_list_model.dart';

//:::::::::::::::;
Rx<SearchListModel?> searchResultData = Rxn<SearchListModel?>();
//::::::::
void getSearchResult(String query) async {
  try {
    var response =
        await http.get(Uri.parse("${TmdbApiUrl.searchBaseUrl}$query"));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      searchResultData.value = SearchListModel.fromJson(json);
    }
  } catch (e) {
    log("getSearchResult: Failed to load Data!");
    e.printError();
  }
}
