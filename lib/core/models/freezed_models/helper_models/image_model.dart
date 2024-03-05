import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  const ImageModel._();
  const factory ImageModel({
    required String quality,
    required String link,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> data) =>
      _$ImageModelFromJson(data);
}
