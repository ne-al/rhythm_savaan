import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/image_model.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/songs_model.dart';

part 'album_model.freezed.dart';
part 'album_model.g.dart';

@freezed
class AlbumModel with _$AlbumModel {
  const AlbumModel._();
  const factory AlbumModel({
    required String name,
    required String year,
    required String releaseDate,
    required String songCount,
    required String url,
    required String primaryArtistsId,
    required String primaryArtists,
    required List<ImageModel> image,
    required List<SongsModel> songs,
  }) = _AlbumModel;

  factory AlbumModel.fromJson(Map<String, dynamic> data) =>
      _$AlbumModelFromJson(data);
}
