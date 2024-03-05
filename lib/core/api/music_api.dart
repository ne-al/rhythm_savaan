import 'dart:convert';

import 'package:dio/dio.dart';

class MusicApi {
  final dio = Dio();
  final String api = "https://saavn.dev";

  //'/albums?id=1142502'
  //! fetch song recommendation
  Future<void> fetchSongRecommendation() async {
    String apiUrl = '$api/albums';
    var response = await dio.get(apiUrl, queryParameters: {'id': 1142502});
    var d = jsonDecode(response.data);
    return d;
  }

  //! query song

  //! fetch song details
}
