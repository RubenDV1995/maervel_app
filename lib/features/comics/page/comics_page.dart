import 'package:flutter/material.dart';
import 'package:marvel_app/common/padding/custom_padding.dart';
import 'package:marvel_app/common/subtitle/custom_subtitle.dart';
import 'package:marvel_app/common/title/custom_title.dart';
import 'package:marvel_app/constants/sizes.dart';
import 'package:marvel_app/features/comics/controller/comics_controller.dart';
import 'package:provider/provider.dart';

import '../../../common/expansion_title/custom_expansion_title.dart';
import '../../../common/list_view/custom_vertical_list_view.dart';
import '../../../common/pages/back_pages/custom_profile_back_page.dart';
import '../../../common/scaffold_messenger/custom_scaffold_messenger.dart';
import '../../../constants/constants.dart';
import '../../../domian/models/comic_model.dart';
import '../../failure/page/failure_page.dart';
import '../widgets/skeletons/comic_skeleton.dart';

class ComicsPage extends StatefulWidget {
  final Result comic;
  final String nameImageResource;
  final String heroTag;

  const ComicsPage({
    required this.comic,
    required this.nameImageResource,
    required this.heroTag,
    Key? key,
  }) : super(key: key);

  @override
  State<ComicsPage> createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  late ComicsController _comicsController;

  @override
  void initState() {
    super.initState();
    _setRepositoryAndController();
    _getComic();
  }

  void _setRepositoryAndController() {
    _comicsController = Provider.of<ComicsController>(
      context,
      listen: false,
    );
  }

  Future<void> _getComic() async {
    Future.delayed(
      Duration.zero,
      () async {
        _comicsController.onLoadingComic(true);
      },
    );
    await _comicsController.getComic(
      comicId: widget.comic.id.toString(),
    );
  }

  void _showCustomScaffoldMessenger() {
    showCustomScaffoldMessenger(
      context: context,
      title: lblNextFeatures,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomProfileBackPage(
      title: widget.comic.title,
      urlImageBackground: widget.nameImageResource,
      heroTag: 'heroComic${widget.comic.id.toString()}',
      onTapFavorite: _showCustomScaffoldMessenger,
      body: CustomPadding(
        typePadding: TypePadding.all,
        child: Builder(
          builder: (context) {
            final comicsController = Provider.of<ComicsController>(context);
            if (comicsController.isLoadingComic == true) {
              return const ComicSkeleton();
            }
            if (comicsController.onErrorGetComics == true) {
              return FailurePage(
                failure: comicsController.failureModel,
                onPress: _getComic,
              );
            }
            final List<Result>? results = comicsController.comic?.data.results;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: spacingS_12,
                ),
                if (results!.first.title != '')
                  Wrap(
                    children: [
                      CustomTitle(
                        title: results.first.title.toString(),
                      ),
                      const SizedBox(
                        height: spacingL_24,
                      ),
                    ],
                  ),
                if (results.first.description != null)
                  Column(
                    children: [
                      CustomSubtitle(
                        subtitle: results.first.description.toString(),
                        maxLines: 50,
                      ),
                      const SizedBox(
                        height: spacingL_24,
                      ),
                    ],
                  ),
                if (results.first.variants.isNotEmpty)
                  Wrap(
                    children: [
                      const CustomTitle(
                        title: variants,
                      ),
                      const SizedBox(
                        height: spacingL_24,
                      ),
                      CustomVerticalListView(
                        itemCount: results.first.variants.length,
                        itemBuilder: (context, index) {
                          return CustomExpansionTitle(
                            title:
                                results.first.variants[index].name.toString(),
                            content: results.first.variants[index].resourceUri
                                .toString(),
                          );
                        },
                      ),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
