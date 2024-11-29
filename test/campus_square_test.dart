// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:uaizu_app/domain/entity/grade.dart';
import 'package:uaizu_app/domain/entity/registration.dart';
import 'package:uaizu_app/domain/entity/settings.dart';
import 'package:uaizu_app/domain/entity/syllabus.dart';
import 'package:uaizu_app/infrastructure/client/app_http_client.dart';
import 'package:uaizu_app/infrastructure/client/campus_square_client.dart';
import 'package:uaizu_app/infrastructure/data_source/campus_square_calendar_data_source.dart';
import 'package:uaizu_app/infrastructure/data_source/grade_data_source.dart';
import 'package:uaizu_app/infrastructure/data_source/registration_data_source.dart';
import 'package:uaizu_app/infrastructure/data_source/syllabus_data_source.dart';

void main() {
  final studentId = stdin.readLineSync();
  final password = stdin.readLineSync();

  group('campus square client ja', () {
    final campusSquareClient = CampusSquareClient(
        AppHttpClient(Client()),
        studentId!,
        password!,
        AppLocale.ja,
    );

    test('fetch syllabus', () async {
      final lectures = await SyllabusDataSource(campusSquareClient)
          .fetchSyllabus(
            const SyllabusLectureSearchQuery(
                year: 2024,
                displayCount: 10,
                freeWord: '',
            ),
          );

      lectures.forEach(print);
    });
    
    test('fetch calender', () async {
      final calender = await CampusSquareCalendarDataSource(campusSquareClient)
          .fetchCalendarDay(DateTime.now());

      print(calender);
    });

    test('fetch grade', () async {
      final grade = await GradeDataSource(campusSquareClient)
        .fetchGrade(
          const GradeQuery(
            showAll: false,
            year: 2024,
            quarter: 3,
          ),
        );

      print(grade);
    });

    test('fetch registration', () async {
      final registrations = await RegistrationDataSource(campusSquareClient)
          .fetchRegistrations(
            const SearchRegistrationQuery(
              year: 2024,
              semester: true,
            ),
          );

      registrations.forEach(print);
    });
  });
}
