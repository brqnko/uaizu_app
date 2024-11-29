import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uaizu_app/domain/entity/syllabus.dart';
import 'package:uaizu_app/ui/dialogs/select_year_dialog.dart';
import 'package:uaizu_app/ui/res/fonts.dart';
import 'package:uaizu_app/ui/widgets/app_bar.dart';
import 'package:uaizu_app/ui/widgets/future_body.dart';
import 'package:uaizu_app/ui/widgets/horizontal_expanded_container.dart';
import 'package:uaizu_app/ui/widgets/search_button.dart';
import 'package:uaizu_app/use_case/campus_square_usecase.dart';

class SyllabusPage extends HookConsumerWidget {
  const SyllabusPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final year = useState(DateTime.now().year);
    final displayCount = useState(20);
    final freeWord = useState('');
    final syllabusFutureTrigger = useState(false);

    final syllabusFuture = useMemoized(
      () {
        return ref.watch(getSyllabusUseCaseProvider).call(
              GetSyllabusUseCaseParam(
                query: SyllabusLectureSearchQuery(
                  year: year.value,
                  displayCount: displayCount.value,
                  freeWord: freeWord.value,
                ),
                useCache: false,
              ),
            );
      },
      [syllabusFutureTrigger.value],
    );

    final syllabus = useFuture(syllabusFuture);

    final appBar = brandAppBarWithOptions(
      context,
      [
        ElevatedButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => SelectYearDialog(year: year),
          ),
          child: Text(
            year.value.toString(),
            style: Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ),
        SizedBox(
          width: 200,
          child: TextFormField(
            initialValue: freeWord.value,
            decoration: InputDecoration(
              isDense: true,
              hintText: 'フリーワード',
              hintStyle:
                  Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
              prefixIcon: Icon(
                Icons.search,
                color: colorScheme.onSurfaceVariant,
              ),
              filled: true,
              fillColor: colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) => freeWord.value = value,
          ),
        ),
        SizedBox(
          width: 150,
          child: TextFormField(
            initialValue: displayCount.value.toString(),
            decoration: InputDecoration(
              isDense: true,
              hintText: '表示件数',
              hintStyle:
                  Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
              prefixIcon: Icon(
                Icons.content_copy_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
              filled: true,
              fillColor: colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              TextInputFormatter.withFunction(
                (oldValue, newValue) => newValue.copyWith(
                  text: newValue.text.replaceAll('.', ','),
                ),
              ),
            ],
            onChanged: (value) {
              final formatted = int.tryParse(value);
              if (formatted == null) {
                return;
              }

              displayCount.value = formatted;
            },
          ),
        ),
        SearchButton(
          onPressed: () =>
              syllabusFutureTrigger.value = !syllabusFutureTrigger.value,
        ),
      ],
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: appBar,
      body: futureBody(syllabus, (data) {
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: data.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final registration = data[index];
            return HorizontalExpandedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    registration.name,
                    style: Fonts.titleM.copyWith(color: colorScheme.onSurface),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    runSpacing: 4,
                    spacing: 16,
                    children: [
                      // instructor
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.school_outlined,
                                size: 18,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            TextSpan(
                              text: registration.instructor,
                              style: Fonts.bodyM.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.calendar_view_week_outlined,
                                size: 18,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            TextSpan(
                              text: registration.timeSlot,
                              style: Fonts.bodyM.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.calendar_view_month_outlined,
                                size: 18,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            TextSpan(
                              text: registration.quarter,
                              style: Fonts.bodyM.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.calendar_month_outlined,
                                size: 18,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            TextSpan(
                              text: registration.semester,
                              style: Fonts.bodyM.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.numbers_outlined,
                                size: 18,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            TextSpan(
                              text: registration.code.toString(),
                              style: Fonts.bodyM.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
