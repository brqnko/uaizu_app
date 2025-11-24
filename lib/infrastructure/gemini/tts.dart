import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

enum SpeakerModel {
  zephyr(displayName: 'Zephyr', description: 'Bright, Higher pitch'),
  puck(displayName: 'Puck', description: 'Upbeat, Middle pitch'),
  charon(displayName: 'Charon', description: 'Informative, Lower pitch'),
  kore(displayName: 'Kore', description: 'Firm, Middle pitch'),
  fenrir(displayName: 'Fenrir', description: 'Excitable, Lower middle pitch'),
  leda(displayName: 'Leda', description: 'Youthful, Higher pitch'),
  orus(displayName: 'Orus', description: 'Firm, Lower middle pitch'),
  aoede(displayName: 'Aoede', description: 'Breezy, Middle pitch'),
  callirrhoe(displayName: 'Callirrhoe', description: 'Easy-going, Middle pitch'),
  autonoe(displayName: 'Autonoe', description: 'Bright, Middle pitch'),
  enceladus(displayName: 'Enceladus', description: 'Breathy, Lower pitch'),
  iapetus(displayName: 'Iapetus', description: 'Clear, Lower middle pitch'),
  umbriel(displayName: 'Umbriel', description: 'Easy-going, Lower middle pitch'),
  algieba(displayName: 'Algieba', description: 'Smooth, Lower pitch'),
  despina(displayName: 'Despina', description: 'Smooth, Middle pitch'),
  erinome(displayName: 'Erinome', description: 'Clear, Middle pitch'),
  algenib(displayName: 'Algenib', description: 'Gravelly, Lower pitch'),
  rasalgethi(displayName: 'Rasalgethi', description: 'Informative, Middle pitch'),
  laomedeia(displayName: 'Laomedeia', description: 'Upbeat, Higher pitch'),
  achernar(displayName: 'Achernar', description: 'Soft, Higher pitch'),
  alnilam(displayName: 'Alnilam', description: 'Firm, Lower middle pitch'),
  schedar(displayName: 'Schedar', description: 'Even, Lower middle pitch'),
  gacrux(displayName: 'Gacrux', description: 'Mature, Middle pitch'),
  pulcherrima(displayName: 'Pulcherrima', description: 'Forward, Middle pitch'),
  achird(displayName: 'Achird', description: 'Friendly, Lower middle pitch'),
  zubenelgenubi(displayName: 'Zubenelgenubi', description: 'Casual, Lower middle pitch'),
  vindemiatrix(displayName: 'Vindemiatrix', description: 'Gentle, Middle pitch'),
  sadachbia(displayName: 'Sadachbia', description: 'Lively, Lower pitch'),
  sadaltager(displayName: 'Sadaltager', description: 'Knowledgeable, Middle pitch'),
  sulafat(displayName: 'Sulafat', description: 'Warm, Middle pitch');

  const SpeakerModel({
    required this.displayName,
    required this.description,
  });

  final String displayName;
  final String description;
}

class GeminiTtsInput {
  GeminiTtsInput({required this.text, required this.speakers, this.modelId, this.temperature});

  final String text; // ex: Read aloud in a warm, welcoming tone\nSpeaker 1: Hello! We're excited to show you our native speech capabilities\nSpeaker 2: Where you can direct a voice, create realistic dialog, and so much more. Edit these placeholders to get started.
  final String? modelId;
  final double? temperature; // Creativity allowed in the responses
  final Map<String, SpeakerModel> speakers; // Voice used to generate audio output, key is speaker name in the text
}

class GeminiTtsClient {
  GeminiTtsClient(this._apiKey);

  final String _apiKey;
  final http.Client _client = http.Client();

  Future<Uint8List> tts(GeminiTtsInput input) async {
    // リクエストを送信
    final uri = Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/${input.modelId ?? "gemini-2.5-flash-preview-tts"}:streamGenerateContent?key=$_apiKey');
    final requestBody = {
      'contents': [
        {
          'role': 'user',
          'parts': [
            {
              'text': input.text,
            }
          ],
        }
      ],
      'generationConfig': {
        'responseModalities': ['audio'],
        'temperature': input.temperature ?? 1,
        'speech_config': {
          'multi_speaker_voice_config': {
            'speaker_voice_configs': input.speakers.entries.map((entry) {
              return {
                'speaker': entry.key,
                'voice_config': {
                  'prebuilt_voice_config': {
                    'voice_name': entry.value.displayName,
                  },
                },
              };
            }).toList(),
          },
        },
      },
    };
    final response = await _client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );
    if (response.statusCode != 200) {
      throw Exception('Error: ${response.statusCode}\n${response.body}');
    }

    // レスポンスの解析
    final List<dynamic> jsonResponse = jsonDecode(response.body);
    final pcmData = <int>[];
    for (final item in jsonResponse) {
      final candidates = item['candidates'] as List<dynamic>?;
      if (candidates != null && candidates.isNotEmpty) {
        final parts = candidates[0]['content']['parts'] as List<dynamic>;
        for (final part in parts) {
          if (part.containsKey('inlineData')) {
            final inlineData = part['inlineData'];
            final base64Data = inlineData['data'];
            pcmData.addAll(base64Decode(base64Data));
          }
        }
      }
    }
    if (pcmData.isEmpty) {
      throw Exception('No audio data received from Gemini TTS API.');
    }

    const channels = 1;
    const sampleRate = 24000;
    const byteRate = sampleRate * channels * 2;
    final dataSize = pcmData.length;
    final totalSize = 36 + dataSize;

    // WAVヘッダーの構築 (44 bytes)
    final header = ByteData(44);
    // RIFF chunk
    _writeString(header, 0, 'RIFF');
    header.setUint32(4, totalSize, Endian.little);
    _writeString(header, 8, 'WAVE');

    // fmt chunk
    _writeString(header, 12, 'fmt ');
    header..setUint32(16, 16, Endian.little) // Subchunk1Size (16 for PCM)
      ..setUint16(20, 1, Endian.little)  // AudioFormat (1 for PCM)
      ..setUint16(22, channels, Endian.little)
      ..setUint32(24, sampleRate, Endian.little)
      ..setUint32(28, byteRate, Endian.little)
      ..setUint16(32, channels * 2, Endian.little) // BlockAlign
      ..setUint16(34, 16, Endian.little); // BitsPerSample (16bit)
    // data chunk
    _writeString(header, 36, 'data');
    header.setUint32(40, dataSize, Endian.little);

    return Uint8List.fromList([
      ...header.buffer.asUint8List(),
      ...pcmData,
    ]);
  }
}

void _writeString(ByteData data, int offset, String value) {
  for (var i = 0; i < value.length; i++) {
    data.setUint8(offset + i, value.codeUnitAt(i));
  }
}
