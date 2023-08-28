import '../../utils/either/either.dart';
import '../models/failure_model.dart';
import '../models/series_model.dart';

abstract class SeriesRepository {
  Future<Either<FailuresModel, Series>> getSeries();

}
