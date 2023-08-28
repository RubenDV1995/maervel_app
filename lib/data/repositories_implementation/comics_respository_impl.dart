import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marvel_app/data/services/remote/comics_service.dart';
import 'package:marvel_app/domian/models/comic_model.dart';
import 'package:marvel_app/domian/models/failure_model.dart';
import 'package:marvel_app/domian/repositories/comics_repository.dart';
import 'package:marvel_app/utils/either/either.dart';

import 'failures_repository_impl.dart';

class ComicsRepositoryImpl implements ComicsRepository {
  final ComicsService _comicsService;
  final FailureRepositoryImpl _failureRepositoryImpl;

  ComicsRepositoryImpl({
    required ComicsService comicsService,
    required FailureRepositoryImpl failureRepositoryImpl,
  })  : _comicsService = comicsService,
        _failureRepositoryImpl = failureRepositoryImpl;

  @override
  Future<Either<FailuresModel, Comics>> getComics() async {
    var resultComics = await _comicsService.getComics();
    return resultComics.when(
      (failure) async => Either.left(
        await _failureRepositoryImpl.setFailure(
          failure.name,
        ),
      ),
      (comics) async => Either.right(comics),
    );
  }

  @override
  Future<Either<FailuresModel, Comics>> getComic({
    required String comicId,
  }) async {
    var resultComic = await _comicsService.getComic(
      comicId: comicId,
    );
    return resultComic.when(
      (failure) async => Either.left(
        await _failureRepositoryImpl.setFailure(
          failure.name,
        ),
      ),
      (comic) async => Either.right(comic),
    );
  }
}
