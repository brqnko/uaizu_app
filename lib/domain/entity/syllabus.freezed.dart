// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'syllabus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SyllabusLecture {
  String get name => throw _privateConstructorUsedError;

  String get semester => throw _privateConstructorUsedError;

  String get quarter => throw _privateConstructorUsedError;

  String get timeSlot => throw _privateConstructorUsedError;

  int get code => throw _privateConstructorUsedError;

  String get instructor => throw _privateConstructorUsedError;

  AppLocale get appLocale => throw _privateConstructorUsedError;

  /// Create a copy of SyllabusLecture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyllabusLectureCopyWith<SyllabusLecture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyllabusLectureCopyWith<$Res> {
  factory $SyllabusLectureCopyWith(
          SyllabusLecture value, $Res Function(SyllabusLecture) then) =
      _$SyllabusLectureCopyWithImpl<$Res, SyllabusLecture>;

  @useResult
  $Res call(
      {String name,
      String semester,
      String quarter,
      String timeSlot,
      int code,
      String instructor,
      AppLocale appLocale});
}

/// @nodoc
class _$SyllabusLectureCopyWithImpl<$Res, $Val extends SyllabusLecture>
    implements $SyllabusLectureCopyWith<$Res> {
  _$SyllabusLectureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyllabusLecture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? semester = null,
    Object? quarter = null,
    Object? timeSlot = null,
    Object? code = null,
    Object? instructor = null,
    Object? appLocale = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      quarter: null == quarter
          ? _value.quarter
          : quarter // ignore: cast_nullable_to_non_nullable
              as String,
      timeSlot: null == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      instructor: null == instructor
          ? _value.instructor
          : instructor // ignore: cast_nullable_to_non_nullable
              as String,
      appLocale: null == appLocale
          ? _value.appLocale
          : appLocale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyllabusLectureImplCopyWith<$Res>
    implements $SyllabusLectureCopyWith<$Res> {
  factory _$$SyllabusLectureImplCopyWith(_$SyllabusLectureImpl value,
          $Res Function(_$SyllabusLectureImpl) then) =
      __$$SyllabusLectureImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {String name,
      String semester,
      String quarter,
      String timeSlot,
      int code,
      String instructor,
      AppLocale appLocale});
}

/// @nodoc
class __$$SyllabusLectureImplCopyWithImpl<$Res>
    extends _$SyllabusLectureCopyWithImpl<$Res, _$SyllabusLectureImpl>
    implements _$$SyllabusLectureImplCopyWith<$Res> {
  __$$SyllabusLectureImplCopyWithImpl(
      _$SyllabusLectureImpl _value, $Res Function(_$SyllabusLectureImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyllabusLecture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? semester = null,
    Object? quarter = null,
    Object? timeSlot = null,
    Object? code = null,
    Object? instructor = null,
    Object? appLocale = null,
  }) {
    return _then(_$SyllabusLectureImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      quarter: null == quarter
          ? _value.quarter
          : quarter // ignore: cast_nullable_to_non_nullable
              as String,
      timeSlot: null == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      instructor: null == instructor
          ? _value.instructor
          : instructor // ignore: cast_nullable_to_non_nullable
              as String,
      appLocale: null == appLocale
          ? _value.appLocale
          : appLocale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
    ));
  }
}

/// @nodoc

class _$SyllabusLectureImpl implements _SyllabusLecture {
  const _$SyllabusLectureImpl(
      {required this.name,
      required this.semester,
      required this.quarter,
      required this.timeSlot,
      required this.code,
      required this.instructor,
      required this.appLocale});

  @override
  final String name;
  @override
  final String semester;
  @override
  final String quarter;
  @override
  final String timeSlot;
  @override
  final int code;
  @override
  final String instructor;
  @override
  final AppLocale appLocale;

  @override
  String toString() {
    return 'SyllabusLecture(name: $name, semester: $semester, quarter: $quarter, timeSlot: $timeSlot, code: $code, instructor: $instructor, appLocale: $appLocale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyllabusLectureImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            (identical(other.quarter, quarter) || other.quarter == quarter) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.instructor, instructor) ||
                other.instructor == instructor) &&
            (identical(other.appLocale, appLocale) ||
                other.appLocale == appLocale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, semester, quarter,
      timeSlot, code, instructor, appLocale);

  /// Create a copy of SyllabusLecture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyllabusLectureImplCopyWith<_$SyllabusLectureImpl> get copyWith =>
      __$$SyllabusLectureImplCopyWithImpl<_$SyllabusLectureImpl>(
          this, _$identity);
}

