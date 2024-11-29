import 'package:http/http.dart';

/// A custom HTTP client for the the API.
class AppHttpClient extends BaseClient {
  AppHttpClient(this._client);

  final Client _client;

  /// Default headers for the HTTP client.
  final Map<String, String> _defaultHeaders = {
    'User-Agent':
        'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0',
    'Accept': '*/*',
    'Accept-Language': 'en-US,en;q=0.5',
    'Accept-Encoding': 'gzip, deflate, br, zstd',
    'X-Requested-With': 'XMLHttpRequest',
    'Content-Length': '0',
    'Connection': 'keep-alive',
  };

  /// Cookies received from the server.
  /// This is used to send cookies back to the server in subsequent requests.
  final Map<String, String> _cookies = {};

  Map<String, String> get coookies => _cookies;

  DateTime _lastRequestTime = DateTime.now();

  /// Parse the cookies from the `Set-Cookie` header.
  /// This is used to store the cookies in the [_cookies] map.
  void parseCookies(StreamedResponse response) {
    final cookieHeader = response.headers['set-cookie'];
    if (cookieHeader == null) {
      return;
    }

    final cookies = cookieHeader.split(';');

    for (final cookie in cookies) {
      final parts = cookie.split('=');
      if (parts.length == 2) {
        _cookies[parts[0].trim()] = parts[1].trim();
      }
    }
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    const rateLimitMillis = 500;

    // Add default headers to the request.
    request.headers.addAll(_defaultHeaders);

    // Add cookies to the request.
    request.headers['Cookie'] = _cookies.entries
        .map((entry) => '${entry.key}=${entry.value}')
        .join('; ');

    final now = DateTime.now();
    final timeSinceLastRequest = now.difference(_lastRequestTime);

    if (timeSinceLastRequest.inMilliseconds < rateLimitMillis) {
      await Future.delayed(
        Duration(
          milliseconds: rateLimitMillis - timeSinceLastRequest.inMilliseconds,
        ),
      );
    }

    _lastRequestTime = DateTime.now();

    return _client.send(request).then((response) {
      parseCookies(response);

      return response;
    });
  }

  @override
  void close() {
    _client.close();
    super.close();
  }
}
