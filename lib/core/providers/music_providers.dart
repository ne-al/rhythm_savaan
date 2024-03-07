import 'package:audio_service/audio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rhythm_savaan/core/api/music_api.dart';
import 'package:rhythm_savaan/core/models/freezed_models/album_model.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/songs_model.dart';
import 'package:rhythm_savaan/core/models/freezed_models/playlist_model.dart';
import 'package:rhythm_savaan/main.dart';

final searchProvider = FutureProvider.family
    .autoDispose<List<SongsModel>, String>((ref, query) async {
  var response = await MusicApi().querySong(query);
  return response;
});

final repeatModeStreamProvider =
    StreamProvider.autoDispose<AudioServiceRepeatMode>((ref) {
  return audioHandler.playbackState.map((event) => event.repeatMode).distinct();
});

final albumByIdProvider =
    FutureProvider.family.autoDispose<AlbumModel, String>((ref, albumId) async {
  return await MusicApi().getSongFromAlbumId(int.parse(albumId));
});

// final trendingAlbumByIdProvider =
//     FutureProvider.family.autoDispose<AlbumModel, String>((ref, albumId) async {
//   return await MusicApi().getSongFromAlbumId(int.parse(albumId));
// });

final songByIdProvider =
    FutureProvider.family.autoDispose<SongsModel, String>((ref, songId) async {
  return await MusicApi().getSongFromSongId(songId);
});

final playlistByIdProvider = FutureProvider.family
    .autoDispose<SaavanPlaylistModel, String>((ref, playlistId) async {
  return await MusicApi().getPlaylistFromPlaylistId(playlistId);
});

final homeAlbumRecommendationProvider =
    FutureProvider.autoDispose<List<AlbumModel>>((ref) async {
  List<AlbumModel> data = [];
  var response = await MusicApi().getHomeRecommendation();

  for (var album in response['data']['albums']) {
    data.add(AlbumModel.fromJson(album));
  }

  return data;
});

final homeTrendingAlbumRecommendationProvider =
    FutureProvider.autoDispose<List<AlbumModel>>((ref) async {
  List<AlbumModel> data = [];
  var response = await MusicApi().getHomeRecommendation();

  for (var album in response['data']['trending']['albums']) {
    data.add(AlbumModel.fromJson(album));
  }

  return data;
});

final homePlaylistRecommendationProvider =
    FutureProvider.autoDispose<List<SaavanPlaylistModel>>((ref) async {
  List<SaavanPlaylistModel> data = [];
  var response = await MusicApi().getHomeRecommendation();

  for (var album in response['data']['playlists']) {
    data.add(SaavanPlaylistModel.fromJson(album));
  }

  return data;
});

final homeChartsRecommendationProvider =
    FutureProvider.autoDispose<List<SaavanPlaylistModel>>((ref) async {
  List<SaavanPlaylistModel> data = [];
  var response = await MusicApi().getHomeRecommendation();

  for (var album in response['data']['charts']) {
    data.add(SaavanPlaylistModel.fromJson(album));
  }

  return data;
});