abstract class _SyllabusLecture implements SyllabusLecture {
  const factory _SyllabusLecture(
      {required final String name,
      required final String semester,
      required final String quarter,
      required final String timeSlot,
      required final int code,
      required final String instructor,
      required final AppLocale appLocale}) = _$SyllabusLectureImpl;

  @override
  String get name;

  @override
  String get semester;

  @override
  String get quarter;

  @override
  String get timeSlot;

  @override
  int get code;

  @override
  String get instructor;

  @override
  AppLocale get appLocale;

  /// Create a copy of SyllabusLecture
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyllabusLectureImplCopyWith<_$SyllabusLectureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SyllabusLectureSearchQuery {
  int get year => throw _privateConstructorUsedError;

  int get displayCount => throw _privateConstructorUsedError;

  String get freeWord => throw _privateConstructorUsedError;

  /// Create a copy of SyllabusLectureSearchQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyllabusLectureSearchQueryCopyWith<SyllabusLectureSearchQuery>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyllabusLectureSearchQueryCopyWith<$Res> {
  factory $SyllabusLectureSearchQueryCopyWith(SyllabusLectureSearchQuery value,
          $Res Function(SyllabusLectureSearchQuery) then) =
      _$SyllabusLectureSearchQueryCopyWithImpl<$Res,
          SyllabusLectureSearchQuery>;

  @useResult
  $Res call({int year, int displayCount, String freeWord});
}

/// @nodoc
class _$SyllabusLectureSearchQueryCopyWithImpl<$Res,
        $Val extends SyllabusLectureSearchQuery>
    implements $SyllabusLectureSearchQueryCopyWith<$Res> {
  _$SyllabusLectureSearchQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyllabusLectureSearchQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? displayCount = null,
    Object? freeWord = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      displayCount: null == displayCount
          ? _value.displayCount
          : displayCount // ignore: cast_nullable_to_non_nullable
              as int,
      freeWord: null == freeWord
          ? _value.freeWord
          : freeWord // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyllabusLectureSearchQueryImplCopyWith<$Res>
    implements $SyllabusLectureSearchQueryCopyWith<$Res> {
  factory _$$SyllabusLectureSearchQueryImplCopyWith(
          _$SyllabusLectureSearchQueryImpl value,
          $Res Function(_$SyllabusLectureSearchQueryImpl) then) =
      __$$SyllabusLectureSearchQueryImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({int year, int displayCount, String freeWord});
}

/// @nodoc
class __$$SyllabusLectureSearchQueryImplCopyWithImpl<$Res>
    extends _$SyllabusLectureSearchQueryCopyWithImpl<$Res,
        _$SyllabusLectureSearchQueryImpl>
    implements _$$SyllabusLectureSearchQueryImplCopyWith<$Res> {
  __$$SyllabusLectureSearchQueryImplCopyWithImpl(
      _$SyllabusLectureSearchQueryImpl _value,
      $Res Function(_$SyllabusLectureSearchQueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyllabusLectureSearchQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? displayCount = null,
    Object? freeWord = null,
  }) {
    return _then(_$SyllabusLectureSearchQueryImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      displayCount: null == displayCount
          ? _value.displayCount
          : displayCount // ignore: cast_nullable_to_non_nullable
              as int,
      freeWord: null == freeWord
          ? _value.freeWord
          : freeWord // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SyllabusLectureSearchQueryImpl implements _SyllabusLectureSearchQuery {
  const _$SyllabusLectureSearchQueryImpl(
      {required this.year, required this.displayCount, required this.freeWord});

  @override
  final int year;
  @override
  final int displayCount;
  @override
  final String freeWord;

  @override
  String toString() {
    return 'SyllabusLectureSearchQuery(year: $year, displayCount: $displayCount, freeWord: $freeWord)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyllabusLectureSearchQueryImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.displayCount, displayCount) ||
                other.displayCount == displayCount) &&
            (identical(other.freeWord, freeWord) ||
                other.freeWord == freeWord));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year, displayCount, freeWord);

  /// Create a copy of SyllabusLectureSearchQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyllabusLectureSearchQueryImplCopyWith<_$SyllabusLectureSearchQueryImpl>
      get copyWith => __$$SyllabusLectureSearchQueryImplCopyWithImpl<
          _$SyllabusLectureSearchQueryImpl>(this, _$identity);
}

abstract class _SyllabusLectureSearchQuery
    implements SyllabusLectureSearchQuery {
  const factory _SyllabusLectureSearchQuery(
      {required final int year,
      required final int displayCount,
      required final String freeWord}) = _$SyllabusLectureSearchQueryImpl;

  @override
  int get year;

  @override
  int get displayCount;

  @override
  String get freeWord;

  /// Create a copy of SyllabusLectureSearchQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyllabusLectureSearchQueryImplCopyWith<_$SyllabusLectureSearchQueryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
