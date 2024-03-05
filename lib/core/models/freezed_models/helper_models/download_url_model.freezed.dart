// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_url_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DownloadUrlModel _$DownloadUrlModelFromJson(Map<String, dynamic> json) {
  return _DownloadUrlModel.fromJson(json);
}

/// @nodoc
mixin _$DownloadUrlModel {
  String get quality => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DownloadUrlModelCopyWith<DownloadUrlModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadUrlModelCopyWith<$Res> {
  factory $DownloadUrlModelCopyWith(
          DownloadUrlModel value, $Res Function(DownloadUrlModel) then) =
      _$DownloadUrlModelCopyWithImpl<$Res, DownloadUrlModel>;
  @useResult
  $Res call({String quality, String link});
}

/// @nodoc
class _$DownloadUrlModelCopyWithImpl<$Res, $Val extends DownloadUrlModel>
    implements $DownloadUrlModelCopyWith<$Res> {
  _$DownloadUrlModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quality = null,
    Object? link = null,
  }) {
    return _then(_value.copyWith(
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadUrlModelImplCopyWith<$Res>
    implements $DownloadUrlModelCopyWith<$Res> {
  factory _$$DownloadUrlModelImplCopyWith(_$DownloadUrlModelImpl value,
          $Res Function(_$DownloadUrlModelImpl) then) =
      __$$DownloadUrlModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String quality, String link});
}

/// @nodoc
class __$$DownloadUrlModelImplCopyWithImpl<$Res>
    extends _$DownloadUrlModelCopyWithImpl<$Res, _$DownloadUrlModelImpl>
    implements _$$DownloadUrlModelImplCopyWith<$Res> {
  __$$DownloadUrlModelImplCopyWithImpl(_$DownloadUrlModelImpl _value,
      $Res Function(_$DownloadUrlModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quality = null,
    Object? link = null,
  }) {
    return _then(_$DownloadUrlModelImpl(
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloadUrlModelImpl extends _DownloadUrlModel {
  const _$DownloadUrlModelImpl({required this.quality, required this.link})
      : super._();

  factory _$DownloadUrlModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DownloadUrlModelImplFromJson(json);

  @override
  final String quality;
  @override
  final String link;

  @override
  String toString() {
    return 'DownloadUrlModel(quality: $quality, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadUrlModelImpl &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quality, link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadUrlModelImplCopyWith<_$DownloadUrlModelImpl> get copyWith =>
      __$$DownloadUrlModelImplCopyWithImpl<_$DownloadUrlModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadUrlModelImplToJson(
      this,
    );
  }
}

abstract class _DownloadUrlModel extends DownloadUrlModel {
  const factory _DownloadUrlModel(
      {required final String quality,
      required final String link}) = _$DownloadUrlModelImpl;
  const _DownloadUrlModel._() : super._();

  factory _DownloadUrlModel.fromJson(Map<String, dynamic> json) =
      _$DownloadUrlModelImpl.fromJson;

  @override
  String get quality;
  @override
  String get link;
  @override
  @JsonKey(ignore: true)
  _$$DownloadUrlModelImplCopyWith<_$DownloadUrlModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
