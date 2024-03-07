// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primary_artists_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrimaryArtistsModelImpl _$$PrimaryArtistsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PrimaryArtistsModelImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      url: json['url'] as String? ?? '',
      image: (json['image'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      type: json['type'] as String? ?? '',
      role: json['role'] as String? ?? '',
    );

Map<String, dynamic> _$$PrimaryArtistsModelImplToJson(
        _$PrimaryArtistsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'image': instance.image?.map((e) => e?.toJson()).toList(),
      'type': instance.type,
      'role': instance.role,
    };
