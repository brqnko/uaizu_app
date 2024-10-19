import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/grade.dart';
import 'package:uaizu_app/state/grade.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class GradeAndExamPage extends ConsumerWidget {
  const GradeAndExamPage({super.key});

  Widget _buildStudentInformation(
    Grade grade,
    WidgetRef ref,
    ColorScheme colorScheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          'Student Information',
          textAlign: TextAlign.start,
          style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
        ),
        const SizedBox(height: 8),
        Wrap(
          runSpacing: 16,
          spacing: 16,
          children: [
            _buildRichTextKeyValue(
              '名前',
              Icons.school_outlined,
              ref.watch(settingsProvider
                      .select((settings) => settings.hideStudentId))
                  ? 'anonymous'
                  : grade.studentName,
              colorScheme,
            ),
            _buildRichTextKeyValue(
              '学籍番号',
              Icons.numbers_outlined,
              ref.watch(settingsProvider
                      .select((settings) => settings.hideStudentId))
                  ? 'anonymous'
                  : grade.studentId,
              colorScheme,
            ),
            _buildRichTextKeyValue(
              '学科',
              Icons.science_outlined,
              grade.department,
              colorScheme,
            ),
            _buildRichTextKeyValue(
              '学年',
              Icons.calendar_month_outlined,
              grade.year,
              colorScheme,
            ),
            _buildRichTextKeyValue(
              '学期',
              Icons.history_edu_outlined,
              grade.semester,
              colorScheme,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRichTextKeyValue(
    String key,
    IconData keyIcon,
    String value,
    ColorScheme colorScheme,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    keyIcon,
                    size: 36,
                    color: colorScheme.onSurface,
                  ),
                ),
                const WidgetSpan(
                  child: SizedBox(width: 10),
                ),
                TextSpan(
                  text: key,
                  style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _buildToeicScoreCard(ToeicScore score, ColorScheme colorScheme) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: score.date.toLocal().toString().split(' ')[0],
            style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          // total
          const WidgetSpan(
            child: SizedBox(width: 16),
          ),
          WidgetSpan(
            child: Icon(
              Icons.score_outlined,
              size: 22,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          TextSpan(
            text: score.score.toString(),
            style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          // reading
          const WidgetSpan(
            child: SizedBox(width: 16),
          ),
          WidgetSpan(
            child: Icon(
              Icons.book_outlined,
              size: 22,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          TextSpan(
            text: score.reqdingScore.toString(),
            style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          const WidgetSpan(
            child: SizedBox(width: 16),
          ),
          // listening
          WidgetSpan(
            child: Icon(
              Icons.headphones_outlined,
              size: 22,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          TextSpan(
            text: score.listeningScore.toString(),
            style: Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _buildToeicScore(Grade grade, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          'TOEIC最高点',
          textAlign: TextAlign.start,
          style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
        ),
        grade.bestToeicScore == null
            ? const Text('no best toeic score')
            : Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: _buildToeicScoreCard(grade.bestToeicScore!, colorScheme),
              ),
        const SizedBox(height: 16),
        Text(
          'TOEIC履歴',
          textAlign: TextAlign.start,
          style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: grade.toeicScores
                .map((score) => _buildToeicScoreCard(score, colorScheme))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectGradeCard(SubjectGrade grade, ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            grade.subjectTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              children: [
                // score
                WidgetSpan(
                  child: Icon(
                    Icons.score_outlined,
                    size: 22,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                TextSpan(
                  text: grade.score,
                  style:
                      Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const WidgetSpan(
                  child: SizedBox(width: 16),
                ),
                // grade
                WidgetSpan(
                  child: Icon(
                    Icons.grade_outlined,
                    size: 22,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                TextSpan(
                  text: grade.grade,
                  style:
                      Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const WidgetSpan(
                  child: SizedBox(width: 16),
                ),
                // result
                WidgetSpan(
                  child: Icon(
                    Icons.gavel_outlined,
                    size: 22,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                TextSpan(
                  text: grade.result,
                  style:
                      Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const WidgetSpan(
                  child: SizedBox(width: 16),
                ),
                //
                WidgetSpan(
                  child: Icon(
                    Icons.numbers_outlined,
                    size: 22,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                TextSpan(
                  text: grade.code,
                  style:
                      Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const WidgetSpan(
                  child: SizedBox(width: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradeListView(
      Grade grade, ColorScheme colorScheme, WidgetRef ref) {
    return ListView.builder(
      itemCount: 3 + grade.subjectGrades.length,
      itemBuilder: (_, index) {
        switch (index) {
          case 0:
            return _buildStudentInformation(grade, ref, colorScheme);
          case 1:
            return _buildToeicScore(grade, colorScheme);
          case 2:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  '成績',
                  textAlign: TextAlign.start,
                  style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
                ),
              ],
            );
        }
        return Column(
          children: [
            _buildSubjectGradeCard(grade.subjectGrades[index - 3], colorScheme),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quarters = [
      '1学期',
      '2学期',
      '3学期',
      '4学期',
    ];

    final colorScheme = Theme.of(context).colorScheme;

    final appBar = AppBar(
      toolbarHeight: 55,
      backgroundColor: colorScheme.onPrimaryContainer,
      iconTheme: IconThemeData(color: colorScheme.secondary),
      title: SizedBox(
        height: 34,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Select Year'),
                      content: SizedBox(
                        width: 300,
                        height: 300,
                        child: YearPicker(
                          firstDate: DateTime.utc(1993, 4),
                          lastDate: DateTime.utc(2030, 3, 31),
                          selectedDate: DateTime(ref.watch(gradeYearProvider)),
                          onChanged: (DateTime date) {
                            ref.read(gradeYearProvider.notifier).state =
                                date.year;
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                ref.watch(gradeYearProvider).toString(),
                style:
                    Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {},
              child: DropdownButton(
                value: quarters[ref.watch(gradeQuarterProvider)],
                onChanged: (String? value) {
                  if (value == null) {
                    return;
                  }

                  ref.read(gradeQuarterProvider.notifier).state =
                      quarters.indexOf(value);
                },
                items: quarters.map((q) {
                  return DropdownMenuItem(
                    value: q,
                    child: Text(
                      q,
                      style: Fonts.bodyS
                          .copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(gradeShowAllProvider.notifier).state =
                    !ref.read(gradeShowAllProvider);
              },
              child: Text(
                ref.watch(gradeShowAllProvider) ? 'すべて表示' : '一部表示',
                style:
                    Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(gradeProvider.notifier).requestUpdate();
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.search,
                        size: 18,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    TextSpan(
                      text: '検索',
                      style: Fonts.bodyS
                          .copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ref.watch(gradeProvider).when(
              data: (data) {
                if (data == null) {
                  return const Text('no search result');
                } else {
                  return _buildGradeListView(data, colorScheme, ref);
                }
              },
              error: (err, stack) => Text(stack.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
      ),
    );
  }
}
