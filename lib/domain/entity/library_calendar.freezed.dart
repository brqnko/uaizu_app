// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LibraryOpeningState {
  DateTime get day => throw _privateConstructorUsedError;

  int get colorHex => throw _privateConstructorUsedError;

  String? get text => throw _privateConstructorUsedError;

  AppLocale get locale => throw _privateConstructorUsedError;

  /// Create a copy of LibraryOpeningState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LibraryOpeningStateCopyWith<LibraryOpeningState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryOpeningStateCopyWith<$Res> {
  factory $LibraryOpeningStateCopyWith(
          LibraryOpeningState value, $Res Function(LibraryOpeningState) then) =
      _$LibraryOpeningStateCopyWithImpl<$Res, LibraryOpeningState>;

  @useResult
  $Res call({DateTime day, int colorHex, String? text, AppLocale locale});
}

/// @nodoc
class _$LibraryOpeningStateCopyWithImpl<$Res, $Val extends LibraryOpeningState>
    implements $LibraryOpeningStateCopyWith<$Res> {
  _$LibraryOpeningStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibraryOpeningState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? colorHex = null,
    Object? text = freezed,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
      colorHex: null == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as int,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LibraryOpeningStateImplCopyWith<$Res>
    implements $LibraryOpeningStateCopyWith<$Res> {
  factory _$$LibraryOpeningStateImplCopyWith(_$LibraryOpeningStateImpl value,
          $Res Function(_$LibraryOpeningStateImpl) then) =
      __$$LibraryOpeningStateImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({DateTime day, int colorHex, String? text, AppLocale locale});
}

/// @nodoc
class __$$LibraryOpeningStateImplCopyWithImpl<$Res>
    extends _$LibraryOpeningStateCopyWithImpl<$Res, _$LibraryOpeningStateImpl>
    implements _$$LibraryOpeningStateImplCopyWith<$Res> {
  __$$LibraryOpeningStateImplCopyWithImpl(_$LibraryOpeningStateImpl _value,
      $Res Function(_$LibraryOpeningStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibraryOpeningState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? colorHex = null,
    Object? text = freezed,
    Object? locale = null,
  }) {
    return _then(_$LibraryOpeningStateImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
      colorHex: null == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as int,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
    ));
  }
}

/// @nodoc

class _$LibraryOpeningStateImpl implements _LibraryOpeningState {
  const _$LibraryOpeningStateImpl(
      {required this.day,
      required this.colorHex,
      required this.text,
      required this.locale});

  @override
  final DateTime day;
  @override
  final int colorHex;
  @override
  final String? text;
  @override
  final AppLocale locale;

  @override
  String toString() {
    return 'LibraryOpeningState(day: $day, colorHex: $colorHex, text: $text, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryOpeningStateImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, day, colorHex, text, locale);

  /// Create a copy of LibraryOpeningState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryOpeningStateImplCopyWith<_$LibraryOpeningStateImpl> get copyWith =>
      __$$LibraryOpeningStateImplCopyWithImpl<_$LibraryOpeningStateImpl>(
          this, _$identity);
}

abstract class _LibraryOpeningState implements LibraryOpeningState {
  const factory _LibraryOpeningState(
      {required final DateTime day,
      required final int colorHex,
      required final String? text,
      required final AppLocale locale}) = _$LibraryOpeningStateImpl;

  @override
  DateTime get day;

  @override
  int get colorHex;

  @override
  String? get text;

  @override
  AppLocale get locale;

  /// Create a copy of LibraryOpeningState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibraryOpeningStateImplCopyWith<_$LibraryOpeningStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LibraryCalendarMonth {
  DateTime get month => throw _privateConstructorUsedError;

  Map<DateTime, LibraryOpeningState> get calender =>
      throw _privateConstructorUsedError;

  Map<int, String> get calenderColors => throw _privateConstructorUsedError;

  AppLocale get locale => throw _privateConstructorUsedError;

