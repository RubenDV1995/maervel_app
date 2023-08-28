import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../../../utils/either/either.dart';
import '../../../utils/enums/failures.dart';

part 'parse_response_body.dart';

enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete,
}

class Http {
  final String _baseUrl;
  final String _hash;
  final String _ts;
  final String _apiKey;
  final Client _client;

  Http({
    required String baseUrl,
    required String apiKey,
    required Client client,
    required String hash,
    required String ts,
  })  : _client = client,
        _apiKey = apiKey,
        _baseUrl = baseUrl,
        _hash = hash,
        _ts = ts;

  Future<Either<FailuresEnum, R>> request<R>(
    String path, {
    Map<String, String> headers = const {},
    required R Function(Map<String, dynamic> responseBody) onSuccess,
    HttpMethod method = HttpMethod.get,
    Map<String, String> queryParameters = const {},
    Map<String, dynamic> body = const {},
    bool userApiKey = true,
  }) async {
    try {
      if (_ts != ''  || _ts.isNotEmpty) {
        queryParameters = {
          ...queryParameters,
          'ts': _ts,
        };
      }
      if (userApiKey) {
        queryParameters = {
          ...queryParameters,
          'apikey': _apiKey,
        };
      }
      if (_hash != ''  || _hash.isNotEmpty) {
        queryParameters = {
          ...queryParameters,
          'hash': _hash,
        };
      }
      late Uri url =
          Uri.parse(path.startsWith('http') ? path : '$_baseUrl$path');
      if (queryParameters.isNotEmpty) {
        url = url.replace(
          queryParameters: queryParameters,
        );
      }
      headers = {
        'Content-Type': 'application/json',
        ...headers,
      };
      late Response response;
      final bodyString = jsonEncode(body);

      switch (method) {
        case HttpMethod.get:
          response = await _client.get(url, headers: headers);
          break;
        case HttpMethod.post:
          response = await _client.post(
            url,
            headers: headers,
            body: bodyString,
          );
          break;
        case HttpMethod.put:
          response = await _client.put(
            url,
            headers: headers,
            body: bodyString,
          );
          break;
        case HttpMethod.patch:
          response = await _client.patch(
            url,
            headers: headers,
            body: bodyString,
          );
          break;
        case HttpMethod.delete:
          response = await _client.delete(
            url,
            headers: headers,
            body: bodyString,
          );
          break;
      }

      final statusCode = response.statusCode;
      final responseBody = _parseResponseBody(response.body);

      if (statusCode >= 200 && statusCode < 300) {
        return Either.right(
          onSuccess(responseBody),
        );
      }
      return Either.left(
        FailuresEnum.notFoundElements,
      );
    } catch (e) {
      if (e is ClientException || e is SocketException) {
        return Either.left(
          FailuresEnum.network,
        );
      }
      return Either.left(
        FailuresEnum.unknown,
      );
    }
  }
}
