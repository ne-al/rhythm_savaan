import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/image_model.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/songs_model.dart';

part 'playlist_model.freezed.dart';
part 'playlist_model.g.dart';

@freezed
class SaavanPlaylistModel with _$SaavanPlaylistModel {
  const SaavanPlaylistModel._();
  const factory SaavanPlaylistModel({
    required String id,
    @Default('') String title,
    @Default('') String name,
    @Default('') String type,
    @Default([]) List<ImageModel> image,
    @Default([]) List<SongsModel> songs,
  }) = _SaavanPlaylistModel;

  factory SaavanPlaylistModel.fromJson(Map<String, dynamic> data) =>
      _$SaavanPlaylistModelFromJson(data);
}
