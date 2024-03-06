// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaavanPlaylistModelImpl _$$SaavanPlaylistModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SaavanPlaylistModelImpl(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      image: (json['image'] as List<dynamic>?)
              ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      songs: (json['songs'] as List<dynamic>?)
              ?.map((e) => SongsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SaavanPlaylistModelImplToJson(
        _$SaavanPlaylistModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'name': instance.name,
      'type': instance.type,
      'image': instance.image.map((e) => e.toJson()).toList(),
      'songs': instance.songs.map((e) => e.toJson()).toList(),
    };
