// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeScreenData value) getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  final HomeEvent _value;
  // ignore: unused_field
  final $Res Function(HomeEvent) _then;
}

/// @nodoc
abstract class _$$GetHomeScreenDataCopyWith<$Res> {
  factory _$$GetHomeScreenDataCopyWith(
          _$GetHomeScreenData value, $Res Function(_$GetHomeScreenData) then) =
      __$$GetHomeScreenDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHomeScreenDataCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements _$$GetHomeScreenDataCopyWith<$Res> {
  __$$GetHomeScreenDataCopyWithImpl(
      _$GetHomeScreenData _value, $Res Function(_$GetHomeScreenData) _then)
      : super(_value, (v) => _then(v as _$GetHomeScreenData));

  @override
  _$GetHomeScreenData get _value => super._value as _$GetHomeScreenData;
}

/// @nodoc

class _$GetHomeScreenData implements GetHomeScreenData {
  const _$GetHomeScreenData();

  @override
  String toString() {
    return 'HomeEvent.getHomeScreenData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHomeScreenData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeScreenData,
  }) {
    return getHomeScreenData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
  }) {
    return getHomeScreenData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
    required TResult orElse(),
  }) {
    if (getHomeScreenData != null) {
      return getHomeScreenData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeScreenData value) getHomeScreenData,
  }) {
    return getHomeScreenData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
  }) {
    return getHomeScreenData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
    required TResult orElse(),
  }) {
    if (getHomeScreenData != null) {
      return getHomeScreenData(this);
    }
    return orElse();
  }
}

abstract class GetHomeScreenData implements HomeEvent {
  const factory GetHomeScreenData() = _$GetHomeScreenData;
}

