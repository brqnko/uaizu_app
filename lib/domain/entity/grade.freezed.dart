// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grade.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ToeicScore {
  DateTime get date => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int get reqdingScore => throw _privateConstructorUsedError;
  int get listeningScore => throw _privateConstructorUsedError;

  /// Create a copy of ToeicScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ToeicScoreCopyWith<ToeicScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToeicScoreCopyWith<$Res> {
  factory $ToeicScoreCopyWith(
          ToeicScore value, $Res Function(ToeicScore) then) =
      _$ToeicScoreCopyWithImpl<$Res, ToeicScore>;
  @useResult
  $Res call(
      {DateTime date,
      String type,
      int score,
      int reqdingScore,
      int listeningScore});
}

/// @nodoc
class _$ToeicScoreCopyWithImpl<$Res, $Val extends ToeicScore>
    implements $ToeicScoreCopyWith<$Res> {
  _$ToeicScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ToeicScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? score = null,
    Object? reqdingScore = null,
    Object? listeningScore = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      reqdingScore: null == reqdingScore
          ? _value.reqdingScore
          : reqdingScore // ignore: cast_nullable_to_non_nullable
              as int,
      listeningScore: null == listeningScore
          ? _value.listeningScore
          : listeningScore // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToeicScoreImplCopyWith<$Res>
    implements $ToeicScoreCopyWith<$Res> {
  factory _$$ToeicScoreImplCopyWith(
          _$ToeicScoreImpl value, $Res Function(_$ToeicScoreImpl) then) =
      __$$ToeicScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      String type,
      int score,
      int reqdingScore,
      int listeningScore});
}

/// @nodoc
class __$$ToeicScoreImplCopyWithImpl<$Res>
    extends _$ToeicScoreCopyWithImpl<$Res, _$ToeicScoreImpl>
    implements _$$ToeicScoreImplCopyWith<$Res> {
  __$$ToeicScoreImplCopyWithImpl(
      _$ToeicScoreImpl _value, $Res Function(_$ToeicScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of ToeicScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? score = null,
    Object? reqdingScore = null,
    Object? listeningScore = null,
  }) {
    return _then(_$ToeicScoreImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      reqdingScore: null == reqdingScore
          ? _value.reqdingScore
          : reqdingScore // ignore: cast_nullable_to_non_nullable
              as int,
      listeningScore: null == listeningScore
          ? _value.listeningScore
          : listeningScore // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ToeicScoreImpl implements _ToeicScore {
  const _$ToeicScoreImpl(
      {required this.date,
      required this.type,
      required this.score,
      required this.reqdingScore,
      required this.listeningScore});

  @override
  final DateTime date;
  @override
  final String type;
  @override
  final int score;
  @override
  final int reqdingScore;
  @override
  final int listeningScore;

  @override
  String toString() {
    return 'ToeicScore(date: $date, type: $type, score: $score, reqdingScore: $reqdingScore, listeningScore: $listeningScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToeicScoreImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.reqdingScore, reqdingScore) ||
                other.reqdingScore == reqdingScore) &&
            (identical(other.listeningScore, listeningScore) ||
                other.listeningScore == listeningScore));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, date, type, score, reqdingScore, listeningScore);

  /// Create a copy of ToeicScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToeicScoreImplCopyWith<_$ToeicScoreImpl> get copyWith =>
      __$$ToeicScoreImplCopyWithImpl<_$ToeicScoreImpl>(this, _$identity);
}

abstract class _ToeicScore implements ToeicScore {
  const factory _ToeicScore(
      {required final DateTime date,
      required final String type,
      required final int score,
      required final int reqdingScore,
      required final int listeningScore}) = _$ToeicScoreImpl;

  @override
  DateTime get date;
  @override
  String get type;
  @override
  int get score;
  @override
  int get reqdingScore;
  @override
  int get listeningScore;

  /// Create a copy of ToeicScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToeicScoreImplCopyWith<_$ToeicScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SubjectGrade {
  int get year => throw _privateConstructorUsedError;
  String get semester => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get subjectTitle => throw _privateConstructorUsedError;
  String get teacher => throw _privateConstructorUsedError;
  String get score => throw _privateConstructorUsedError; // 履修中になるかもしれない
  String get grade => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  AppLocale get locale => throw _privateConstructorUsedError;

