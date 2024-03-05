// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumModelImpl _$$AlbumModelImplFromJson(Map<String, dynamic> json) =>
    _$AlbumModelImpl(
      name: json['name'] as String,
      year: json['year'] as String,
      releaseDate: json['releaseDate'] as String,
      songCount: json['songCount'] as String,
      url: json['url'] as String,
      primaryArtistsId: json['primaryArtistsId'] as String,
      primaryArtists: json['primaryArtists'] as String,
      image: (json['image'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      songs: (json['songs'] as List<dynamic>)
          .map((e) => SongsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AlbumModelImplToJson(_$AlbumModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'year': instance.year,
      'releaseDate': instance.releaseDate,
      'songCount': instance.songCount,
      'url': instance.url,
      'primaryArtistsId': instance.primaryArtistsId,
      'primaryArtists': instance.primaryArtists,
      'image': instance.image.map((e) => e.toJson()).toList(),
      'songs': instance.songs.map((e) => e.toJson()).toList(),
    };