/// @nodoc
mixin _$HomeState {
  List<NewAndHotData> get pastYearList => throw _privateConstructorUsedError;
  List<NewAndHotData> get trendingMovieList =>
      throw _privateConstructorUsedError;
  List<NewAndHotData> get tenseDramaList => throw _privateConstructorUsedError;
  List<NewAndHotData> get southIndianList => throw _privateConstructorUsedError;
  List<NewAndHotData> get trendingTvList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get stateId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {List<NewAndHotData> pastYearList,
      List<NewAndHotData> trendingMovieList,
      List<NewAndHotData> tenseDramaList,
      List<NewAndHotData> southIndianList,
      List<NewAndHotData> trendingTvList,
      bool isLoading,
      bool hasError,
      String stateId});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? pastYearList = freezed,
    Object? trendingMovieList = freezed,
    Object? tenseDramaList = freezed,
    Object? southIndianList = freezed,
    Object? trendingTvList = freezed,
    Object? isLoading = freezed,
    Object? hasError = freezed,
    Object? stateId = freezed,
  }) {
    return _then(_value.copyWith(
      pastYearList: pastYearList == freezed
          ? _value.pastYearList
          : pastYearList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      trendingMovieList: trendingMovieList == freezed
          ? _value.trendingMovieList
          : trendingMovieList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      tenseDramaList: tenseDramaList == freezed
          ? _value.tenseDramaList
          : tenseDramaList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      southIndianList: southIndianList == freezed
          ? _value.southIndianList
          : southIndianList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      trendingTvList: trendingTvList == freezed
          ? _value.trendingTvList
          : trendingTvList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      stateId: stateId == freezed
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<NewAndHotData> pastYearList,
      List<NewAndHotData> trendingMovieList,
      List<NewAndHotData> tenseDramaList,
      List<NewAndHotData> southIndianList,
      List<NewAndHotData> trendingTvList,
      bool isLoading,
      bool hasError,
      String stateId});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? pastYearList = freezed,
    Object? trendingMovieList = freezed,
    Object? tenseDramaList = freezed,
    Object? southIndianList = freezed,
    Object? trendingTvList = freezed,
    Object? isLoading = freezed,
    Object? hasError = freezed,
    Object? stateId = freezed,
  }) {
    return _then(_$_Initial(
      pastYearList: pastYearList == freezed
          ? _value._pastYearList
          : pastYearList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      trendingMovieList: trendingMovieList == freezed
          ? _value._trendingMovieList
          : trendingMovieList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      tenseDramaList: tenseDramaList == freezed
          ? _value._tenseDramaList
          : tenseDramaList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      southIndianList: southIndianList == freezed
          ? _value._southIndianList
          : southIndianList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      trendingTvList: trendingTvList == freezed
          ? _value._trendingTvList
          : trendingTvList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotData>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      stateId: stateId == freezed
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required final List<NewAndHotData> pastYearList,
      required final List<NewAndHotData> trendingMovieList,
      required final List<NewAndHotData> tenseDramaList,
      required final List<NewAndHotData> southIndianList,
      required final List<NewAndHotData> trendingTvList,
      required this.isLoading,
      required this.hasError,
      required this.stateId})
      : _pastYearList = pastYearList,
        _trendingMovieList = trendingMovieList,
        _tenseDramaList = tenseDramaList,
        _southIndianList = southIndianList,
        _trendingTvList = trendingTvList;

  final List<NewAndHotData> _pastYearList;
  @override
  List<NewAndHotData> get pastYearList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastYearList);
  }

  final List<NewAndHotData> _trendingMovieList;
  @override
  List<NewAndHotData> get trendingMovieList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingMovieList);
  }

  final List<NewAndHotData> _tenseDramaList;
  @override
  List<NewAndHotData> get tenseDramaList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tenseDramaList);
  }

  final List<NewAndHotData> _southIndianList;
  @override
  List<NewAndHotData> get southIndianList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_southIndianList);
  }

  final List<NewAndHotData> _trendingTvList;
  @override
  List<NewAndHotData> get trendingTvList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingTvList);
  }

  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final String stateId;

  @override
  String toString() {
    return 'HomeState(pastYearList: $pastYearList, trendingMovieList: $trendingMovieList, tenseDramaList: $tenseDramaList, southIndianList: $southIndianList, trendingTvList: $trendingTvList, isLoading: $isLoading, hasError: $hasError, stateId: $stateId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._pastYearList, _pastYearList) &&
            const DeepCollectionEquality()
                .equals(other._trendingMovieList, _trendingMovieList) &&
            const DeepCollectionEquality()
                .equals(other._tenseDramaList, _tenseDramaList) &&
            const DeepCollectionEquality()
                .equals(other._southIndianList, _southIndianList) &&
            const DeepCollectionEquality()
                .equals(other._trendingTvList, _trendingTvList) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.hasError, hasError) &&
            const DeepCollectionEquality().equals(other.stateId, stateId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pastYearList),
      const DeepCollectionEquality().hash(_trendingMovieList),
      const DeepCollectionEquality().hash(_tenseDramaList),
      const DeepCollectionEquality().hash(_southIndianList),
      const DeepCollectionEquality().hash(_trendingTvList),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(hasError),
      const DeepCollectionEquality().hash(stateId));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {required final List<NewAndHotData> pastYearList,
      required final List<NewAndHotData> trendingMovieList,
      required final List<NewAndHotData> tenseDramaList,
      required final List<NewAndHotData> southIndianList,
      required final List<NewAndHotData> trendingTvList,
      required final bool isLoading,
      required final bool hasError,
      required final String stateId}) = _$_Initial;

  @override
  List<NewAndHotData> get pastYearList => throw _privateConstructorUsedError;
  @override
  List<NewAndHotData> get trendingMovieList =>
      throw _privateConstructorUsedError;
  @override
  List<NewAndHotData> get tenseDramaList => throw _privateConstructorUsedError;
  @override
  List<NewAndHotData> get southIndianList => throw _privateConstructorUsedError;
  @override
  List<NewAndHotData> get trendingTvList => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get hasError => throw _privateConstructorUsedError;
  @override
  String get stateId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