  /// Create a copy of SubjectGrade
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectGradeCopyWith<SubjectGrade> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectGradeCopyWith<$Res> {
  factory $SubjectGradeCopyWith(
          SubjectGrade value, $Res Function(SubjectGrade) then) =
      _$SubjectGradeCopyWithImpl<$Res, SubjectGrade>;
  @useResult
  $Res call(
      {int year,
      String semester,
      String code,
      String subjectTitle,
      String teacher,
      String score,
      String grade,
      String result,
      AppLocale locale});
}

/// @nodoc
class _$SubjectGradeCopyWithImpl<$Res, $Val extends SubjectGrade>
    implements $SubjectGradeCopyWith<$Res> {
  _$SubjectGradeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectGrade
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? semester = null,
    Object? code = null,
    Object? subjectTitle = null,
    Object? teacher = null,
    Object? score = null,
    Object? grade = null,
    Object? result = null,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      subjectTitle: null == subjectTitle
          ? _value.subjectTitle
          : subjectTitle // ignore: cast_nullable_to_non_nullable
              as String,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectGradeImplCopyWith<$Res>
    implements $SubjectGradeCopyWith<$Res> {
  factory _$$SubjectGradeImplCopyWith(
          _$SubjectGradeImpl value, $Res Function(_$SubjectGradeImpl) then) =
      __$$SubjectGradeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int year,
      String semester,
      String code,
      String subjectTitle,
      String teacher,
      String score,
      String grade,
      String result,
      AppLocale locale});
}

/// @nodoc
class __$$SubjectGradeImplCopyWithImpl<$Res>
    extends _$SubjectGradeCopyWithImpl<$Res, _$SubjectGradeImpl>
    implements _$$SubjectGradeImplCopyWith<$Res> {
  __$$SubjectGradeImplCopyWithImpl(
      _$SubjectGradeImpl _value, $Res Function(_$SubjectGradeImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectGrade
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? semester = null,
    Object? code = null,
    Object? subjectTitle = null,
    Object? teacher = null,
    Object? score = null,
    Object? grade = null,
    Object? result = null,
    Object? locale = null,
  }) {
    return _then(_$SubjectGradeImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      subjectTitle: null == subjectTitle
          ? _value.subjectTitle
          : subjectTitle // ignore: cast_nullable_to_non_nullable
              as String,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
    ));
  }
}

/// @nodoc

class _$SubjectGradeImpl implements _SubjectGrade {
  const _$SubjectGradeImpl(
      {required this.year,
      required this.semester,
      required this.code,
      required this.subjectTitle,
      required this.teacher,
      required this.score,
      required this.grade,
      required this.result,
      required this.locale});

  @override
  final int year;
  @override
  final String semester;
  @override
  final String code;
  @override
  final String subjectTitle;
  @override
  final String teacher;
  @override
  final String score;
// 履修中になるかもしれない
  @override
  final String grade;
  @override
  final String result;
  @override
  final AppLocale locale;

  @override
  String toString() {
    return 'SubjectGrade(year: $year, semester: $semester, code: $code, subjectTitle: $subjectTitle, teacher: $teacher, score: $score, grade: $grade, result: $result, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectGradeImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.subjectTitle, subjectTitle) ||
                other.subjectTitle == subjectTitle) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year, semester, code,
      subjectTitle, teacher, score, grade, result, locale);

  /// Create a copy of SubjectGrade
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectGradeImplCopyWith<_$SubjectGradeImpl> get copyWith =>
      __$$SubjectGradeImplCopyWithImpl<_$SubjectGradeImpl>(this, _$identity);
}

abstract class _SubjectGrade implements SubjectGrade {
  const factory _SubjectGrade(
      {required final int year,
      required final String semester,
      required final String code,
      required final String subjectTitle,
      required final String teacher,
      required final String score,
      required final String grade,
      required final String result,
      required final AppLocale locale}) = _$SubjectGradeImpl;

  @override
  int get year;
  @override
  String get semester;
  @override
  String get code;
  @override
  String get subjectTitle;
  @override
  String get teacher;
  @override
  String get score; // 履修中になるかもしれない
  @override
  String get grade;
  @override
  String get result;
  @override
  AppLocale get locale;

