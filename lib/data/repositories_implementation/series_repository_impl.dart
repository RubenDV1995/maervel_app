import 'package:marvel_app/domian/models/failure_model.dart';
import 'package:marvel_app/domian/repositories/series_repository.dart';
import 'package:marvel_app/utils/either/either.dart';

import '../../domian/models/series_model.dart';
import '../services/remote/series_service.dart';
import 'failures_repository_impl.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  final SeriesService _seriesService;
  final FailureRepositoryImpl _failureRepositoryImpl;

  SeriesRepositoryImpl({
    required SeriesService seriesService,
    required FailureRepositoryImpl failureRepositoryImpl,
  })  : _seriesService = seriesService,
        _failureRepositoryImpl = failureRepositoryImpl;

  @override
  Future<Either<FailuresModel, Series>> getSeries() async {
    var resultSeries = await _seriesService.getSeries();
    return resultSeries.when(
      (failure) async => Either.left(
        await _failureRepositoryImpl.setFailure(
          failure.name,
        ),
      ),
      (series) async => Either.right(series),
    );
  }
}
