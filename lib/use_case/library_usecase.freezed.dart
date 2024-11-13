// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetBookImageUseCaseParam {
  Book get book => throw _privateConstructorUsedError;

  /// Create a copy of GetBookImageUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetBookImageUseCaseParamCopyWith<GetBookImageUseCaseParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBookImageUseCaseParamCopyWith<$Res> {
  factory $GetBookImageUseCaseParamCopyWith(GetBookImageUseCaseParam value,
          $Res Function(GetBookImageUseCaseParam) then) =
      _$GetBookImageUseCaseParamCopyWithImpl<$Res, GetBookImageUseCaseParam>;

  @useResult
  $Res call({Book book});

  $BookCopyWith<$Res> get book;
}

/// @nodoc
class _$GetBookImageUseCaseParamCopyWithImpl<$Res,
        $Val extends GetBookImageUseCaseParam>
    implements $GetBookImageUseCaseParamCopyWith<$Res> {
  _$GetBookImageUseCaseParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetBookImageUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
  }) {
    return _then(_value.copyWith(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ) as $Val);
  }

  /// Create a copy of GetBookImageUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookCopyWith<$Res> get book {
    return $BookCopyWith<$Res>(_value.book, (value) {
      return _then(_value.copyWith(book: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetBookImageUseCaseParamImplCopyWith<$Res>
    implements $GetBookImageUseCaseParamCopyWith<$Res> {
  factory _$$GetBookImageUseCaseParamImplCopyWith(
          _$GetBookImageUseCaseParamImpl value,
          $Res Function(_$GetBookImageUseCaseParamImpl) then) =
      __$$GetBookImageUseCaseParamImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({Book book});

  @override
  $BookCopyWith<$Res> get book;
}

/// @nodoc
class __$$GetBookImageUseCaseParamImplCopyWithImpl<$Res>
    extends _$GetBookImageUseCaseParamCopyWithImpl<$Res,
        _$GetBookImageUseCaseParamImpl>
    implements _$$GetBookImageUseCaseParamImplCopyWith<$Res> {
  __$$GetBookImageUseCaseParamImplCopyWithImpl(
      _$GetBookImageUseCaseParamImpl _value,
      $Res Function(_$GetBookImageUseCaseParamImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetBookImageUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
  }) {
    return _then(_$GetBookImageUseCaseParamImpl(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc

class _$GetBookImageUseCaseParamImpl implements _GetBookImageUseCaseParam {
  const _$GetBookImageUseCaseParamImpl({required this.book});

  @override
  final Book book;

  @override
  String toString() {
    return 'GetBookImageUseCaseParam(book: $book)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBookImageUseCaseParamImpl &&
            (identical(other.book, book) || other.book == book));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book);

  /// Create a copy of GetBookImageUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBookImageUseCaseParamImplCopyWith<_$GetBookImageUseCaseParamImpl>
      get copyWith => __$$GetBookImageUseCaseParamImplCopyWithImpl<
          _$GetBookImageUseCaseParamImpl>(this, _$identity);
}

abstract class _GetBookImageUseCaseParam implements GetBookImageUseCaseParam {
  const factory _GetBookImageUseCaseParam({required final Book book}) =
      _$GetBookImageUseCaseParamImpl;

  @override
  Book get book;

  /// Create a copy of GetBookImageUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetBookImageUseCaseParamImplCopyWith<_$GetBookImageUseCaseParamImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetBookSearchResultUseCaseParam {
  BookSearchQuery get query => throw _privateConstructorUsedError;

  /// Create a copy of GetBookSearchResultUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetBookSearchResultUseCaseParamCopyWith<GetBookSearchResultUseCaseParam>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBookSearchResultUseCaseParamCopyWith<$Res> {
  factory $GetBookSearchResultUseCaseParamCopyWith(
          GetBookSearchResultUseCaseParam value,
          $Res Function(GetBookSearchResultUseCaseParam) then) =
      _$GetBookSearchResultUseCaseParamCopyWithImpl<$Res,
          GetBookSearchResultUseCaseParam>;

  @useResult
  $Res call({BookSearchQuery query});

  $BookSearchQueryCopyWith<$Res> get query;
}

/// @nodoc
class _$GetBookSearchResultUseCaseParamCopyWithImpl<$Res,
        $Val extends GetBookSearchResultUseCaseParam>
    implements $GetBookSearchResultUseCaseParamCopyWith<$Res> {
  _$GetBookSearchResultUseCaseParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetBookSearchResultUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as BookSearchQuery,
    ) as $Val);
  }

  /// Create a copy of GetBookSearchResultUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookSearchQueryCopyWith<$Res> get query {
    return $BookSearchQueryCopyWith<$Res>(_value.query, (value) {
      return _then(_value.copyWith(query: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetBookSearchResultUseCaseParamImplCopyWith<$Res>
    implements $GetBookSearchResultUseCaseParamCopyWith<$Res> {
  factory _$$GetBookSearchResultUseCaseParamImplCopyWith(
          _$GetBookSearchResultUseCaseParamImpl value,
          $Res Function(_$GetBookSearchResultUseCaseParamImpl) then) =
      __$$GetBookSearchResultUseCaseParamImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({BookSearchQuery query});

  @override
  $BookSearchQueryCopyWith<$Res> get query;
}

/// @nodoc
class __$$GetBookSearchResultUseCaseParamImplCopyWithImpl<$Res>
    extends _$GetBookSearchResultUseCaseParamCopyWithImpl<$Res,
        _$GetBookSearchResultUseCaseParamImpl>
    implements _$$GetBookSearchResultUseCaseParamImplCopyWith<$Res> {
  __$$GetBookSearchResultUseCaseParamImplCopyWithImpl(
      _$GetBookSearchResultUseCaseParamImpl _value,
      $Res Function(_$GetBookSearchResultUseCaseParamImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetBookSearchResultUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$GetBookSearchResultUseCaseParamImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as BookSearchQuery,
    ));
  }
}

/// @nodoc

class _$GetBookSearchResultUseCaseParamImpl
    implements _GetBookSearchResultUseCaseParam {
  const _$GetBookSearchResultUseCaseParamImpl({required this.query});

  @override
  final BookSearchQuery query;

  @override
  String toString() {
    return 'GetBookSearchResultUseCaseParam(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBookSearchResultUseCaseParamImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of GetBookSearchResultUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBookSearchResultUseCaseParamImplCopyWith<
          _$GetBookSearchResultUseCaseParamImpl>
      get copyWith => __$$GetBookSearchResultUseCaseParamImplCopyWithImpl<
          _$GetBookSearchResultUseCaseParamImpl>(this, _$identity);
}

abstract class _GetBookSearchResultUseCaseParam
    implements GetBookSearchResultUseCaseParam {
  const factory _GetBookSearchResultUseCaseParam(
          {required final BookSearchQuery query}) =
      _$GetBookSearchResultUseCaseParamImpl;

  @override
  BookSearchQuery get query;

  /// Create a copy of GetBookSearchResultUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetBookSearchResultUseCaseParamImplCopyWith<
          _$GetBookSearchResultUseCaseParamImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetBookDetailUseCaseParam {
  Book get book => throw _privateConstructorUsedError;

  /// Create a copy of GetBookDetailUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetBookDetailUseCaseParamCopyWith<GetBookDetailUseCaseParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBookDetailUseCaseParamCopyWith<$Res> {
  factory $GetBookDetailUseCaseParamCopyWith(GetBookDetailUseCaseParam value,
          $Res Function(GetBookDetailUseCaseParam) then) =
      _$GetBookDetailUseCaseParamCopyWithImpl<$Res, GetBookDetailUseCaseParam>;

  @useResult
  $Res call({Book book});

  $BookCopyWith<$Res> get book;
}

/// @nodoc
class _$GetBookDetailUseCaseParamCopyWithImpl<$Res,
        $Val extends GetBookDetailUseCaseParam>
    implements $GetBookDetailUseCaseParamCopyWith<$Res> {
  _$GetBookDetailUseCaseParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetBookDetailUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
  }) {
    return _then(_value.copyWith(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ) as $Val);
  }

  /// Create a copy of GetBookDetailUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookCopyWith<$Res> get book {
    return $BookCopyWith<$Res>(_value.book, (value) {
      return _then(_value.copyWith(book: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetBookDetailUseCaseParamImplCopyWith<$Res>
    implements $GetBookDetailUseCaseParamCopyWith<$Res> {
  factory _$$GetBookDetailUseCaseParamImplCopyWith(
          _$GetBookDetailUseCaseParamImpl value,
          $Res Function(_$GetBookDetailUseCaseParamImpl) then) =
      __$$GetBookDetailUseCaseParamImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({Book book});

  @override
  $BookCopyWith<$Res> get book;
}

/// @nodoc
class __$$GetBookDetailUseCaseParamImplCopyWithImpl<$Res>
    extends _$GetBookDetailUseCaseParamCopyWithImpl<$Res,
        _$GetBookDetailUseCaseParamImpl>
    implements _$$GetBookDetailUseCaseParamImplCopyWith<$Res> {
  __$$GetBookDetailUseCaseParamImplCopyWithImpl(
      _$GetBookDetailUseCaseParamImpl _value,
      $Res Function(_$GetBookDetailUseCaseParamImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetBookDetailUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
  }) {
    return _then(_$GetBookDetailUseCaseParamImpl(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc

class _$GetBookDetailUseCaseParamImpl implements _GetBookDetailUseCaseParam {
  const _$GetBookDetailUseCaseParamImpl({required this.book});

  @override
  final Book book;

  @override
  String toString() {
    return 'GetBookDetailUseCaseParam(book: $book)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBookDetailUseCaseParamImpl &&
            (identical(other.book, book) || other.book == book));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book);

  /// Create a copy of GetBookDetailUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBookDetailUseCaseParamImplCopyWith<_$GetBookDetailUseCaseParamImpl>
      get copyWith => __$$GetBookDetailUseCaseParamImplCopyWithImpl<
          _$GetBookDetailUseCaseParamImpl>(this, _$identity);
}

abstract class _GetBookDetailUseCaseParam implements GetBookDetailUseCaseParam {
  const factory _GetBookDetailUseCaseParam({required final Book book}) =
      _$GetBookDetailUseCaseParamImpl;

  @override
  Book get book;

  /// Create a copy of GetBookDetailUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetBookDetailUseCaseParamImplCopyWith<_$GetBookDetailUseCaseParamImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetLibraryCalenderUseCaseParam {
  LibraryCalenderQuery get query => throw _privateConstructorUsedError;

  /// Create a copy of GetLibraryCalenderUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetLibraryCalenderUseCaseParamCopyWith<GetLibraryCalenderUseCaseParam>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLibraryCalenderUseCaseParamCopyWith<$Res> {
  factory $GetLibraryCalenderUseCaseParamCopyWith(
          GetLibraryCalenderUseCaseParam value,
          $Res Function(GetLibraryCalenderUseCaseParam) then) =
      _$GetLibraryCalenderUseCaseParamCopyWithImpl<$Res,
          GetLibraryCalenderUseCaseParam>;

  @useResult
  $Res call({LibraryCalenderQuery query});

  $LibraryCalenderQueryCopyWith<$Res> get query;
}

/// @nodoc
class _$GetLibraryCalenderUseCaseParamCopyWithImpl<$Res,
        $Val extends GetLibraryCalenderUseCaseParam>
    implements $GetLibraryCalenderUseCaseParamCopyWith<$Res> {
  _$GetLibraryCalenderUseCaseParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetLibraryCalenderUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as LibraryCalenderQuery,
    ) as $Val);
  }

  /// Create a copy of GetLibraryCalenderUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LibraryCalenderQueryCopyWith<$Res> get query {
    return $LibraryCalenderQueryCopyWith<$Res>(_value.query, (value) {
      return _then(_value.copyWith(query: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetLibraryCalenderUseCaseParamImplCopyWith<$Res>
    implements $GetLibraryCalenderUseCaseParamCopyWith<$Res> {
  factory _$$GetLibraryCalenderUseCaseParamImplCopyWith(
          _$GetLibraryCalenderUseCaseParamImpl value,
          $Res Function(_$GetLibraryCalenderUseCaseParamImpl) then) =
      __$$GetLibraryCalenderUseCaseParamImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({LibraryCalenderQuery query});

  @override
  $LibraryCalenderQueryCopyWith<$Res> get query;
}

/// @nodoc
class __$$GetLibraryCalenderUseCaseParamImplCopyWithImpl<$Res>
    extends _$GetLibraryCalenderUseCaseParamCopyWithImpl<$Res,
        _$GetLibraryCalenderUseCaseParamImpl>
    implements _$$GetLibraryCalenderUseCaseParamImplCopyWith<$Res> {
  __$$GetLibraryCalenderUseCaseParamImplCopyWithImpl(
      _$GetLibraryCalenderUseCaseParamImpl _value,
      $Res Function(_$GetLibraryCalenderUseCaseParamImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetLibraryCalenderUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$GetLibraryCalenderUseCaseParamImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as LibraryCalenderQuery,
    ));
  }
}

/// @nodoc

class _$GetLibraryCalenderUseCaseParamImpl
    implements _GetLibraryCalenderUseCaseParam {
  const _$GetLibraryCalenderUseCaseParamImpl({required this.query});

  @override
  final LibraryCalenderQuery query;

  @override
  String toString() {
    return 'GetLibraryCalenderUseCaseParam(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLibraryCalenderUseCaseParamImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of GetLibraryCalenderUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLibraryCalenderUseCaseParamImplCopyWith<
          _$GetLibraryCalenderUseCaseParamImpl>
      get copyWith => __$$GetLibraryCalenderUseCaseParamImplCopyWithImpl<
          _$GetLibraryCalenderUseCaseParamImpl>(this, _$identity);
}

abstract class _GetLibraryCalenderUseCaseParam
    implements GetLibraryCalenderUseCaseParam {
  const factory _GetLibraryCalenderUseCaseParam(
          {required final LibraryCalenderQuery query}) =
      _$GetLibraryCalenderUseCaseParamImpl;

  @override
  LibraryCalenderQuery get query;

  /// Create a copy of GetLibraryCalenderUseCaseParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetLibraryCalenderUseCaseParamImplCopyWith<
          _$GetLibraryCalenderUseCaseParamImpl>
      get copyWith => throw _privateConstructorUsedError;
}