  /// Create a copy of SubjectGrade
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectGradeImplCopyWith<_$SubjectGradeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Grade {
  String get studentId => throw _privateConstructorUsedError;
  String get studentName => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;
  String get semester => throw _privateConstructorUsedError;
  ToeicScore? get bestToeicScore => throw _privateConstructorUsedError;
  List<ToeicScore> get toeicScores => throw _privateConstructorUsedError;
  List<SubjectGrade> get subjectGrades => throw _privateConstructorUsedError;
  AppLocale get locale => throw _privateConstructorUsedError;

  /// Create a copy of Grade
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GradeCopyWith<Grade> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GradeCopyWith<$Res> {
  factory $GradeCopyWith(Grade value, $Res Function(Grade) then) =
      _$GradeCopyWithImpl<$Res, Grade>;
  @useResult
  $Res call(
      {String studentId,
      String studentName,
      String department,
      String year,
      String semester,
      ToeicScore? bestToeicScore,
      List<ToeicScore> toeicScores,
      List<SubjectGrade> subjectGrades,
      AppLocale locale});

  $ToeicScoreCopyWith<$Res>? get bestToeicScore;
}

/// @nodoc
class _$GradeCopyWithImpl<$Res, $Val extends Grade>
    implements $GradeCopyWith<$Res> {
  _$GradeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Grade
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? studentName = null,
    Object? department = null,
    Object? year = null,
    Object? semester = null,
    Object? bestToeicScore = freezed,
    Object? toeicScores = null,
    Object? subjectGrades = null,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      studentName: null == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      bestToeicScore: freezed == bestToeicScore
          ? _value.bestToeicScore
          : bestToeicScore // ignore: cast_nullable_to_non_nullable
              as ToeicScore?,
      toeicScores: null == toeicScores
          ? _value.toeicScores
          : toeicScores // ignore: cast_nullable_to_non_nullable
              as List<ToeicScore>,
      subjectGrades: null == subjectGrades
          ? _value.subjectGrades
          : subjectGrades // ignore: cast_nullable_to_non_nullable
              as List<SubjectGrade>,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
    ) as $Val);
  }

  /// Create a copy of Grade
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ToeicScoreCopyWith<$Res>? get bestToeicScore {
    if (_value.bestToeicScore == null) {
      return null;
    }

    return $ToeicScoreCopyWith<$Res>(_value.bestToeicScore!, (value) {
      return _then(_value.copyWith(bestToeicScore: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GradeImplCopyWith<$Res> implements $GradeCopyWith<$Res> {
  factory _$$GradeImplCopyWith(
          _$GradeImpl value, $Res Function(_$GradeImpl) then) =
      __$$GradeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String studentId,
      String studentName,
      String department,
      String year,
      String semester,
      ToeicScore? bestToeicScore,
      List<ToeicScore> toeicScores,
      List<SubjectGrade> subjectGrades,
      AppLocale locale});

  @override
  $ToeicScoreCopyWith<$Res>? get bestToeicScore;
}

/// @nodoc
class __$$GradeImplCopyWithImpl<$Res>
    extends _$GradeCopyWithImpl<$Res, _$GradeImpl>
    implements _$$GradeImplCopyWith<$Res> {
  __$$GradeImplCopyWithImpl(
      _$GradeImpl _value, $Res Function(_$GradeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Grade
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? studentName = null,
    Object? department = null,
    Object? year = null,
    Object? semester = null,
    Object? bestToeicScore = freezed,
    Object? toeicScores = null,
    Object? subjectGrades = null,
    Object? locale = null,
  }) {
    return _then(_$GradeImpl(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      studentName: null == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      bestToeicScore: freezed == bestToeicScore
          ? _value.bestToeicScore
          : bestToeicScore // ignore: cast_nullable_to_non_nullable
              as ToeicScore?,
      toeicScores: null == toeicScores
          ? _value._toeicScores
          : toeicScores // ignore: cast_nullable_to_non_nullable
              as List<ToeicScore>,
      subjectGrades: null == subjectGrades
          ? _value._subjectGrades
          : subjectGrades // ignore: cast_nullable_to_non_nullable
              as List<SubjectGrade>,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
    ));
  }
}

/// @nodoc

class _$GradeImpl implements _Grade {
  const _$GradeImpl(
      {required this.studentId,
      required this.studentName,
      required this.department,
      required this.year,
      required this.semester,
      required this.bestToeicScore,
      required final List<ToeicScore> toeicScores,
      required final List<SubjectGrade> subjectGrades,
      required this.locale})
      : _toeicScores = toeicScores,
        _subjectGrades = subjectGrades;

  @override
  final String studentId;
  @override
  final String studentName;
  @override
  final String department;
  @override
  final String year;
  @override
  final String semester;
  @override
  final ToeicScore? bestToeicScore;
  final List<ToeicScore> _toeicScores;
  @override
  List<ToeicScore> get toeicScores {
    if (_toeicScores is EqualUnmodifiableListView) return _toeicScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toeicScores);
  }

  final List<SubjectGrade> _subjectGrades;
  @override
  List<SubjectGrade> get subjectGrades {
    if (_subjectGrades is EqualUnmodifiableListView) return _subjectGrades;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjectGrades);
  }

  @override
  final AppLocale locale;

  @override
  String toString() {
    return 'Grade(studentId: $studentId, studentName: $studentName, department: $department, year: $year, semester: $semester, bestToeicScore: $bestToeicScore, toeicScores: $toeicScores, subjectGrades: $subjectGrades, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GradeImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            (identical(other.bestToeicScore, bestToeicScore) ||
                other.bestToeicScore == bestToeicScore) &&
            const DeepCollectionEquality()
                .equals(other._toeicScores, _toeicScores) &&
            const DeepCollectionEquality()
                .equals(other._subjectGrades, _subjectGrades) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      studentId,
      studentName,
      department,
      year,
      semester,
      bestToeicScore,
      const DeepCollectionEquality().hash(_toeicScores),
      const DeepCollectionEquality().hash(_subjectGrades),
      locale);

  /// Create a copy of Grade
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GradeImplCopyWith<_$GradeImpl> get copyWith =>
      __$$GradeImplCopyWithImpl<_$GradeImpl>(this, _$identity);
}

