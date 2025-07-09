import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uaizu_app/domain/entity/grade.dart';
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/dialogs/select_year_dialog.dart';
import 'package:uaizu_app/ui/pages/campus_square/widgets/lecture_grade_card.dart';
import 'package:uaizu_app/ui/pages/campus_square/widgets/toeic_score_card.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';
import 'package:uaizu_app/ui/widgets/dropdown_button.dart';
import 'package:uaizu_app/ui/widgets/future_body.dart';
import 'package:uaizu_app/ui/widgets/horizontal_expanded_container.dart';
import 'package:uaizu_app/ui/widgets/key_value_container.dart';
import 'package:uaizu_app/ui/widgets/search_button.dart';
import 'package:uaizu_app/ui/widgets/tagged_widget.dart';
import 'package:uaizu_app/use_case/campus_square_usecase.dart';

class GradeAndExamPage extends HookConsumerWidget {
  const GradeAndExamPage({super.key});

  Widget _buildStudentInformation(
    Grade grade,
    WidgetRef ref,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    return TaggedWidget(
      tag: l10n.studentInformation,
      child: Wrap(
        runSpacing: 16,
        spacing: 16,
        children: [
          KeyValueContainer(
            keyString: l10n.name,
            valueString: getAnonymousableValue(grade.studentName, ref),
            keyIcon: Icons.school_outlined,
          ),
          KeyValueContainer(
            keyString: l10n.studentId,
            valueString: getAnonymousableValue(grade.studentId, ref),
            keyIcon: Icons.numbers_outlined,
          ),
          KeyValueContainer(
            keyString: l10n.department,
            valueString: grade.department,
            keyIcon: Icons.science_outlined,
          ),
          KeyValueContainer(
            keyString: l10n.year,
            valueString: grade.year,
            keyIcon: Icons.calendar_month_outlined,
          ),
          KeyValueContainer(
            keyString: l10n.semester,
            valueString: grade.semester,
            keyIcon: Icons.history_edu_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildToeicScore(
      Grade grade, ColorScheme colorScheme, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TaggedWidget(
          tag: l10n.toeicBestScore,
          child: HorizontalExpandedContainer(
            child: ToeicScoreText(score: grade.bestToeicScore),
          ),
        ),
        const SizedBox(height: 8),
        TaggedWidget(
          tag: l10n.toeicHistory,
          child: HorizontalExpandedContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: grade.toeicScores
                  .map((score) => ToeicScoreText(score: score))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    final showAll = useState(false);
    final year = useState(DateTime.now().year);
    final quarter = useState(0);
    final gradeFutureTrigger = useState(false);

    final gradeFuture = useMemoized(
      () {
        return ref.read(getGradeUseCaseProvider).call(
              GetGradeUseCaseParam(
                query: GradeQuery(
                  showAll: showAll.value,
                  year: year.value,
                  quarter: quarter.value + 1,
                ),
                useCache: false,
              ),
            );
      },
      [gradeFutureTrigger.value],
    );

    final grade = useFuture(gradeFuture);

    final appBar = brandAppBarWithOptions(
      context,
      [
        ElevatedButton(
          onPressed: () => showDialog<void>(
            context: context,
            builder: (BuildContext context) => SelectYearDialog(year: year),
          ),
          child: Text(
            year.value.toString(),
            style: Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: BrandDropdownButton(
            index: quarter,
            values: [
              l10n.quarter1,
              l10n.quarter2,
              l10n.quarter3,
              l10n.quarter4
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => showAll.value = !showAll.value,
          child: Text(
            showAll.value ? l10n.showAll : l10n.showPartial,
            style: Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ),
        SearchButton(
          onPressed: () => gradeFutureTrigger.value = !gradeFutureTrigger.value,
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: colorScheme.surface,
      body: futureBody(
        grade,
        (data) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            separatorBuilder: (_, index) {
              if (index == 2) {
                return const SizedBox();
              } else {
                return const SizedBox(height: 16);
              }
            },
            itemCount: 3 + data.subjectGrades.length,
            itemBuilder: (_, index) {
              return switch (index) {
                0 => _buildStudentInformation(data, ref, colorScheme, l10n),
                1 => _buildToeicScore(data, colorScheme, l10n),
                2 => TaggedWidget(tag: l10n.grades),
                _ => LectureGradeCard(grade: data.subjectGrades[index - 3]),
              };
            },
          );
        },
        l10n,
      ),
    );
  }
}
