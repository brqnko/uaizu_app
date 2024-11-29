// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountInfo {
  String get studentId => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountInfoCopyWith<AccountInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountInfoCopyWith<$Res> {
  factory $AccountInfoCopyWith(
          AccountInfo value, $Res Function(AccountInfo) then) =
      _$AccountInfoCopyWithImpl<$Res, AccountInfo>;
  @useResult
  $Res call({String studentId, String password});
}

/// @nodoc
class _$AccountInfoCopyWithImpl<$Res, $Val extends AccountInfo>
    implements $AccountInfoCopyWith<$Res> {
  _$AccountInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountInfoImplCopyWith<$Res>
    implements $AccountInfoCopyWith<$Res> {
  factory _$$AccountInfoImplCopyWith(
          _$AccountInfoImpl value, $Res Function(_$AccountInfoImpl) then) =
      __$$AccountInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String studentId, String password});
}

/// @nodoc
class __$$AccountInfoImplCopyWithImpl<$Res>
    extends _$AccountInfoCopyWithImpl<$Res, _$AccountInfoImpl>
    implements _$$AccountInfoImplCopyWith<$Res> {
  __$$AccountInfoImplCopyWithImpl(
      _$AccountInfoImpl _value, $Res Function(_$AccountInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? password = null,
  }) {
    return _then(_$AccountInfoImpl(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccountInfoImpl implements _AccountInfo {
  const _$AccountInfoImpl({required this.studentId, required this.password});

  @override
  final String studentId;
  @override
  final String password;

  @override
  String toString() {
    return 'AccountInfo(studentId: $studentId, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountInfoImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, studentId, password);

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountInfoImplCopyWith<_$AccountInfoImpl> get copyWith =>
      __$$AccountInfoImplCopyWithImpl<_$AccountInfoImpl>(this, _$identity);
}

abstract class _AccountInfo implements AccountInfo {
  const factory _AccountInfo(
      {required final String studentId,
      required final String password}) = _$AccountInfoImpl;

  @override
  String get studentId;
  @override
  String get password;

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountInfoImplCopyWith<_$AccountInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppSettings {
  AccountInfo get accountInfo => throw _privateConstructorUsedError;
  bool get hideStudentId => throw _privateConstructorUsedError;
  AppTheme get appTheme => throw _privateConstructorUsedError;
  AppLocale get appLocale => throw _privateConstructorUsedError;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call(
      {AccountInfo accountInfo,
      bool hideStudentId,
      AppTheme appTheme,
      AppLocale appLocale});

  $AccountInfoCopyWith<$Res> get accountInfo;
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountInfo = null,
    Object? hideStudentId = null,
    Object? appTheme = null,
    Object? appLocale = null,
  }) {
    return _then(_value.copyWith(
      accountInfo: null == accountInfo
          ? _value.accountInfo
          : accountInfo // ignore: cast_nullable_to_non_nullable
              as AccountInfo,
      hideStudentId: null == hideStudentId
          ? _value.hideStudentId
          : hideStudentId // ignore: cast_nullable_to_non_nullable
              as bool,
      appTheme: null == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      appLocale: null == appLocale
          ? _value.appLocale
          : appLocale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
    ) as $Val);
  }

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountInfoCopyWith<$Res> get accountInfo {
    return $AccountInfoCopyWith<$Res>(_value.accountInfo, (value) {
      return _then(_value.copyWith(accountInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppSettingsImplCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$AppSettingsImplCopyWith(
          _$AppSettingsImpl value, $Res Function(_$AppSettingsImpl) then) =
      __$$AppSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AccountInfo accountInfo,
      bool hideStudentId,
      AppTheme appTheme,
      AppLocale appLocale});

  @override
  $AccountInfoCopyWith<$Res> get accountInfo;
}

/// @nodoc
class __$$AppSettingsImplCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$AppSettingsImpl>
    implements _$$AppSettingsImplCopyWith<$Res> {
  __$$AppSettingsImplCopyWithImpl(
      _$AppSettingsImpl _value, $Res Function(_$AppSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountInfo = null,
    Object? hideStudentId = null,
    Object? appTheme = null,
    Object? appLocale = null,
  }) {
    return _then(_$AppSettingsImpl(
      accountInfo: null == accountInfo
          ? _value.accountInfo
          : accountInfo // ignore: cast_nullable_to_non_nullable
              as AccountInfo,
      hideStudentId: null == hideStudentId
          ? _value.hideStudentId
          : hideStudentId // ignore: cast_nullable_to_non_nullable
              as bool,
      appTheme: null == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      appLocale: null == appLocale
          ? _value.appLocale
          : appLocale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
    ));
  }
}

/// @nodoc

class _$AppSettingsImpl implements _AppSettings {
  const _$AppSettingsImpl(
      {required this.accountInfo,
      required this.hideStudentId,
      required this.appTheme,
      required this.appLocale});

  @override
  final AccountInfo accountInfo;
  @override
  final bool hideStudentId;
  @override
  final AppTheme appTheme;
  @override
  final AppLocale appLocale;

  @override
  String toString() {
    return 'AppSettings(accountInfo: $accountInfo, hideStudentId: $hideStudentId, appTheme: $appTheme, appLocale: $appLocale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsImpl &&
            (identical(other.accountInfo, accountInfo) ||
                other.accountInfo == accountInfo) &&
            (identical(other.hideStudentId, hideStudentId) ||
                other.hideStudentId == hideStudentId) &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme) &&
            (identical(other.appLocale, appLocale) ||
                other.appLocale == appLocale));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accountInfo, hideStudentId, appTheme, appLocale);

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      __$$AppSettingsImplCopyWithImpl<_$AppSettingsImpl>(this, _$identity);
}

abstract class _AppSettings implements AppSettings {
  const factory _AppSettings(
      {required final AccountInfo accountInfo,
      required final bool hideStudentId,
      required final AppTheme appTheme,
      required final AppLocale appLocale}) = _$AppSettingsImpl;

  @override
  AccountInfo get accountInfo;
  @override
  bool get hideStudentId;
  @override
  AppTheme get appTheme;
  @override
  AppLocale get appLocale;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
