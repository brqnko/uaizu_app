import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:uaizu_app/domain/entity/grade.dart';
import 'package:uaizu_app/infrastructure/client/campus_square_client.dart';

final _dateFormat = DateFormat('yyyy/MM/dd');

class GradeDataSource {
  GradeDataSource(this._client);

  final CampusSquareClient _client;

  Future<Grade> fetchGrade(GradeQuery query) async {
    await _client.requireRwfHash();

    final flowExecutionKeyRes = await _client.get(
      {
        '_flowId': 'SIW0001200-flow',
      },
      square: true,
    );
    final flowExecutionKey = parseExecutionKeyFromDocument(
      parse(flowExecutionKeyRes.body),
    );
    if (flowExecutionKey == null) {
      throw Exception('failed to fetch flowExecutionKey');
    }

    final res = await _client.get(
      {
        '_flowExecutionKey': flowExecutionKey,
        '_eventId': 'display',
        'spanType': query.showAll ? '0' : '1',
        'nendo': query.year == null
            ? DateTime.now().year.toString()
            : query.year.toString(),
        'gakkiKbnCd':
            query.quarter == null ? '4' : (query.quarter! + 2).toString(),
      },
      square: true,
    );
    if (res.statusCode != 200) {
      throw Exception('status code != 200');
    }

    return parseGradeFromBody(res.body);
  }

  Grade parseGradeFromBody(String body) {
    final document = parse(body);

    final toeicScores = document
        .getElementsByTagName('table')
        .expand((table) => table.getElementsByTagName('tr').skip(1))
        .map((cell) => cell.getElementsByTagName('td'))
        .where((cell) => cell.length == 5)
        .map(
          (cells) => ToeicScore(
            date: _dateFormat.parse(cells[0].text.trim()),
            type: cells[1].text.trim(),
            score: int.parse(cells[2].text.trim()),
            reqdingScore: int.parse(cells[3].text.trim()),
            listeningScore: int.parse(cells[4].text.trim()),
          ),
        )
        .toList();

    final subjectGrades = document
        .getElementsByTagName('table')
        .expand((table) => table.getElementsByTagName('tr'))
        .skip(1)
        .map((row) => row.getElementsByTagName('td'))
        .where((cell) => cell.length == 9)
        .map(
          (cell) => SubjectGrade(
            year: int.parse(cell[1].text.trim()),
            semester: cell[2].text.trim(),
            code: cell[3].text.trim(),
            subjectTitle: cell[4].text.trim(),
            teacher: cell[5].text.trim(),
            score: cell[6].text.trim(),
            grade: cell[7].text.trim(),
            result: cell[8].text.trim(),
            locale: _client.locale,
          ),
        )
        .toList();

    final seiseki = document.querySelectorAll('tr.seiseki');

    return Grade(
      studentId: seiseki[0].children[3].text.trim(),
      studentName: seiseki[0].children[1].text.trim(),
      department: seiseki[1].children[1].text.trim(),
      year: seiseki[1].children[3].text.trim(),
      semester: seiseki[2].children[1].text.trim(),
      bestToeicScore: toeicScores.firstOrNull,
      toeicScores: toeicScores.isEmpty
          ? toeicScores
          : toeicScores.getRange(1, toeicScores.length).toList(),
      subjectGrades: subjectGrades,
      locale: _client.locale,
    );
  }
}
