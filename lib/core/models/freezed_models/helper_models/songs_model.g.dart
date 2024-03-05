// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongsModelImpl _$$SongsModelImplFromJson(Map<String, dynamic> json) =>
    _$SongsModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      duration: json['duration'] as String,
      primaryArtists: json['primaryArtists'] as String? ?? 'Unknown',
      primaryArtistsId: json['primaryArtistsId'] as String? ?? 'Unknown',
      language: json['language'] as String? ?? 'Unknown',
      hasLyrics: json['hasLyrics'] as String? ?? 'false',
      url: json['url'] as String? ?? '',
      copyright: json['copyright'] as String? ?? '',
      image: (json['image'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      downloadUrl: (json['downloadUrl'] as List<dynamic>)
          .map((e) => DownloadUrlModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SongsModelImplToJson(_$SongsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'primaryArtists': instance.primaryArtists,
      'primaryArtistsId': instance.primaryArtistsId,
      'language': instance.language,
      'hasLyrics': instance.hasLyrics,
      'url': instance.url,
      'copyright': instance.copyright,
      'image': instance.image.map((e) => e.toJson()).toList(),
      'downloadUrl': instance.downloadUrl.map((e) => e.toJson()).toList(),
    };
