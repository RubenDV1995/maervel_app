import 'package:marvel_app/domian/models/comic_model.dart';

import '../../utils/either/either.dart';
import '../models/failure_model.dart';

abstract class ComicsRepository {
  Future<Either<FailuresModel, Comics>> getComics();

  Future<Either<FailuresModel, Comics>> getComic({
    required String comicId,
  });
}