  /// Create a copy of LibraryCalendarMonth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LibraryCalendarMonthCopyWith<LibraryCalendarMonth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryCalendarMonthCopyWith<$Res> {
  factory $LibraryCalendarMonthCopyWith(LibraryCalendarMonth value,
          $Res Function(LibraryCalendarMonth) then) =
      _$LibraryCalendarMonthCopyWithImpl<$Res, LibraryCalendarMonth>;

  @useResult
  $Res call(
      {DateTime month,
      Map<DateTime, LibraryOpeningState> calender,
      Map<int, String> calenderColors,
      AppLocale locale});
}

/// @nodoc
class _$LibraryCalendarMonthCopyWithImpl<$Res,
        $Val extends LibraryCalendarMonth>
    implements $LibraryCalendarMonthCopyWith<$Res> {
  _$LibraryCalendarMonthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibraryCalendarMonth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? calender = null,
    Object? calenderColors = null,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      calender: null == calender
          ? _value.calender
          : calender // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, LibraryOpeningState>,
      calenderColors: null == calenderColors
          ? _value.calenderColors
          : calenderColors // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LibraryCalendarMonthImplCopyWith<$Res>
    implements $LibraryCalendarMonthCopyWith<$Res> {
  factory _$$LibraryCalendarMonthImplCopyWith(_$LibraryCalendarMonthImpl value,
          $Res Function(_$LibraryCalendarMonthImpl) then) =
      __$$LibraryCalendarMonthImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {DateTime month,
      Map<DateTime, LibraryOpeningState> calender,
      Map<int, String> calenderColors,
      AppLocale locale});
}

/// @nodoc
class __$$LibraryCalendarMonthImplCopyWithImpl<$Res>
    extends _$LibraryCalendarMonthCopyWithImpl<$Res, _$LibraryCalendarMonthImpl>
    implements _$$LibraryCalendarMonthImplCopyWith<$Res> {
  __$$LibraryCalendarMonthImplCopyWithImpl(_$LibraryCalendarMonthImpl _value,
      $Res Function(_$LibraryCalendarMonthImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibraryCalendarMonth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? calender = null,
    Object? calenderColors = null,
    Object? locale = null,
  }) {
    return _then(_$LibraryCalendarMonthImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      calender: null == calender
          ? _value._calender
          : calender // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, LibraryOpeningState>,
      calenderColors: null == calenderColors
          ? _value._calenderColors
          : calenderColors // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
    ));
  }
}

/// @nodoc

class _$LibraryCalendarMonthImpl implements _LibraryCalendarMonth {
  const _$LibraryCalendarMonthImpl(
      {required this.month,
      required final Map<DateTime, LibraryOpeningState> calender,
      required final Map<int, String> calenderColors,
      required this.locale})
      : _calender = calender,
        _calenderColors = calenderColors;

  @override
  final DateTime month;
  final Map<DateTime, LibraryOpeningState> _calender;

  @override
  Map<DateTime, LibraryOpeningState> get calender {
    if (_calender is EqualUnmodifiableMapView) return _calender;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_calender);
  }

  final Map<int, String> _calenderColors;

  @override
  Map<int, String> get calenderColors {
    if (_calenderColors is EqualUnmodifiableMapView) return _calenderColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_calenderColors);
  }

  @override
  final AppLocale locale;

  @override
  String toString() {
    return 'LibraryCalendarMonth(month: $month, calender: $calender, calenderColors: $calenderColors, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryCalendarMonthImpl &&
            (identical(other.month, month) || other.month == month) &&
            const DeepCollectionEquality().equals(other._calender, _calender) &&
            const DeepCollectionEquality()
                .equals(other._calenderColors, _calenderColors) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      month,
      const DeepCollectionEquality().hash(_calender),
      const DeepCollectionEquality().hash(_calenderColors),
      locale);

  /// Create a copy of LibraryCalendarMonth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryCalendarMonthImplCopyWith<_$LibraryCalendarMonthImpl>
      get copyWith =>
          __$$LibraryCalendarMonthImplCopyWithImpl<_$LibraryCalendarMonthImpl>(
              this, _$identity);
}

