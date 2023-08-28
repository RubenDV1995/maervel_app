import 'package:marvel_app/domian/models/comic_model.dart';

import '../../../utils/either/either.dart';
import '../../../utils/enums/failures.dart';
import '../http/http.dart';

class ComicsService {
  final Http _http;

  ComicsService(this._http);

  Future<Either<FailuresEnum, Comics>> getComics() async {
    final result = await _http.request(
      'v1/public/comics?',
      userApiKey: true,
      method: HttpMethod.get,
      queryParameters: {},
      onSuccess: (responseBody) {
        final json = responseBody;
        final Map<String, dynamic> data = json;
        return Comics.fromJson(data);
      },
    );

    return result.when(
      (failure) async => Either.left(
        failure,
      ),
      (result) => Either.right(
        result,
      ),
    );
  }

  Future<Either<FailuresEnum, Comics>> getComic({
    required String comicId,
  }) async {
    final result = await _http.request(
      'v1/public/comics/$comicId?',
      userApiKey: true,
      method: HttpMethod.get,
      queryParameters: {},
      onSuccess: (responseBody) {
        final json = responseBody;
        final Map<String, dynamic> data = json;
        return Comics.fromJson(data);
      },
    );

    return result.when(
      (failure) async => Either.left(
        failure,
      ),
      (result) => Either.right(
        result,
      ),
    );
  }
}
