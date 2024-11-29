// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lms_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LmsTaskDayUseCaseParam {
  DateTime get date => throw _privateConstructorUsedError;

  /// Create a copy of LmsTaskDayUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LmsTaskDayUseCaseParamCopyWith<LmsTaskDayUseCaseParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LmsTaskDayUseCaseParamCopyWith<$Res> {
  factory $LmsTaskDayUseCaseParamCopyWith(LmsTaskDayUseCaseParam value,
          $Res Function(LmsTaskDayUseCaseParam) then) =
      _$LmsTaskDayUseCaseParamCopyWithImpl<$Res, LmsTaskDayUseCaseParam>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class _$LmsTaskDayUseCaseParamCopyWithImpl<$Res,
        $Val extends LmsTaskDayUseCaseParam>
    implements $LmsTaskDayUseCaseParamCopyWith<$Res> {
  _$LmsTaskDayUseCaseParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LmsTaskDayUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LmsTaskDayUseCaseParamImplCopyWith<$Res>
    implements $LmsTaskDayUseCaseParamCopyWith<$Res> {
  factory _$$LmsTaskDayUseCaseParamImplCopyWith(
          _$LmsTaskDayUseCaseParamImpl value,
          $Res Function(_$LmsTaskDayUseCaseParamImpl) then) =
      __$$LmsTaskDayUseCaseParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$LmsTaskDayUseCaseParamImplCopyWithImpl<$Res>
    extends _$LmsTaskDayUseCaseParamCopyWithImpl<$Res,
        _$LmsTaskDayUseCaseParamImpl>
    implements _$$LmsTaskDayUseCaseParamImplCopyWith<$Res> {
  __$$LmsTaskDayUseCaseParamImplCopyWithImpl(
      _$LmsTaskDayUseCaseParamImpl _value,
      $Res Function(_$LmsTaskDayUseCaseParamImpl) _then)
      : super(_value, _then);

  /// Create a copy of LmsTaskDayUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$LmsTaskDayUseCaseParamImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$LmsTaskDayUseCaseParamImpl implements _LmsTaskDayUseCaseParam {
  const _$LmsTaskDayUseCaseParamImpl({required this.date});

  @override
  final DateTime date;

  @override
  String toString() {
    return 'LmsTaskDayUseCaseParam(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LmsTaskDayUseCaseParamImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  /// Create a copy of LmsTaskDayUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LmsTaskDayUseCaseParamImplCopyWith<_$LmsTaskDayUseCaseParamImpl>
      get copyWith => __$$LmsTaskDayUseCaseParamImplCopyWithImpl<
          _$LmsTaskDayUseCaseParamImpl>(this, _$identity);
}

abstract class _LmsTaskDayUseCaseParam implements LmsTaskDayUseCaseParam {
  const factory _LmsTaskDayUseCaseParam({required final DateTime date}) =
      _$LmsTaskDayUseCaseParamImpl;

  @override
  DateTime get date;

  /// Create a copy of LmsTaskDayUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LmsTaskDayUseCaseParamImplCopyWith<_$LmsTaskDayUseCaseParamImpl>
      get copyWith => throw _privateConstructorUsedError;
}
