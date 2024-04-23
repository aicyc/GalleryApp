// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GalleryState {
  List<PixabayModel> get pixabayModels => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isNoData => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PixabayModel> pixabayModels, bool isLoading,
            bool isNoData, String? error)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PixabayModel> pixabayModels, bool isLoading,
            bool isNoData, String? error)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PixabayModel> pixabayModels, bool isLoading,
            bool isNoData, String? error)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GalleryStateCopyWith<GalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryStateCopyWith<$Res> {
  factory $GalleryStateCopyWith(
          GalleryState value, $Res Function(GalleryState) then) =
      _$GalleryStateCopyWithImpl<$Res, GalleryState>;
  @useResult
  $Res call(
      {List<PixabayModel> pixabayModels,
      bool isLoading,
      bool isNoData,
      String? error});
}

/// @nodoc
class _$GalleryStateCopyWithImpl<$Res, $Val extends GalleryState>
    implements $GalleryStateCopyWith<$Res> {
  _$GalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pixabayModels = null,
    Object? isLoading = null,
    Object? isNoData = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      pixabayModels: null == pixabayModels
          ? _value.pixabayModels
          : pixabayModels // ignore: cast_nullable_to_non_nullable
              as List<PixabayModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoData: null == isNoData
          ? _value.isNoData
          : isNoData // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GalleryStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PixabayModel> pixabayModels,
      bool isLoading,
      bool isNoData,
      String? error});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pixabayModels = null,
    Object? isLoading = null,
    Object? isNoData = null,
    Object? error = freezed,
  }) {
    return _then(_$InitialImpl(
      pixabayModels: null == pixabayModels
          ? _value._pixabayModels
          : pixabayModels // ignore: cast_nullable_to_non_nullable
              as List<PixabayModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoData: null == isNoData
          ? _value.isNoData
          : isNoData // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<PixabayModel> pixabayModels = const [],
      this.isLoading = true,
      this.isNoData = false,
      this.error})
      : _pixabayModels = pixabayModels;

  final List<PixabayModel> _pixabayModels;
  @override
  @JsonKey()
  List<PixabayModel> get pixabayModels {
    if (_pixabayModels is EqualUnmodifiableListView) return _pixabayModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pixabayModels);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isNoData;
  @override
  final String? error;

  @override
  String toString() {
    return 'GalleryState.initial(pixabayModels: $pixabayModels, isLoading: $isLoading, isNoData: $isNoData, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._pixabayModels, _pixabayModels) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isNoData, isNoData) ||
                other.isNoData == isNoData) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pixabayModels),
      isLoading,
      isNoData,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PixabayModel> pixabayModels, bool isLoading,
            bool isNoData, String? error)
        initial,
  }) {
    return initial(pixabayModels, isLoading, isNoData, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PixabayModel> pixabayModels, bool isLoading,
            bool isNoData, String? error)?
        initial,
  }) {
    return initial?.call(pixabayModels, isLoading, isNoData, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PixabayModel> pixabayModels, bool isLoading,
            bool isNoData, String? error)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(pixabayModels, isLoading, isNoData, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GalleryState {
  const factory _Initial(
      {final List<PixabayModel> pixabayModels,
      final bool isLoading,
      final bool isNoData,
      final String? error}) = _$InitialImpl;

  @override
  List<PixabayModel> get pixabayModels;
  @override
  bool get isLoading;
  @override
  bool get isNoData;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
