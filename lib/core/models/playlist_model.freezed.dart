// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SaavanPlaylistModel _$SaavanPlaylistModelFromJson(Map<String, dynamic> json) {
  return _SaavanPlaylistModel.fromJson(json);
}

/// @nodoc
mixin _$SaavanPlaylistModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<ImageModel> get image => throw _privateConstructorUsedError;
  List<SongsModel> get songs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaavanPlaylistModelCopyWith<SaavanPlaylistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaavanPlaylistModelCopyWith<$Res> {
  factory $SaavanPlaylistModelCopyWith(
          SaavanPlaylistModel value, $Res Function(SaavanPlaylistModel) then) =
      _$SaavanPlaylistModelCopyWithImpl<$Res, SaavanPlaylistModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String name,
      String type,
      List<ImageModel> image,
      List<SongsModel> songs});
}

/// @nodoc
class _$SaavanPlaylistModelCopyWithImpl<$Res, $Val extends SaavanPlaylistModel>
    implements $SaavanPlaylistModelCopyWith<$Res> {
  _$SaavanPlaylistModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? name = null,
    Object? type = null,
    Object? image = null,
    Object? songs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SaavanPlaylistModelImplCopyWith<$Res>
    implements $SaavanPlaylistModelCopyWith<$Res> {
  factory _$$SaavanPlaylistModelImplCopyWith(_$SaavanPlaylistModelImpl value,
          $Res Function(_$SaavanPlaylistModelImpl) then) =
      __$$SaavanPlaylistModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String name,
      String type,
      List<ImageModel> image,
      List<SongsModel> songs});
}

/// @nodoc
class __$$SaavanPlaylistModelImplCopyWithImpl<$Res>
    extends _$SaavanPlaylistModelCopyWithImpl<$Res, _$SaavanPlaylistModelImpl>
    implements _$$SaavanPlaylistModelImplCopyWith<$Res> {
  __$$SaavanPlaylistModelImplCopyWithImpl(_$SaavanPlaylistModelImpl _value,
      $Res Function(_$SaavanPlaylistModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? name = null,
    Object? type = null,
    Object? image = null,
    Object? songs = null,
  }) {
    return _then(_$SaavanPlaylistModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
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
class _$SaavanPlaylistModelImpl extends _SaavanPlaylistModel {
  const _$SaavanPlaylistModelImpl(
      {required this.id,
      this.title = '',
      this.name = '',
      this.type = '',
      final List<ImageModel> image = const [],
      final List<SongsModel> songs = const []})
      : _image = image,
        _songs = songs,
        super._();

  factory _$SaavanPlaylistModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaavanPlaylistModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String type;
  final List<ImageModel> _image;
  @override
  @JsonKey()
  List<ImageModel> get image {
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_image);
  }

  final List<SongsModel> _songs;
  @override
  @JsonKey()
  List<SongsModel> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  String toString() {
    return 'SaavanPlaylistModel(id: $id, title: $title, name: $name, type: $type, image: $image, songs: $songs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaavanPlaylistModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      name,
      type,
      const DeepCollectionEquality().hash(_image),
      const DeepCollectionEquality().hash(_songs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaavanPlaylistModelImplCopyWith<_$SaavanPlaylistModelImpl> get copyWith =>
      __$$SaavanPlaylistModelImplCopyWithImpl<_$SaavanPlaylistModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaavanPlaylistModelImplToJson(
      this,
    );
  }
}

abstract class _SaavanPlaylistModel extends SaavanPlaylistModel {
  const factory _SaavanPlaylistModel(
      {required final String id,
      final String title,
      final String name,
      final String type,
      final List<ImageModel> image,
      final List<SongsModel> songs}) = _$SaavanPlaylistModelImpl;
  const _SaavanPlaylistModel._() : super._();

  factory _SaavanPlaylistModel.fromJson(Map<String, dynamic> json) =
      _$SaavanPlaylistModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get name;
  @override
  String get type;
  @override
  List<ImageModel> get image;
  @override
  List<SongsModel> get songs;
  @override
  @JsonKey(ignore: true)
  _$$SaavanPlaylistModelImplCopyWith<_$SaavanPlaylistModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
