import 'package:flutter/foundation.dart';
import 'package:marvel_app/data/repositories_implementation/comics_respository_impl.dart';
import 'package:marvel_app/utils/either/either.dart';

import '../../../domian/models/comic_model.dart';
import '../../../domian/models/failure_model.dart';

class ComicsController extends ChangeNotifier {
  final ComicsRepositoryImpl comicsRepositoryImpl;

  ComicsController({
    required this.comicsRepositoryImpl,
  });

  Comics? _comics;
  Comics? _comic;
  late bool _isLoadingComics = true;
  late bool _isLoadingComic = true;
  late bool _onErrorGetComics = false;
  late FailuresModel _failuresModel;

  Comics? get comics => _comics;

  Comics? get comic => _comic;

  bool get isLoadingComics => _isLoadingComics;

  bool get isLoadingComic => _isLoadingComic;

  bool get onErrorGetComics => _onErrorGetComics;

  FailuresModel get failureModel => _failuresModel;

  Future<Either<FailuresModel, Comics>> getComics() async {
    var resultComics = await comicsRepositoryImpl.getComics();
    return resultComics.when((failure) {
      onLoading(false);
      onError(
        failuresModel: failure,
      );
      return Either.left(
        failure,
      );
    }, (comics) {
      onLoading(false);
      setComics(comics);
      return Either.right(
        comics,
      );
    });
  }

  Future<Either<FailuresModel, Comics>> getComic({
    required String comicId,
  }) async {
    var resultComic = await comicsRepositoryImpl.getComic(
      comicId: comicId,
    );
    return resultComic.when((failure) {
      onLoadingComic(false);
      onError(
        failuresModel: failure,
      );
      return Either.left(
        failure,
      );
    }, (comic) {
      onLoadingComic(false);
      setComic(comic);
      return Either.right(
        comic,
      );
    });
  }

  setComics(Comics comics) {
    _onErrorGetComics = false;
    _comics = comics;
    notifyListeners();
  }

  setComic(Comics comic) {
    _onErrorGetComics = false;
    _comic = comic;
    notifyListeners();
  }

  onError({
    required FailuresModel failuresModel,
  }) {
    _failuresModel = failuresModel;
    _onErrorGetComics = true;
    notifyListeners();
  }

  onLoading(bool value) {
    _isLoadingComics = value;
    notifyListeners();
  }

  onLoadingComic(bool value) {
    _isLoadingComic = value;
    notifyListeners();
  }
}
