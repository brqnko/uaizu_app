import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:uaizu_app/domain/entity/settings.dart';
import 'package:uaizu_app/infrastructure/client/app_http_client.dart';
import 'package:uaizu_app/infrastructure/client/lms_client.dart';
import 'package:uaizu_app/infrastructure/data_source/lms_calendar_data_source.dart';

void main() {
  final studentId = stdin.readLineSync();
  final password = stdin.readLineSync();

  group('lms ja', () {
    final lmsClient = LmsClient(AppHttpClient(Client()), AppLocale.ja, studentId!, password!);

    test('fetch calender day', () async {
      final tasks = await LmsCalendarDataSource(lmsClient).fetchLmsTaskDay(
        DateTime.now(),
      );

      tasks.forEach(print);
    });
  });
}
