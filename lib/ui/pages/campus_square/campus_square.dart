import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/state/home_index.dart';
import 'package:uaizu_app/state/settings.dart';
import 'package:uaizu_app/ui/pages/campus_square/grade_and_exam.dart';
import 'package:uaizu_app/ui/pages/campus_square/registration.dart';
import 'package:uaizu_app/ui/pages/campus_square/schedule.dart';
import 'package:uaizu_app/ui/pages/campus_square/syllabus.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

const _pages = [
  RegistrationPage(),
  GradeAndExamPage(),
  SchedulePage(),
  SyllabusPage(),
];

final _indexProvider = StateProvider((ref) => 2);

class CampusSquarePage extends ConsumerWidget {
  const CampusSquarePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final appBar = AppBar(
      toolbarHeight: 75,
      backgroundColor: colorScheme.primary,
      iconTheme: IconThemeData(color: colorScheme.onPrimaryFixed),
      title: Center(
        child: Text(
          'Campus Square',
          style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
        ),
      ),
    );

    final drawer = Drawer(
      backgroundColor: colorScheme.primary,
      child: ListView(
        children: [
          SizedBox(
            height: 70,
            child: DrawerHeader(
              child: TextButton(
                onPressed: () {
                  ref.read(homeIndexProvider.notifier).state = 4;
                },
                child: Text(
                  ref.watch(settingsProvider
                          .select((settings) => settings.hideStudentId))
                      ? 'anonymous'
                      : ref.watch(settingsProvider.select(
                          (settings) => settings.accountInfo.studentId)),
                  style:
                      Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'スケジュール',
              style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
            ),
            onTap: () {
              ref.read(_indexProvider.notifier).state = 2;
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              '履修',
              style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
            ),
            onTap: () {
              ref.read(_indexProvider.notifier).state = 0;
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              '成績',
              style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
            ),
            onTap: () {
              ref.read(_indexProvider.notifier).state = 1;
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'シラバス',
              style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
            ),
            onTap: () {
              ref.read(_indexProvider.notifier).state = 3;
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: _pages[ref.watch(_indexProvider)],
    );
  }
}
