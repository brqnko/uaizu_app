import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/syllabus.dart';
import 'package:uaizu_app/state/syllabus.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class SyllabusPage extends ConsumerWidget {
  const SyllabusPage({super.key});

  Widget _buildSyllabusListView(
      List<SyllabusLecture> data, ColorScheme colorScheme) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final registration = data[index];
        return Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Container(
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
                            style: Fonts.bodyM
                                .copyWith(color: colorScheme.onSurfaceVariant),
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
                            style: Fonts.bodyM
                                .copyWith(color: colorScheme.onSurfaceVariant),
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
                            style: Fonts.bodyM
                                .copyWith(color: colorScheme.onSurfaceVariant),
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
                            style: Fonts.bodyM
                                .copyWith(color: colorScheme.onSurfaceVariant),
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
                            style: Fonts.bodyM
                                .copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                          selectedDate:
                              DateTime(ref.watch(syllabusSearchYearProvider)),
                          onChanged: (DateTime dateTime) {
                            ref
                                .read(syllabusSearchYearProvider.notifier)
                                .state = dateTime.year;
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                ref.watch(syllabusSearchYearProvider).toString(),
                style:
                    Fonts.bodyS.copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 200,
              child: TextFormField(
                initialValue: ref.watch(syllabusSearchFreeWordProvider),
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
                onChanged: (value) {
                  ref.read(syllabusSearchFreeWordProvider.notifier).state =
                      value;
                },
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 150,
              child: TextFormField(
                initialValue:
                    ref.watch(syllabusSearchDisplayCountProvider).toString(),
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
                keyboardType: const TextInputType.numberWithOptions(),
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

                  ref.read(syllabusSearchDisplayCountProvider.notifier).state =
                      formatted;
                },
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(syllabusSearchResultProvider.notifier).requestUpdate();
              },
              child: Text(
                '検索',
                style:
                    Fonts.bodyM.copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ref.watch(syllabusSearchResultProvider).when(
          data: (data) {
            if (data.isEmpty) {
              return const Text('no search result');
            } else {
              return _buildSyllabusListView(data, colorScheme);
            }
          },
          loading: () {
            return const CircularProgressIndicator();
          },
          error: (err, stack) {
            return Text(stack.toString());
          },
        ),
      ),
    );
  }
}
