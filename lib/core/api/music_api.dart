import 'package:dio/dio.dart';
import 'package:rhythm_savaan/core/models/freezed_models/album_model.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/songs_model.dart';

class MusicApi {
  final dio = Dio();
  final String api = "https://saavn.dev";

  //! fetch album by its id
  Future<AlbumModel> getSongFromAlbumId(int albumId) async {
    String apiUrl = '$api/albums';
    var response = await dio.get(apiUrl, queryParameters: {'id': albumId});
    Map<String, dynamic> data = response.data;

    return AlbumModel.fromJson(data['data']);
  }

  //! query song
  Future<List<SongsModel>> querySong(String query) async {
    var response = await dio.get('$api/search/songs', queryParameters: {
      'query': query,
      'page': 1,
      'limit': 15,
    });

    List<SongsModel> songs = [];
    Map<String, dynamic> data = response.data;

    for (var item in data['data']['results']) {
      songs.add(SongsModel.fromJson(item));
    }

    return songs;
  }

  //! fetch song details
}
