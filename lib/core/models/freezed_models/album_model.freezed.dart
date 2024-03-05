// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) {
  return _AlbumModel.fromJson(json);
}

/// @nodoc
mixin _$AlbumModel {
  String get name => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;
  String get releaseDate => throw _privateConstructorUsedError;
  String get songCount => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get primaryArtistsId => throw _privateConstructorUsedError;
  String get primaryArtists => throw _privateConstructorUsedError;
  List<ImageModel> get image => throw _privateConstructorUsedError;
  List<SongsModel> get songs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumModelCopyWith<AlbumModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumModelCopyWith<$Res> {
  factory $AlbumModelCopyWith(
          AlbumModel value, $Res Function(AlbumModel) then) =
      _$AlbumModelCopyWithImpl<$Res, AlbumModel>;
  @useResult
  $Res call(
      {String name,
      String year,
      String releaseDate,
      String songCount,
      String url,
      String primaryArtistsId,
      String primaryArtists,
      List<ImageModel> image,
      List<SongsModel> songs});
}

/// @nodoc
class _$AlbumModelCopyWithImpl<$Res, $Val extends AlbumModel>
    implements $AlbumModelCopyWith<$Res> {
  _$AlbumModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? year = null,
    Object? releaseDate = null,
    Object? songCount = null,
    Object? url = null,
    Object? primaryArtistsId = null,
    Object? primaryArtists = null,
    Object? image = null,
    Object? songs = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      songCount: null == songCount
          ? _value.songCount
          : songCount // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      primaryArtistsId: null == primaryArtistsId
          ? _value.primaryArtistsId
          : primaryArtistsId // ignore: cast_nullable_to_non_nullable
              as String,
      primaryArtists: null == primaryArtists
          ? _value.primaryArtists
          : primaryArtists // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      songs: null == songs
          ? _value.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<SongsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumModelImplCopyWith<$Res>
    implements $AlbumModelCopyWith<$Res> {
  factory _$$AlbumModelImplCopyWith(
          _$AlbumModelImpl value, $Res Function(_$AlbumModelImpl) then) =
      __$$AlbumModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String year,
      String releaseDate,
      String songCount,
      String url,
      String primaryArtistsId,
      String primaryArtists,
      List<ImageModel> image,
      List<SongsModel> songs});
}

/// @nodoc
class __$$AlbumModelImplCopyWithImpl<$Res>
    extends _$AlbumModelCopyWithImpl<$Res, _$AlbumModelImpl>
    implements _$$AlbumModelImplCopyWith<$Res> {
  __$$AlbumModelImplCopyWithImpl(
      _$AlbumModelImpl _value, $Res Function(_$AlbumModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? year = null,
    Object? releaseDate = null,
    Object? songCount = null,
    Object? url = null,
    Object? primaryArtistsId = null,
    Object? primaryArtists = null,
    Object? image = null,
    Object? songs = null,
  }) {
    return _then(_$AlbumModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      songCount: null == songCount
          ? _value.songCount
          : songCount // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      primaryArtistsId: null == primaryArtistsId
          ? _value.primaryArtistsId
          : primaryArtistsId // ignore: cast_nullable_to_non_nullable
              as String,
      primaryArtists: null == primaryArtists
          ? _value.primaryArtists
          : primaryArtists // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      songs: null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<SongsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumModelImpl extends _AlbumModel {
  const _$AlbumModelImpl(
      {required this.name,
      required this.year,
      required this.releaseDate,
      required this.songCount,
      required this.url,
      required this.primaryArtistsId,
      required this.primaryArtists,
      required final List<ImageModel> image,
      required final List<SongsModel> songs})
      : _image = image,
        _songs = songs,
        super._();

  factory _$AlbumModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumModelImplFromJson(json);

  @override
  final String name;
  @override
  final String year;
  @override
  final String releaseDate;
  @override
  final String songCount;
  @override
  final String url;
  @override
  final String primaryArtistsId;
  @override
  final String primaryArtists;
  final List<ImageModel> _image;
  @override
  List<ImageModel> get image {
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_image);
  }

  final List<SongsModel> _songs;
  @override
  List<SongsModel> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  String toString() {
    return 'AlbumModel(name: $name, year: $year, releaseDate: $releaseDate, songCount: $songCount, url: $url, primaryArtistsId: $primaryArtistsId, primaryArtists: $primaryArtists, image: $image, songs: $songs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.songCount, songCount) ||
                other.songCount == songCount) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.primaryArtistsId, primaryArtistsId) ||
                other.primaryArtistsId == primaryArtistsId) &&
            (identical(other.primaryArtists, primaryArtists) ||
                other.primaryArtists == primaryArtists) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      year,
      releaseDate,
      songCount,
      url,
      primaryArtistsId,
      primaryArtists,
      const DeepCollectionEquality().hash(_image),
      const DeepCollectionEquality().hash(_songs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumModelImplCopyWith<_$AlbumModelImpl> get copyWith =>
      __$$AlbumModelImplCopyWithImpl<_$AlbumModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumModelImplToJson(
      this,
    );
  }
}

abstract class _AlbumModel extends AlbumModel {
  const factory _AlbumModel(
      {required final String name,
      required final String year,
      required final String releaseDate,
      required final String songCount,
      required final String url,
      required final String primaryArtistsId,
      required final String primaryArtists,
      required final List<ImageModel> image,
      required final List<SongsModel> songs}) = _$AlbumModelImpl;
  const _AlbumModel._() : super._();

  factory _AlbumModel.fromJson(Map<String, dynamic> json) =
      _$AlbumModelImpl.fromJson;

  @override
  String get name;
  @override
  String get year;
  @override
  String get releaseDate;
  @override
  String get songCount;
  @override
  String get url;
  @override
  String get primaryArtistsId;
  @override
  String get primaryArtists;
  @override
  List<ImageModel> get image;
  @override
  List<SongsModel> get songs;
  @override
  @JsonKey(ignore: true)
  _$$AlbumModelImplCopyWith<_$AlbumModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
