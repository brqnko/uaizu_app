import 'package:html/parser.dart';
import 'package:uaizu_app/domain/entity/lms_calendar.dart';
import 'package:uaizu_app/infrastructure/client/lms_client.dart';

class LmsCalendarDataSource {
  LmsCalendarDataSource(this._client);

  final LmsClient _client;

  Future<List<LmsTask>> fetchLmsTaskDay(DateTime date) async {
    await _client.requireLoginToken();

    final res = await _client.get(
      Uri.parse(
          'https://elms.u-aizu.ac.jp/calendar/view.php?view=day&time=${_flatToDay(date).toUtc().millisecondsSinceEpoch / 1000}'),
    );

    return parseLmsTaskFromBody(res.body, date);
  }

  DateTime _flatToDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  List<LmsTask> parseLmsTaskFromBody(String htmlContent, DateTime date) {
    return parse(htmlContent)
        .querySelectorAll('div[data-type="event"]')
        .where((eventDiv) => eventDiv.attributes['data-event-title'] != null)
        .map(
          (eventDiv) => LmsTask(
            date: date,
            title: eventDiv.attributes['data-event-title']!,
            courseLink: eventDiv
                .querySelector('a[href*="course/view.php"]')
                ?.attributes['href'],
            activityLink:
                eventDiv.querySelector('a.card-link')?.attributes['href'],
          ),
        )
        .toList();
  }
}
