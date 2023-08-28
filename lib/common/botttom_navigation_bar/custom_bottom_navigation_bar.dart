import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../icon/custom_icon.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      backgroundColor: MainColor.primaryColor,
      currentIndex: 0,
      onTap: (position) {},
      items: [
        SalomonBottomBarItem(
          selectedColor: MainColor.primaryColor300,
          title: const Text(
            titleComics,
          ),
          icon: const CustomIcon(
            iconData: Icons.border_all_rounded,
            color: MainColor.primaryWhite,
          ),
        ),
        SalomonBottomBarItem(
          selectedColor: MainColor.primaryColor300,
          title: const Text('Map'),
          icon: const CustomIcon(
            iconData: Icons.shopping_cart_outlined,
            color: MainColor.primaryWhite,
          ),
        ),
        SalomonBottomBarItem(
          selectedColor: MainColor.primaryColor300,
          title: const Text('Map'),
          icon: const CustomIcon(
            iconData: Icons.favorite_border_sharp,
            color: MainColor.primaryWhite,
          ),
        ),
        SalomonBottomBarItem(
          selectedColor: MainColor.primaryColor300,
          title: const Text('Map'),
          icon: const CustomIcon(
            iconData: Icons.account_circle_outlined,
            color: MainColor.primaryWhite,
          ),
        ),
      ],
    );
  }
}
