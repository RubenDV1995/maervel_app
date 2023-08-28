import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:marvel_app/constants/colors.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: MainColor.primaryColor,
      indicatorBackgroundColor: Colors.grey,
      autoPlayInterval: 3000,
      isLoop: true,
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://firebasestorage.googleapis.com/v0/b/marvelapp-7a9e2.appspot.com/o/images%2Fcarousel%2Fc1.jpg?alt=media&token=8c369707-8a05-46cc-ba1a-220e91395054',
          fit: BoxFit.cover,
        ),
        CachedNetworkImage(
          imageUrl: 'https://firebasestorage.googleapis.com/v0/b/marvelapp-7a9e2.appspot.com/o/images%2Fcarousel%2Fc2.jpg?alt=media&token=f6f98c07-a150-4180-9019-e87c8a565fe9',
          fit: BoxFit.cover,
        ),
        CachedNetworkImage(
          imageUrl: 'https://firebasestorage.googleapis.com/v0/b/marvelapp-7a9e2.appspot.com/o/images%2Fcarousel%2Fc3.jpg?alt=media&token=b4b63bbe-da01-4c45-a19e-4b74855d9338',
          fit: BoxFit.cover,
        ),
        CachedNetworkImage(
          imageUrl: 'https://firebasestorage.googleapis.com/v0/b/marvelapp-7a9e2.appspot.com/o/images%2Fcarousel%2Fc4.jpg?alt=media&token=a18d8b16-a6f4-4348-ae2a-23ff91c557b6',
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
