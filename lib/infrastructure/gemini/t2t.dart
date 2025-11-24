import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiT2TClient {
  GeminiT2TClient({
    required String apiKey,
    String modelId = 'gemini-3-pro-preview',
  }) : _modelId = modelId, _apiKey = apiKey;
  final String _apiKey;
  final String _modelId;

  Future<String> t2t(String prompt) async {
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/$_modelId:generateContent',
    );

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'x-goog-api-key': _apiKey,
    };

    final bodyData = <String, dynamic>{
      'contents': [
        {
          'parts': [
            {'text': prompt},
          ],
        }
      ],
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(bodyData),
      );
      if (response.statusCode != 200) {
        throw Exception('API error: ${response.statusCode} ${response.body}');
      }

      final jsonResponse = jsonDecode(response.body);
      final String content = jsonResponse['candidates'][0]['content']['parts'][0]['text'];
      return content;
    } catch (e) {
      rethrow;
    }
  }
}
