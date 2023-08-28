import 'package:flutter/material.dart';
import 'package:marvel_app/common/padding/custom_padding.dart';
import 'package:marvel_app/common/subtitle/custom_subtitle.dart';
import 'package:marvel_app/constants/sizes.dart';
import '../../../../common/icon_button/custom_icon_button.dart';
import '../../../../common/scaffold_messenger/custom_scaffold_messenger.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/constants.dart';
import '../../../../domian/models/series_model.dart';
import 'custom_cached_network_image.dart';

class SeriesItem extends StatelessWidget {
  final Result series;
  final String nameImageResource;

  const SeriesItem({
    required this.series,
    required this.nameImageResource,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCustomScaffoldMessenger(
          context: context,
          title: lblNextFeatures,
        );
      },
      borderRadius: const BorderRadius.all(
        Radius.circular(
          spacingS_12,
        ),
      ),
      child: SizedBox(
        width: 140,
        child: Stack(
          children: [
            CustomCachedNetworkImage(
              nameImageResource: nameImageResource,
              width: 140.0,
              height: double.infinity,
            ),
            const BackgroundGradient(),
            ContentSerie(
              serie: series,
            ),
            Positioned(
              top: spacingXXS_4,
              right: spacingXXS_4,
              child: CustomIconButton(
                iconData: Icons.favorite_border_sharp,
                color: MainColor.primaryWhite,
                backgroundColor: MainColor.primarySpaceCadet,
                onPressed: () {
                  showCustomScaffoldMessenger(
                    context: context,
                    title: lblNextFeatures,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundGradient extends StatefulWidget {
  const BackgroundGradient({Key? key}) : super(key: key);

  @override
  State<BackgroundGradient> createState() => _BackgroundGradientState();
}

class _BackgroundGradientState extends State<BackgroundGradient> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            spacingS_12,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent.withOpacity(0.0),
            MainColor.primaryColor100,
          ],
        ),
      ),
      alignment: Alignment.bottomRight,
      child: const SizedBox.shrink(),
    );
  }
}

class ContentSerie extends StatelessWidget {
  final Result serie;

  const ContentSerie({
    required this.serie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      child: CustomPadding(
        typePadding: TypePadding.all,
        padding: spacingXXS_4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSubtitle(
              subtitle: serie.title,
              maxLines: 2,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: spacingXXS_4,
            ),
            CustomSubtitle(
              subtitle:
                  '${serie.startYear.toString()} - ${serie.endYear.toString()}',
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