abstract class _Grade implements Grade {
  const factory _Grade(
      {required final String studentId,
      required final String studentName,
      required final String department,
      required final String year,
      required final String semester,
      required final ToeicScore? bestToeicScore,
      required final List<ToeicScore> toeicScores,
      required final List<SubjectGrade> subjectGrades,
      required final AppLocale locale}) = _$GradeImpl;

  @override
  String get studentId;
  @override
  String get studentName;
  @override
  String get department;
  @override
  String get year;
  @override
  String get semester;
  @override
  ToeicScore? get bestToeicScore;
  @override
  List<ToeicScore> get toeicScores;
  @override
  List<SubjectGrade> get subjectGrades;
  @override
  AppLocale get locale;

  /// Create a copy of Grade
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GradeImplCopyWith<_$GradeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GradeQuery {
  bool get showAll => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  int? get quarter => throw _privateConstructorUsedError;

  /// Create a copy of GradeQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GradeQueryCopyWith<GradeQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GradeQueryCopyWith<$Res> {
  factory $GradeQueryCopyWith(
          GradeQuery value, $Res Function(GradeQuery) then) =
      _$GradeQueryCopyWithImpl<$Res, GradeQuery>;
  @useResult
  $Res call({bool showAll, int? year, int? quarter});
}

/// @nodoc
class _$GradeQueryCopyWithImpl<$Res, $Val extends GradeQuery>
    implements $GradeQueryCopyWith<$Res> {
  _$GradeQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GradeQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showAll = null,
    Object? year = freezed,
    Object? quarter = freezed,
  }) {
    return _then(_value.copyWith(
      showAll: null == showAll
          ? _value.showAll
          : showAll // ignore: cast_nullable_to_non_nullable
              as bool,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      quarter: freezed == quarter
          ? _value.quarter
          : quarter // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GradeQueryImplCopyWith<$Res>
    implements $GradeQueryCopyWith<$Res> {
  factory _$$GradeQueryImplCopyWith(
          _$GradeQueryImpl value, $Res Function(_$GradeQueryImpl) then) =
      __$$GradeQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showAll, int? year, int? quarter});
}

/// @nodoc
class __$$GradeQueryImplCopyWithImpl<$Res>
    extends _$GradeQueryCopyWithImpl<$Res, _$GradeQueryImpl>
    implements _$$GradeQueryImplCopyWith<$Res> {
  __$$GradeQueryImplCopyWithImpl(
      _$GradeQueryImpl _value, $Res Function(_$GradeQueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of GradeQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showAll = null,
    Object? year = freezed,
    Object? quarter = freezed,
  }) {
    return _then(_$GradeQueryImpl(
      showAll: null == showAll
          ? _value.showAll
          : showAll // ignore: cast_nullable_to_non_nullable
              as bool,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      quarter: freezed == quarter
          ? _value.quarter
          : quarter // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GradeQueryImpl implements _GradeQuery {
  const _$GradeQueryImpl(
      {required this.showAll, required this.year, required this.quarter});

  @override
  final bool showAll;
  @override
  final int? year;
  @override
  final int? quarter;

  @override
  String toString() {
    return 'GradeQuery(showAll: $showAll, year: $year, quarter: $quarter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GradeQueryImpl &&
            (identical(other.showAll, showAll) || other.showAll == showAll) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.quarter, quarter) || other.quarter == quarter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showAll, year, quarter);

  /// Create a copy of GradeQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GradeQueryImplCopyWith<_$GradeQueryImpl> get copyWith =>
      __$$GradeQueryImplCopyWithImpl<_$GradeQueryImpl>(this, _$identity);
}

abstract class _GradeQuery implements GradeQuery {
  const factory _GradeQuery(
      {required final bool showAll,
      required final int? year,
      required final int? quarter}) = _$GradeQueryImpl;

  @override
  bool get showAll;
  @override
  int? get year;
  @override
  int? get quarter;

  /// Create a copy of GradeQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GradeQueryImplCopyWith<_$GradeQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