abstract class _LibraryCalendarMonth implements LibraryCalendarMonth {
  const factory _LibraryCalendarMonth(
      {required final DateTime month,
      required final Map<DateTime, LibraryOpeningState> calender,
      required final Map<int, String> calenderColors,
      required final AppLocale locale}) = _$LibraryCalendarMonthImpl;

  @override
  DateTime get month;

  @override
  Map<DateTime, LibraryOpeningState> get calender;

  @override
  Map<int, String> get calenderColors;

  @override
  AppLocale get locale;

  /// Create a copy of LibraryCalendarMonth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibraryCalendarMonthImplCopyWith<_$LibraryCalendarMonthImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LibraryCalendarEntire {
  Map<DateTime, LibraryCalendarMonth> get calender =>
      throw _privateConstructorUsedError;

  /// Create a copy of LibraryCalendarEntire
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LibraryCalendarEntireCopyWith<LibraryCalendarEntire> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryCalendarEntireCopyWith<$Res> {
  factory $LibraryCalendarEntireCopyWith(LibraryCalendarEntire value,
          $Res Function(LibraryCalendarEntire) then) =
      _$LibraryCalendarEntireCopyWithImpl<$Res, LibraryCalendarEntire>;

  @useResult
  $Res call({Map<DateTime, LibraryCalendarMonth> calender});
}

/// @nodoc
class _$LibraryCalendarEntireCopyWithImpl<$Res,
        $Val extends LibraryCalendarEntire>
    implements $LibraryCalendarEntireCopyWith<$Res> {
  _$LibraryCalendarEntireCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibraryCalendarEntire
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calender = null,
  }) {
    return _then(_value.copyWith(
      calender: null == calender
          ? _value.calender
          : calender // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, LibraryCalendarMonth>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LibraryCalendarEntireImplCopyWith<$Res>
    implements $LibraryCalendarEntireCopyWith<$Res> {
  factory _$$LibraryCalendarEntireImplCopyWith(
          _$LibraryCalendarEntireImpl value,
          $Res Function(_$LibraryCalendarEntireImpl) then) =
      __$$LibraryCalendarEntireImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({Map<DateTime, LibraryCalendarMonth> calender});
}

/// @nodoc
class __$$LibraryCalendarEntireImplCopyWithImpl<$Res>
    extends _$LibraryCalendarEntireCopyWithImpl<$Res,
        _$LibraryCalendarEntireImpl>
    implements _$$LibraryCalendarEntireImplCopyWith<$Res> {
  __$$LibraryCalendarEntireImplCopyWithImpl(_$LibraryCalendarEntireImpl _value,
      $Res Function(_$LibraryCalendarEntireImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibraryCalendarEntire
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calender = null,
  }) {
    return _then(_$LibraryCalendarEntireImpl(
      calender: null == calender
          ? _value._calender
          : calender // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, LibraryCalendarMonth>,
    ));
  }
}

/// @nodoc

class _$LibraryCalendarEntireImpl implements _LibraryCalendarEntire {
  const _$LibraryCalendarEntireImpl(
      {required final Map<DateTime, LibraryCalendarMonth> calender})
      : _calender = calender;

  final Map<DateTime, LibraryCalendarMonth> _calender;

  @override
  Map<DateTime, LibraryCalendarMonth> get calender {
    if (_calender is EqualUnmodifiableMapView) return _calender;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_calender);
  }

  @override
  String toString() {
    return 'LibraryCalendarEntire(calender: $calender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryCalendarEntireImpl &&
            const DeepCollectionEquality().equals(other._calender, _calender));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_calender));

  /// Create a copy of LibraryCalendarEntire
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryCalendarEntireImplCopyWith<_$LibraryCalendarEntireImpl>
      get copyWith => __$$LibraryCalendarEntireImplCopyWithImpl<
          _$LibraryCalendarEntireImpl>(this, _$identity);
}

