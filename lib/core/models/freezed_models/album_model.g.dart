// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumModelImpl _$$AlbumModelImplFromJson(Map<String, dynamic> json) =>
    _$AlbumModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String? ?? '',
      songCount: json['songCount'] as String? ?? '0',
      url: json['url'] as String,
      image: (json['image'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      songs: (json['songs'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : SongsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AlbumModelImplToJson(_$AlbumModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'songCount': instance.songCount,
      'url': instance.url,
      'image': instance.image.map((e) => e?.toJson()).toList(),
      'songs': instance.songs.map((e) => e?.toJson()).toList(),
    };
