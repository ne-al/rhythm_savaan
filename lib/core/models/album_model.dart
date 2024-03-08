import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rhythm_savaan/core/models/helper_models/image_model.dart';
import 'package:rhythm_savaan/core/models/helper_models/songs_model.dart';

part 'album_model.freezed.dart';
part 'album_model.g.dart';

@freezed
class AlbumModel with _$AlbumModel {
  const AlbumModel._();
  const factory AlbumModel({
    required String id,
    required String name,
    @Default('') String type,
    @Default('0') String songCount,
    required String url,
    @Default([]) List<ImageModel?> image,
    @Default([]) List<SongsModel?> songs,
  }) = _AlbumModel;

  factory AlbumModel.fromJson(Map<String, dynamic> data) =>
      _$AlbumModelFromJson(data);
}
