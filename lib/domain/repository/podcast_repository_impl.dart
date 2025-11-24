import 'dart:typed_data';

import 'package:uaizu_app/domain/entity/campus_square_calendar.dart';
import 'package:uaizu_app/domain/entity/lms_calendar.dart';
import 'package:uaizu_app/domain/entity/podcast.dart';
import 'package:uaizu_app/domain/repository/podcast_repositoty.dart';
import 'package:uaizu_app/infrastructure/gemini/t2t.dart';
import 'package:uaizu_app/infrastructure/gemini/tts.dart';

class PodcastRepositoryImpl implements PodcastRepository {

  const PodcastRepositoryImpl(this._tts, this._t2t);
  final GeminiTtsClient _tts;
  final GeminiT2TClient _t2t;

  @override
  Future<Uint8List> podcast(PodcastInput input) async {
    final isJapanese = input.campusSquareCalendarDay.locale.name == 'ja';

    final prompt = _buildPrompt(input, isJapanese);

    final script = await _t2t.t2t(prompt);

    final audio = await _tts.tts(GeminiTtsInput(
      text: script,
      speakers: {
        'Speaker 1': SpeakerModel.aoede,  // Breezy, Middle pitch
        'Speaker 2': SpeakerModel.puck,   // Upbeat, Middle pitch
      },
    ),);

    return audio;
  }

  String _buildPrompt(PodcastInput input, bool isJapanese) {
    final day = input.campusSquareCalendarDay;
    final tasks = input.lmsTasks;

    if (isJapanese) {
      return _buildJapanesePrompt(day, tasks);
    } else {
      return _buildEnglishPrompt(day, tasks);
    }
  }

  String _buildJapanesePrompt(
    CampusSquareCalendarDay day,
    List<LmsTask> tasks,
  ) {
    final buffer = StringBuffer();

    final dateStr = '${day.day.year}年${day.day.month}月${day.day.day}日';

    buffer..writeln('あなたは朝の情報番組のキャスターです。以下の情報を、2人の明るく親しみやすいキャスター（Speaker 1とSpeaker 2）の対話形式で伝えてください。')
    ..writeln()
    ..writeln('# 日付')
    ..writeln(dateStr)
    ..writeln();

    if (day.notes.isNotEmpty) {
      buffer.writeln('# 重要なお知らせ');
      for (final note in day.notes) {
        buffer.writeln('- $note');
      }
      buffer.writeln();
    }

    if (day.lectures.isNotEmpty) {
      buffer.writeln('# 本日の講義');
      for (final lecture in day.lectures) {
        final startTime = '${lecture.startTime.hour}:${lecture.startTime.minute.toString().padLeft(2, '0')}';
        final endTime = '${lecture.endTime.hour}:${lecture.endTime.minute.toString().padLeft(2, '0')}';
        final typeStr = switch (lecture.type) {
          CampusSquareCalendarLectureType.kaiko => '開講',
          CampusSquareCalendarLectureType.kyuko => '【休講】',
          CampusSquareCalendarLectureType.hoko => '【補講】',
        };
        buffer.writeln('- $typeStr ${lecture.courseName} ($startTime-$endTime, ${lecture.location})');
      }
      buffer.writeln();
    }

    if (tasks.isNotEmpty) {
      buffer.writeln('# 課題の期限');
      for (final task in tasks) {
        final deadline = '${task.date.month}月${task.date.day}日 ${task.date.hour}:${task.date.minute.toString().padLeft(2, '0')}';
        buffer.writeln('- ${task.title} (期限: $deadline)');
      }
      buffer.writeln();
    }

    buffer..writeln('# 指示')
    ..writeln('上記の情報を、朝の情報番組風に2人のキャスターが会話しながら伝えてください。')
    ..writeln('- 休講や補講は特に強調してください')
    ..writeln('- 課題の期限が近いものは注意を促してください')
    ..writeln('- 明るく元気なトーンで、学生を励ますような雰囲気で')
    ..writeln('- 出力形式: "Speaker 1: ..." と "Speaker 2: ..." の対話形式');

    return buffer.toString();
  }

  String _buildEnglishPrompt(
    CampusSquareCalendarDay day,
    List<LmsTask> tasks,
  ) {
    final buffer = StringBuffer();

    final dateStr = '${day.day.year}-${day.day.month.toString().padLeft(2, '0')}-${day.day.day.toString().padLeft(2, '0')}';

    buffer..writeln('You are hosts of a morning information program. Please deliver the following information in a dialogue format between two bright and friendly hosts (Speaker 1 and Speaker 2).')
    ..writeln()
    ..writeln('# Date')
    ..writeln(dateStr)
    ..writeln();

    if (day.notes.isNotEmpty) {
      buffer.writeln('# Important Announcements');
      for (final note in day.notes) {
        buffer.writeln('- $note');
      }
      buffer.writeln();
    }

    if (day.lectures.isNotEmpty) {
      buffer.writeln('# Today\'s Lectures');
      for (final lecture in day.lectures) {
        final startTime = '${lecture.startTime.hour}:${lecture.startTime.minute.toString().padLeft(2, '0')}';
        final endTime = '${lecture.endTime.hour}:${lecture.endTime.minute.toString().padLeft(2, '0')}';
        final typeStr = switch (lecture.type) {
          CampusSquareCalendarLectureType.kaiko => '',
          CampusSquareCalendarLectureType.kyuko => '[CANCELLED] ',
          CampusSquareCalendarLectureType.hoko => '[MAKEUP CLASS] ',
        };
        buffer.writeln('- $typeStr${lecture.courseName} ($startTime-$endTime, ${lecture.location})');
      }
      buffer.writeln();
    }

    if (tasks.isNotEmpty) {
      buffer.writeln('# Assignment Deadlines');
      for (final task in tasks) {
        final deadline = '${task.date.month}/${task.date.day} ${task.date.hour}:${task.date.minute.toString().padLeft(2, '0')}';
        buffer.writeln('- ${task.title} (Due: $deadline)');
      }
      buffer.writeln();
    }

    buffer..writeln('# Instructions')
    ..writeln('Deliver the above information as two hosts conversing in a morning show style.')
    ..writeln('- Emphasize cancelled classes and makeup classes')
    ..writeln('- Alert students about approaching deadlines')
    ..writeln('- Use a bright and energetic tone to encourage students')
    ..writeln('- Output format: Dialogue in "Speaker 1: ..." and "Speaker 2: ..." format');

    return buffer.toString();
  }
}
