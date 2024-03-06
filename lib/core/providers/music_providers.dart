import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rhythm_savaan/core/api/music_api.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/songs_model.dart';

final searchProvider = FutureProvider.family
    .autoDispose<List<SongsModel>, String>((ref, query) async {
  var response = await MusicApi().querySong(query);
  return response;
});
