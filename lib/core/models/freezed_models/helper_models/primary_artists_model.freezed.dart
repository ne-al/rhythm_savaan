// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'primary_artists_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrimaryArtistsModel _$PrimaryArtistsModelFromJson(Map<String, dynamic> json) {
  return _PrimaryArtistsModel.fromJson(json);
}

/// @nodoc
mixin _$PrimaryArtistsModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  List<ImageModel?>? get image => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrimaryArtistsModelCopyWith<PrimaryArtistsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrimaryArtistsModelCopyWith<$Res> {
  factory $PrimaryArtistsModelCopyWith(
          PrimaryArtistsModel value, $Res Function(PrimaryArtistsModel) then) =
      _$PrimaryArtistsModelCopyWithImpl<$Res, PrimaryArtistsModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String url,
      List<ImageModel?>? image,
      String type,
      String role});
}

/// @nodoc
class _$PrimaryArtistsModelCopyWithImpl<$Res, $Val extends PrimaryArtistsModel>
    implements $PrimaryArtistsModelCopyWith<$Res> {
  _$PrimaryArtistsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? image = freezed,
    Object? type = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as List<ImageModel?>?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrimaryArtistsModelImplCopyWith<$Res>
    implements $PrimaryArtistsModelCopyWith<$Res> {
  factory _$$PrimaryArtistsModelImplCopyWith(_$PrimaryArtistsModelImpl value,
          $Res Function(_$PrimaryArtistsModelImpl) then) =
      __$$PrimaryArtistsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String url,
      List<ImageModel?>? image,
      String type,
      String role});
}

/// @nodoc
class __$$PrimaryArtistsModelImplCopyWithImpl<$Res>
    extends _$PrimaryArtistsModelCopyWithImpl<$Res, _$PrimaryArtistsModelImpl>
    implements _$$PrimaryArtistsModelImplCopyWith<$Res> {
  __$$PrimaryArtistsModelImplCopyWithImpl(_$PrimaryArtistsModelImpl _value,
      $Res Function(_$PrimaryArtistsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? image = freezed,
    Object? type = null,
    Object? role = null,
  }) {
    return _then(_$PrimaryArtistsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<ImageModel?>?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrimaryArtistsModelImpl extends _PrimaryArtistsModel {
  const _$PrimaryArtistsModelImpl(
      {this.id = '',
      this.name = '',
      this.url = '',
      final List<ImageModel?>? image = const [],
      this.type = '',
      this.role = ''})
      : _image = image,
        super._();

  factory _$PrimaryArtistsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrimaryArtistsModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String url;
  final List<ImageModel?>? _image;
  @override
  @JsonKey()
  List<ImageModel?>? get image {
    final value = _image;
    if (value == null) return null;
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String role;

  @override
  String toString() {
    return 'PrimaryArtistsModel(id: $id, name: $name, url: $url, image: $image, type: $type, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrimaryArtistsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, url,
      const DeepCollectionEquality().hash(_image), type, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrimaryArtistsModelImplCopyWith<_$PrimaryArtistsModelImpl> get copyWith =>
      __$$PrimaryArtistsModelImplCopyWithImpl<_$PrimaryArtistsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrimaryArtistsModelImplToJson(
      this,
    );
  }
}

abstract class _PrimaryArtistsModel extends PrimaryArtistsModel {
  const factory _PrimaryArtistsModel(
      {final String id,
      final String name,
      final String url,
      final List<ImageModel?>? image,
      final String type,
      final String role}) = _$PrimaryArtistsModelImpl;
  const _PrimaryArtistsModel._() : super._();

  factory _PrimaryArtistsModel.fromJson(Map<String, dynamic> json) =
      _$PrimaryArtistsModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get url;
  @override
  List<ImageModel?>? get image;
  @override
  String get type;
  @override
  String get role;
  @override
  @JsonKey(ignore: true)
  _$$PrimaryArtistsModelImplCopyWith<_$PrimaryArtistsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
