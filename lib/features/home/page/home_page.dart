import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/constants/sizes.dart';
import 'package:provider/provider.dart';

import '../../../common/carousel/custom_carousel.dart';
import '../../../common/list_view/custom_list_view.dart';
import '../../../common/padding/custom_padding.dart';
import '../../../common/pages/custom_scaffold_page.dart';
import '../../../common/title/section/custom_section_title.dart';
import '../../../constants/constants.dart';
import '../../../data/services/remote/network_service.dart';
import '../../../domian/models/comic_model.dart';
import '../../comics/controller/comics_controller.dart';
import '../../comics/widgets/item/comic_item.dart';
import '../../comics/widgets/skeletons/comics_skeletons.dart';
import '../../failure/page/failure_page.dart';
import '../../offline/controller/network_controller.dart';
import '../../offline/page/network_page.dart';
import '../../series/controller/series_controller.dart';
import '../../series/widgets/item/series_item.dart';
import '../../../domian/models/series_model.dart' as series_model;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NetworkService _networkService = NetworkService.instance;

  ///Controller
  late NetworkController _networkController;

  @override
  void initState() {
    super.initState();
    _setRepositoryAndController();
    _checkNetwork();
  }

  void _setRepositoryAndController() {
    _networkController = Provider.of<NetworkController>(
      context,
      listen: false,
    );
  }

  void _checkNetwork() {
    _networkService.initialise();
    _networkService.myStream.listen(
      (source) {
        ConnectivityResult connectivityResult = source.keys.toList()[0];
        if (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          _networkController.setInternet(true);
        } else {
          _networkController.setInternet(false);
        }
      },
    );
  }

  @override
  void dispose() {
    _networkService.disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final networkController = Provider.of<NetworkController>(context);
        if (networkController.hastInternet == false) {
          return const NetworkPage();
        }
        return const CustomScaffoldPage(
          body: MainHomePage(),
        );
      },
    );
  }
}

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  late ComicsController _comicsController;
  late SeriesController _seriesController;

  @override
  void initState() {
    super.initState();
    _setRepositoryAndController();
    _getComics();
  }

  void _setRepositoryAndController() {
    _comicsController = Provider.of<ComicsController>(
      context,
      listen: false,
    );
    _seriesController = Provider.of<SeriesController>(
      context,
      listen: false,
    );
  }

  Future<void> _getComics() async {
    Future.delayed(
      Duration.zero,
      () async {
        _comicsController.onLoading(true);
      },
    );
    await _comicsController.getComics();
    await _seriesController.getSeries();
  }

  String getNameImageResource({required String url}) {
    List<String> result = url.split('/mg/');
    return result.last;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomCarousel(),
        const CustomSectionTile(
          title: titleComics,
        ),
        Builder(
          builder: (context) {
            final comicsController = Provider.of<ComicsController>(context);
            if (comicsController.isLoadingComics == true) {
              return const ComicsSkeletons();
            }
            if (comicsController.onErrorGetComics == true) {
              return FailurePage(
                failure: comicsController.failureModel,
                onPress: _getComics,
              );
            }
            final List<Result>? results = comicsController.comics?.data.results;
            return CustomPadding(
              typePadding: TypePadding.all,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: CustomListView(
                      itemCount: results?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ComicItem(
                          comic: results![index],
                          nameImageResource: getNameImageResource(
                            url: results[index].thumbnail.path.toString(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const CustomSectionTile(
          title: titleSeries,
        ),
        Builder(
          builder: (context) {
            final seriesController = Provider.of<SeriesController>(context);
            if (seriesController.isLoadingSeries == true) {
              return const ComicsSkeletons();
            }
            if (seriesController.onErrorGetSeries == true) {
              return FailurePage(
                failure: seriesController.failureModel,
                onPress: _getComics,
              );
            }
            final List<series_model.Result> resultsSeries =
                seriesController.series!.data.results;
            return CustomPadding(
              typePadding: TypePadding.all,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: CustomListView(
                      itemCount: resultsSeries.length ?? 0,
                      itemBuilder: (context, index) {
                        return SeriesItem(
                          series: resultsSeries[index],
                          nameImageResource: getNameImageResource(
                            url: resultsSeries[index].thumbnail.path.toString(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(
          height: spacingM_16,
        ),
      ],
    );
  }
}
