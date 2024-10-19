// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lms_calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LmsTask {
  DateTime get date => throw _privateConstructorUsedError;

  String get title => throw _privateConstructorUsedError;

  String? get courseLink => throw _privateConstructorUsedError;

  String? get activityLink => throw _privateConstructorUsedError;

  /// Create a copy of LmsTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LmsTaskCopyWith<LmsTask> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LmsTaskCopyWith<$Res> {
  factory $LmsTaskCopyWith(LmsTask value, $Res Function(LmsTask) then) =
      _$LmsTaskCopyWithImpl<$Res, LmsTask>;

  @useResult
  $Res call(
      {DateTime date, String title, String? courseLink, String? activityLink});
}

/// @nodoc
class _$LmsTaskCopyWithImpl<$Res, $Val extends LmsTask>
    implements $LmsTaskCopyWith<$Res> {
  _$LmsTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LmsTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? title = null,
    Object? courseLink = freezed,
    Object? activityLink = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      courseLink: freezed == courseLink
          ? _value.courseLink
          : courseLink // ignore: cast_nullable_to_non_nullable
              as String?,
      activityLink: freezed == activityLink
          ? _value.activityLink
          : activityLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LmsTaskImplCopyWith<$Res> implements $LmsTaskCopyWith<$Res> {
  factory _$$LmsTaskImplCopyWith(
          _$LmsTaskImpl value, $Res Function(_$LmsTaskImpl) then) =
      __$$LmsTaskImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {DateTime date, String title, String? courseLink, String? activityLink});
}

/// @nodoc
class __$$LmsTaskImplCopyWithImpl<$Res>
    extends _$LmsTaskCopyWithImpl<$Res, _$LmsTaskImpl>
    implements _$$LmsTaskImplCopyWith<$Res> {
  __$$LmsTaskImplCopyWithImpl(
      _$LmsTaskImpl _value, $Res Function(_$LmsTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of LmsTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? title = null,
    Object? courseLink = freezed,
    Object? activityLink = freezed,
  }) {
    return _then(_$LmsTaskImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      courseLink: freezed == courseLink
          ? _value.courseLink
          : courseLink // ignore: cast_nullable_to_non_nullable
              as String?,
      activityLink: freezed == activityLink
          ? _value.activityLink
          : activityLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LmsTaskImpl implements _LmsTask {
  const _$LmsTaskImpl(
      {required this.date,
      required this.title,
      required this.courseLink,
      required this.activityLink});

  @override
  final DateTime date;
  @override
  final String title;
  @override
  final String? courseLink;
  @override
  final String? activityLink;

  @override
  String toString() {
    return 'LmsTask(date: $date, title: $title, courseLink: $courseLink, activityLink: $activityLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LmsTaskImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.courseLink, courseLink) ||
                other.courseLink == courseLink) &&
            (identical(other.activityLink, activityLink) ||
                other.activityLink == activityLink));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, date, title, courseLink, activityLink);

  /// Create a copy of LmsTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LmsTaskImplCopyWith<_$LmsTaskImpl> get copyWith =>
      __$$LmsTaskImplCopyWithImpl<_$LmsTaskImpl>(this, _$identity);
}

abstract class _LmsTask implements LmsTask {
  const factory _LmsTask(
      {required final DateTime date,
      required final String title,
      required final String? courseLink,
      required final String? activityLink}) = _$LmsTaskImpl;

  @override
  DateTime get date;

  @override
  String get title;

  @override
  String? get courseLink;

  @override
  String? get activityLink;

  /// Create a copy of LmsTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LmsTaskImplCopyWith<_$LmsTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
