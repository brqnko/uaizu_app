// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Registration {
  String get title => throw _privateConstructorUsedError;

  String? get timeSlots => throw _privateConstructorUsedError;

  String? get referenceUrl => throw _privateConstructorUsedError;

  List<String> get info => throw _privateConstructorUsedError;

  /// Create a copy of Registration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrationCopyWith<Registration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationCopyWith<$Res> {
  factory $RegistrationCopyWith(
          Registration value, $Res Function(Registration) then) =
      _$RegistrationCopyWithImpl<$Res, Registration>;

  @useResult
  $Res call(
      {String title,
      String? timeSlots,
      String? referenceUrl,
      List<String> info});
}

/// @nodoc
class _$RegistrationCopyWithImpl<$Res, $Val extends Registration>
    implements $RegistrationCopyWith<$Res> {
  _$RegistrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Registration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? timeSlots = freezed,
    Object? referenceUrl = freezed,
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      timeSlots: freezed == timeSlots
          ? _value.timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceUrl: freezed == referenceUrl
          ? _value.referenceUrl
          : referenceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationImplCopyWith<$Res>
    implements $RegistrationCopyWith<$Res> {
  factory _$$RegistrationImplCopyWith(
          _$RegistrationImpl value, $Res Function(_$RegistrationImpl) then) =
      __$$RegistrationImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {String title,
      String? timeSlots,
      String? referenceUrl,
      List<String> info});
}

/// @nodoc
class __$$RegistrationImplCopyWithImpl<$Res>
    extends _$RegistrationCopyWithImpl<$Res, _$RegistrationImpl>
    implements _$$RegistrationImplCopyWith<$Res> {
  __$$RegistrationImplCopyWithImpl(
      _$RegistrationImpl _value, $Res Function(_$RegistrationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Registration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? timeSlots = freezed,
    Object? referenceUrl = freezed,
    Object? info = null,
  }) {
    return _then(_$RegistrationImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      timeSlots: freezed == timeSlots
          ? _value.timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceUrl: freezed == referenceUrl
          ? _value.referenceUrl
          : referenceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      info: null == info
          ? _value._info
          : info // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$RegistrationImpl implements _Registration {
  const _$RegistrationImpl(
      {required this.title,
      required this.timeSlots,
      required this.referenceUrl,
      required final List<String> info})
      : _info = info;

  @override
  final String title;
  @override
  final String? timeSlots;
  @override
  final String? referenceUrl;
  final List<String> _info;

  @override
  List<String> get info {
    if (_info is EqualUnmodifiableListView) return _info;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_info);
  }

  @override
  String toString() {
    return 'Registration(title: $title, timeSlots: $timeSlots, referenceUrl: $referenceUrl, info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.timeSlots, timeSlots) ||
                other.timeSlots == timeSlots) &&
            (identical(other.referenceUrl, referenceUrl) ||
                other.referenceUrl == referenceUrl) &&
            const DeepCollectionEquality().equals(other._info, _info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, timeSlots, referenceUrl,
      const DeepCollectionEquality().hash(_info));

  /// Create a copy of Registration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationImplCopyWith<_$RegistrationImpl> get copyWith =>
      __$$RegistrationImplCopyWithImpl<_$RegistrationImpl>(this, _$identity);
}

abstract class _Registration implements Registration {
  const factory _Registration(
      {required final String title,
      required final String? timeSlots,
      required final String? referenceUrl,
      required final List<String> info}) = _$RegistrationImpl;

  @override
  String get title;

  @override
  String? get timeSlots;

  @override
  String? get referenceUrl;

  @override
  List<String> get info;

  /// Create a copy of Registration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationImplCopyWith<_$RegistrationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchRegistrationQuery {
  int get year => throw _privateConstructorUsedError;

  bool get semester => throw _privateConstructorUsedError;

  /// Create a copy of SearchRegistrationQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchRegistrationQueryCopyWith<SearchRegistrationQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchRegistrationQueryCopyWith<$Res> {
  factory $SearchRegistrationQueryCopyWith(SearchRegistrationQuery value,
          $Res Function(SearchRegistrationQuery) then) =
      _$SearchRegistrationQueryCopyWithImpl<$Res, SearchRegistrationQuery>;

  @useResult
  $Res call({int year, bool semester});
}

/// @nodoc
class _$SearchRegistrationQueryCopyWithImpl<$Res,
        $Val extends SearchRegistrationQuery>
    implements $SearchRegistrationQueryCopyWith<$Res> {
  _$SearchRegistrationQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchRegistrationQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? semester = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchRegistrationQueryImplCopyWith<$Res>
    implements $SearchRegistrationQueryCopyWith<$Res> {
  factory _$$SearchRegistrationQueryImplCopyWith(
          _$SearchRegistrationQueryImpl value,
          $Res Function(_$SearchRegistrationQueryImpl) then) =
      __$$SearchRegistrationQueryImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({int year, bool semester});
}

/// @nodoc
class __$$SearchRegistrationQueryImplCopyWithImpl<$Res>
    extends _$SearchRegistrationQueryCopyWithImpl<$Res,
        _$SearchRegistrationQueryImpl>
    implements _$$SearchRegistrationQueryImplCopyWith<$Res> {
  __$$SearchRegistrationQueryImplCopyWithImpl(
      _$SearchRegistrationQueryImpl _value,
      $Res Function(_$SearchRegistrationQueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchRegistrationQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? semester = null,
  }) {
    return _then(_$SearchRegistrationQueryImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SearchRegistrationQueryImpl implements _SearchRegistrationQuery {
  const _$SearchRegistrationQueryImpl(
      {required this.year, required this.semester});

  @override
  final int year;
  @override
  final bool semester;

  @override
  String toString() {
    return 'SearchRegistrationQuery(year: $year, semester: $semester)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRegistrationQueryImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.semester, semester) ||
                other.semester == semester));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year, semester);

  /// Create a copy of SearchRegistrationQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchRegistrationQueryImplCopyWith<_$SearchRegistrationQueryImpl>
      get copyWith => __$$SearchRegistrationQueryImplCopyWithImpl<
          _$SearchRegistrationQueryImpl>(this, _$identity);
}

abstract class _SearchRegistrationQuery implements SearchRegistrationQuery {
  const factory _SearchRegistrationQuery(
      {required final int year,
      required final bool semester}) = _$SearchRegistrationQueryImpl;

  @override
  int get year;

  @override
  bool get semester;

  /// Create a copy of SearchRegistrationQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchRegistrationQueryImplCopyWith<_$SearchRegistrationQueryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
