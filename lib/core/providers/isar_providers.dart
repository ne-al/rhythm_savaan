import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rhythm_savaan/core/api/music_api.dart';
import 'package:rhythm_savaan/core/collections/playlist_model.dart';
import 'package:rhythm_savaan/core/models/helper_models/songs_model.dart';
import 'package:rhythm_savaan/core/services/isar_services.dart';

final lastSessionProvider = StreamProvider.autoDispose((ref) {
  return IsarServices().watchLastSession();
});

final lastSessionSongByIdsProvider = StreamProvider.family
    .autoDispose<List<SongsModel>, String>((ref, songsIds) async* {
  yield await MusicApi().getSongsFromSongIds(songsIds);
});

final getAllPlaylistProvider =
    StreamProvider.autoDispose<List<PlaylistModel>>((ref) {
  return IsarServices().getAllPlaylist();
});

final isSongLikedProvider =
    StreamProvider.family.autoDispose<bool, String>((ref, songId) {
  return IsarServices().isSongLiked(songId);
});
