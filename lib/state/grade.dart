import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/grade.dart';
import 'package:uaizu_app/usecase/campus_square_usecase.dart';

final gradeShowAllProvider = StateProvider((ref) => false);

final gradeYearProvider = StateProvider((ref) => DateTime.now().year);

final gradeQuarterProvider = StateProvider((ref) => 0);

final gradeProvider = AsyncNotifierProvider<GradeNotifier, Grade?>(() {
  return GradeNotifier();
});

class GradeNotifier extends AsyncNotifier<Grade?> {
  @override
  FutureOr<Grade?> build() async {
    return null;
  }

  Future<void> requestUpdate() {
    return update((prev) async {
      final grade = await ref.watch(getGradeUseCaseProvider).call(
            GetGradeUseCaseParam(
              query: GradeQuery(
                showAll: ref.watch(gradeShowAllProvider),
                year: ref.watch(gradeYearProvider),
                quarter: ref.watch(gradeQuarterProvider) + 1,
              ),
              useCache: false,
            ),
          );

      return grade;
    });
  }
}
