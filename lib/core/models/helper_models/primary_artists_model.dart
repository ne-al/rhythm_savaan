import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rhythm_savaan/core/models/helper_models/image_model.dart';

part 'primary_artists_model.freezed.dart';
part 'primary_artists_model.g.dart';

@freezed
class PrimaryArtistsModel with _$PrimaryArtistsModel {
  const PrimaryArtistsModel._();
  const factory PrimaryArtistsModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String url,
    @Default([]) List<ImageModel?>? image,
    @Default('') String type,
    @Default('') String role,
  }) = _PrimaryArtistsModel;

  factory PrimaryArtistsModel.fromJson(Map<String, dynamic> data) =>
      _$PrimaryArtistsModelFromJson(data);
}
