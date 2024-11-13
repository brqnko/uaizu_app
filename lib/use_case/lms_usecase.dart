import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uaizu_app/domain/entity/lms_calendar.dart';
import 'package:uaizu_app/domain/provider/calendar_repository_provider.dart';
import 'package:uaizu_app/domain/repository/calendar_repository.dart';
import 'package:uaizu_app/use_case/usecase.dart';

part 'lms_usecase.freezed.dart';

final getLmsTaskDayUseCaseProvider = Provider((ref) {
  return GetLmsTaskDayUseCase(ref.watch(calendarRepositoryProvider));
});

@freezed
class LmsTaskDayUseCaseParam with _$LmsTaskDayUseCaseParam {
  const factory LmsTaskDayUseCaseParam({
    required DateTime date,
  }) = _LmsTaskDayUseCaseParam;
}

class GetLmsTaskDayUseCase
    extends UseCase<LmsTaskDayUseCaseParam, Future<List<LmsTask>>> {
  GetLmsTaskDayUseCase(this._repository);

  final CalendarRepository _repository;

  @override
  Future<List<LmsTask>> call(LmsTaskDayUseCaseParam param) async {
    final tasks = await _repository.fetchLmsTaskDay(param.date);

    return tasks;
  }
}
