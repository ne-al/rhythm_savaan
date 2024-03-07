import 'package:dio/dio.dart';
import 'package:rhythm_savaan/core/models/freezed_models/album_model.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/songs_model.dart';
import 'package:rhythm_savaan/core/models/freezed_models/playlist_model.dart';

class MusicApi {
  final dio = Dio();
  final String api = "https://saavn.dev";

  //! fetch home recommendation music
  Future<Map<String, dynamic>> getHomeRecommendation() async {
    String apiUrl = '$api/modules';
    var response = await dio.get(apiUrl, queryParameters: {
      'language': 'hindi,punjabi,bhojpuri,english,haryanvi'
    });
    Map<String, dynamic> data = response.data;

    return data;
  }

  //! fetch album by its id
  Future<AlbumModel> getSongFromAlbumId(int albumId) async {
    String apiUrl = '$api/albums';
    var response = await dio.get(apiUrl, queryParameters: {'id': albumId});
    Map<String, dynamic> data = response.data;

    return AlbumModel.fromJson(data['data']);
  }

  //! fetch song by its id
  Future<SongsModel> getSongFromSongId(String songId) async {
    String apiUrl = '$api/songs';
    var response = await dio.get(apiUrl, queryParameters: {'id': songId});
    Map<String, dynamic> data = response.data;

    return SongsModel.fromJson(data['data'][0]);
  }

  //! fetch songs from their id
  Future<List<SongsModel>> getSongsFromSongIds(String songId) async {
    List<SongsModel> songsList = [];
    if (songId.isNotEmpty) {
      String apiUrl = '$api/songs';
      var response = await dio.get(apiUrl, queryParameters: {'id': songId});
      Map<String, dynamic> data = response.data;

      for (var song in data['data']) {
        songsList.add(SongsModel.fromJson(song));
      }
    }

    return songsList;
  }

  //! fetch playlist by its id
  Future<SaavanPlaylistModel> getPlaylistFromPlaylistId(
      String playlistId) async {
    String apiUrl = '$api/playlists';
    var response = await dio.get(apiUrl, queryParameters: {'id': playlistId});
    Map<String, dynamic> data = response.data;

    return SaavanPlaylistModel.fromJson(data['data']);
  }

  //! query song
  Future<List<SongsModel>> querySong(String query) async {
    var response = await dio.get('$api/search/songs',
        queryParameters: {'query': query, 'page': 1, 'limit': 15});

    List<SongsModel> songs = [];
    Map<String, dynamic> data = response.data;

    for (var item in data['data']['results']) {
      songs.add(SongsModel.fromJson(item));
    }

    return songs;
  }

  //! fetch song details
}
