import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_url_model.freezed.dart';
part 'download_url_model.g.dart';

@freezed
class DownloadUrlModel with _$DownloadUrlModel {
  const DownloadUrlModel._();
  const factory DownloadUrlModel({
    required String quality,
    required String link,
  }) = _DownloadUrlModel;

  factory DownloadUrlModel.fromJson(Map<String, dynamic> data) =>
      _$DownloadUrlModelFromJson(data);
}
