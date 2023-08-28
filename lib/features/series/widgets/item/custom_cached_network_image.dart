import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String nameImageResource;
  final double? width;
  final double? height;

  const CustomCachedNetworkImage({
    required this.nameImageResource,
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: nameImageResource != 'image_not_available'
          ? 'https://cdn.marvel.com/u/prod/marvel/i/mg/$nameImageResource/detail.jpg'
          : 'https://cdn.marvel.com/u/prod/marvel/i/mg/$nameImageResource/clean.jpg',
      imageBuilder: (context, imageProvider) => Container(
        width: width ?? 100.0,
        height: height ?? 150.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              spacingS_12,
            ),
          ),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
