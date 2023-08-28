import 'package:flutter/foundation.dart';
import 'package:marvel_app/utils/either/either.dart';

import '../../../data/repositories_implementation/series_repository_impl.dart';
import '../../../domian/models/failure_model.dart';
import '../../../domian/models/series_model.dart';

class SeriesController extends ChangeNotifier {
  final SeriesRepositoryImpl seriesRepositoryImpl;

  SeriesController({
    required this.seriesRepositoryImpl,
  });

  Series? _series;
  late bool _isLoadingSeries = true;
  late bool _onErrorGetSeries = false;
  late FailuresModel _failuresModel;

  Series? get series => _series;

  bool get isLoadingSeries => _isLoadingSeries;

  bool get onErrorGetSeries => _onErrorGetSeries;

  FailuresModel get failureModel => _failuresModel;

  Future<Either<FailuresModel, Series>> getSeries() async {
    var resultSeries = await seriesRepositoryImpl.getSeries();
    return resultSeries.when((failure) {
      onLoading(false);
      onError(
        failuresModel: failure,
      );
      return Either.left(
        failure,
      );
    }, (series) {
      onLoading(false);
      setSeries(series);
      return Either.right(
        series,
      );
    });
  }

  setSeries(Series series) {
    _onErrorGetSeries = false;
    _series = series;
    notifyListeners();
  }

  onError({
    required FailuresModel failuresModel,
  }) {
    _failuresModel = failuresModel;
    _onErrorGetSeries = true;
    notifyListeners();
  }

  onLoading(bool value) {
    _isLoadingSeries = value;
    notifyListeners();
  }
}
