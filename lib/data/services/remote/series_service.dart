import '../../../domian/models/series_model.dart';
import '../../../utils/either/either.dart';
import '../../../utils/enums/failures.dart';
import '../http/http.dart';

class SeriesService {
  final Http _http;

  SeriesService(this._http);

  Future<Either<FailuresEnum, Series>> getSeries() async {
    final result = await _http.request(
      'v1/public/series?',
      userApiKey: true,
      method: HttpMethod.get,
      queryParameters: {},
      onSuccess: (responseBody) {
        final json = responseBody;
        final Map<String, dynamic> data = json;
        return Series.fromJson(data);
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
