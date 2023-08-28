import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/common/gradient/custom_gradient.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../icon/custom_icon.dart';
import '../../icon_button/custom_icon_button.dart';
import '../../padding/custom_padding.dart';

class CustomProfileBackPage extends StatelessWidget {
  final Widget body;
  final String heroTag;
  final String urlImageBackground;
  final String? title;
  final void Function()? onTapFavorite;

  const CustomProfileBackPage({
    required this.body,
    required this.urlImageBackground,
    required this.heroTag,
    Key? key,
    this.title,
    this.onTapFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradient(
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                snap: true,
                floating: true,
                expandedHeight: 450.0,
                actions: [
                  CustomPadding(
                    typePadding: TypePadding.horizontal,
                    padding: spacingM_16,
                    child: CustomIconButton(
                      iconData: Icons.favorite_border_sharp,
                      color: MainColor.primaryWhite,
                      onPressed: onTapFavorite,
                    ),
                  )
                ],
                leading: IconButton(
                  icon: const CustomIcon(
                    iconData: Icons.arrow_back_ios_new_outlined,
                    color: MainColor.primaryWhite,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: heroTag,
                    child: Background(
                      urlImageBackground: urlImageBackground,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: body,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  final String urlImageBackground;

  const Background({
    required this.urlImageBackground,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            urlImageBackground != 'image_not_available'
                ? 'https://cdn.marvel.com/u/prod/marvel/i/mg/$urlImageBackground/detail.jpg'
                : 'https://cdn.marvel.com/u/prod/marvel/i/mg/$urlImageBackground/clean.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent.withOpacity(0.15),
                        MainColor.primaryColor100,
                      ],
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                  child: const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