abstract class _LibraryCalendarEntire implements LibraryCalendarEntire {
  const factory _LibraryCalendarEntire(
          {required final Map<DateTime, LibraryCalendarMonth> calender}) =
      _$LibraryCalendarEntireImpl;

  @override
  Map<DateTime, LibraryCalendarMonth> get calender;

  /// Create a copy of LibraryCalendarEntire
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibraryCalendarEntireImplCopyWith<_$LibraryCalendarEntireImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LibraryCalenderQuery {
  DateTime get time => throw _privateConstructorUsedError;

  bool get isFourYear => throw _privateConstructorUsedError;

  /// Create a copy of LibraryCalenderQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LibraryCalenderQueryCopyWith<LibraryCalenderQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryCalenderQueryCopyWith<$Res> {
  factory $LibraryCalenderQueryCopyWith(LibraryCalenderQuery value,
          $Res Function(LibraryCalenderQuery) then) =
      _$LibraryCalenderQueryCopyWithImpl<$Res, LibraryCalenderQuery>;

  @useResult
  $Res call({DateTime time, bool isFourYear});
}

/// @nodoc
class _$LibraryCalenderQueryCopyWithImpl<$Res,
        $Val extends LibraryCalenderQuery>
    implements $LibraryCalenderQueryCopyWith<$Res> {
  _$LibraryCalenderQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibraryCalenderQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? isFourYear = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFourYear: null == isFourYear
          ? _value.isFourYear
          : isFourYear // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LibraryCalenderQueryImplCopyWith<$Res>
    implements $LibraryCalenderQueryCopyWith<$Res> {
  factory _$$LibraryCalenderQueryImplCopyWith(_$LibraryCalenderQueryImpl value,
          $Res Function(_$LibraryCalenderQueryImpl) then) =
      __$$LibraryCalenderQueryImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({DateTime time, bool isFourYear});
}

/// @nodoc
class __$$LibraryCalenderQueryImplCopyWithImpl<$Res>
    extends _$LibraryCalenderQueryCopyWithImpl<$Res, _$LibraryCalenderQueryImpl>
    implements _$$LibraryCalenderQueryImplCopyWith<$Res> {
  __$$LibraryCalenderQueryImplCopyWithImpl(_$LibraryCalenderQueryImpl _value,
      $Res Function(_$LibraryCalenderQueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of LibraryCalenderQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? isFourYear = null,
  }) {
    return _then(_$LibraryCalenderQueryImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFourYear: null == isFourYear
          ? _value.isFourYear
          : isFourYear // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LibraryCalenderQueryImpl implements _LibraryCalenderQuery {
  const _$LibraryCalenderQueryImpl(
      {required this.time, required this.isFourYear});

  @override
  final DateTime time;
  @override
  final bool isFourYear;

  @override
  String toString() {
    return 'LibraryCalenderQuery(time: $time, isFourYear: $isFourYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryCalenderQueryImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.isFourYear, isFourYear) ||
                other.isFourYear == isFourYear));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time, isFourYear);

  /// Create a copy of LibraryCalenderQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryCalenderQueryImplCopyWith<_$LibraryCalenderQueryImpl>
      get copyWith =>
          __$$LibraryCalenderQueryImplCopyWithImpl<_$LibraryCalenderQueryImpl>(
              this, _$identity);
}

abstract class _LibraryCalenderQuery implements LibraryCalenderQuery {
  const factory _LibraryCalenderQuery(
      {required final DateTime time,
      required final bool isFourYear}) = _$LibraryCalenderQueryImpl;

  @override
  DateTime get time;

  @override
  bool get isFourYear;

  /// Create a copy of LibraryCalenderQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibraryCalenderQueryImplCopyWith<_$LibraryCalenderQueryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
