import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/download_url_model.dart';
import 'package:rhythm_savaan/core/models/freezed_models/helper_models/image_model.dart';

part 'songs_model.freezed.dart';
part 'songs_model.g.dart';

@freezed
class SongsModel with _$SongsModel {
  const SongsModel._();
  const factory SongsModel({
    required String id,
    required String name,
    required String duration,
    @Default('Unknown') String primaryArtists,
    @Default('Unknown') String primaryArtistsId,
    @Default('Unknown') String language,
    @Default('false') String hasLyrics,
    @Default('') String url,
    @Default('') String copyright,
    required List<ImageModel> image,
    required List<DownloadUrlModel> downloadUrl,
  }) = _SongsModel;

  factory SongsModel.fromJson(Map<String, dynamic> data) =>
      _$SongsModelFromJson(data);
}
