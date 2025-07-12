import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uaizu_app/domain/entity/campus_square_calendar.dart';
import 'package:uaizu_app/domain/entity/grade.dart';
import 'package:uaizu_app/domain/entity/registration.dart';
import 'package:uaizu_app/domain/entity/syllabus.dart';
import 'package:uaizu_app/domain/provider/calendar_repository_provider.dart';
import 'package:uaizu_app/domain/provider/grade_repository_provider.dart';
import 'package:uaizu_app/domain/provider/registration_repository_provider.dart';
import 'package:uaizu_app/domain/provider/syllabus_repository_provider.dart';
import 'package:uaizu_app/domain/repository/calendar_repository.dart';
import 'package:uaizu_app/domain/repository/grade_repository.dart';
import 'package:uaizu_app/domain/repository/registration_repository.dart';
import 'package:uaizu_app/domain/repository/syllabus_repository.dart';
import 'package:uaizu_app/use_case/usecase.dart';

part 'campus_square_usecase.freezed.dart';

final getCampusSquareCalenderDayUseCacseProvider = Provider((ref) {
  return GetCampusSquareCalenderDayUseCase(
    ref.watch(calendarRepositoryProvider),
  );
});

final getGradeUseCaseProvider = Provider((ref) {
  return GetGradeUseCase(ref.watch(gradeRepositoryProvider));
});

final getRegistrationUseCaseProvider = Provider((ref) {
  return GetRegistrationUseCase(ref.watch(registrationRepositoryProvider));
});

final getSyllabusUseCaseProvider = Provider((ref) {
  return GetSyllabusUseCase(ref.watch(syllabusRepositoryProvider));
});

@freezed
class GetCampusSquareCalenderDayUseCaseParam
    with _$GetCampusSquareCalenderDayUseCaseParam {
  const factory GetCampusSquareCalenderDayUseCaseParam({
    required DateTime date,
    required bool useCache,
  }) = _GetCampusSquareCalenderDayUseCaseParam;
}

class GetCampusSquareCalenderDayUseCase extends UseCase<
    GetCampusSquareCalenderDayUseCaseParam, Future<CampusSquareCalendarDay>> {
  GetCampusSquareCalenderDayUseCase(this._repository);

  final CalendarRepository _repository;

  @override
  Future<CampusSquareCalendarDay> call(
    GetCampusSquareCalenderDayUseCaseParam param,
  ) async {
    return _repository.fetchCampusSquareCalendarDay(param.date);
  }
}

@freezed
class GetGradeUseCaseParam with _$GetGradeUseCaseParam {
  const factory GetGradeUseCaseParam({
    required GradeQuery query,
    required bool useCache,
  }) = _GetGradeUseCaseParam;
}

class GetGradeUseCase extends UseCase<GetGradeUseCaseParam, Future<Grade>> {
  GetGradeUseCase(this._repository);

  final GradeRepository _repository;

  @override
  Future<Grade> call(GetGradeUseCaseParam param) async {
    final grade = await _repository.fetchGrade(param.query);

    return grade;
  }
}

@freezed
class GetSyllabusUseCaseParam with _$GetSyllabusUseCaseParam {
  const factory GetSyllabusUseCaseParam({
    required SyllabusLectureSearchQuery query,
    required bool useCache,
  }) = _GetSyllabusUseCaseParam;
}

class GetSyllabusUseCase
    extends UseCase<GetSyllabusUseCaseParam, Future<List<SyllabusLecture>>> {
  GetSyllabusUseCase(this._repository);

  final SyllabusRepository _repository;

  @override
  Future<List<SyllabusLecture>> call(GetSyllabusUseCaseParam param) async {
    final lectures = await _repository.fetchLectures(param.query);

    return lectures;
  }
}

@freezed
class GetRegistrationUseCaseParam with _$GetRegistrationUseCaseParam {
  const factory GetRegistrationUseCaseParam({
    required SearchRegistrationQuery query,
    required bool useCache,
  }) = _GetRegistrationUseCaseParam;
}

class GetRegistrationUseCase
    extends UseCase<GetRegistrationUseCaseParam, Future<List<Registration>>> {
  GetRegistrationUseCase(this._repository);

  final RegistrationRepository _repository;

  @override
  Future<List<Registration>> call(GetRegistrationUseCaseParam param) async {
    final registrations = await _repository.fetchRegistration(param.query);

    return registrations;
  }
}
