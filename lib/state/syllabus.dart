import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/syllabus.dart';
import 'package:uaizu_app/usecase/campus_square_usecase.dart';

final syllabusSearchYearProvider = StateProvider((ref) => DateTime.now().year);

final syllabusSearchDisplayCountProvider = StateProvider((ref) => 20);

final syllabusSearchFreeWordProvider = StateProvider((ref) => '');

final syllabusSearchResultProvider =
    AsyncNotifierProvider<SyllabusSearchResultNotifier, List<SyllabusLecture>>(
        () {
  return SyllabusSearchResultNotifier();
});

class SyllabusSearchResultNotifier
    extends AsyncNotifier<List<SyllabusLecture>> {
  @override
  FutureOr<List<SyllabusLecture>> build() {
    return [];
  }

  Future<void> requestUpdate() {
    return update((prev) async {
      final year = ref.watch(syllabusSearchYearProvider);
      final displayCount = ref.watch(syllabusSearchDisplayCountProvider);
      final freeWord = ref.watch(syllabusSearchFreeWordProvider);

      final result = ref.watch(getSyllabusUseCaseProvider).call(
            GetSyllabusUseCaseParam(
              query: SyllabusLectureSearchQuery(
                year: year,
                displayCount: displayCount,
                freeWord: freeWord,
              ),
              useCache: false,
            ),
          );

      return result;
    });
  }
}
