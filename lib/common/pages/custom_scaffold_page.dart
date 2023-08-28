import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/constants/sizes.dart';

import '../../constants/colors.dart';
import '../appbar/custom_appbar.dart';
import '../botttom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../gradient/custom_gradient.dart';
import '../icon/custom_icon.dart';

class CustomScaffoldPage extends StatelessWidget {
  final Widget body;

  const CustomScaffoldPage({
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomGradient(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: true,
                snap: false,
                centerTitle: false,
                elevation: 0,
                backgroundColor: MainColor.primaryColor,
                title: Image.asset(
                  'assets/images/png/icon.png',
                  width: spacingXXL_80,
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const CustomIcon(
                      iconData: FluentIcons.settings_16_regular,
                      color: MainColor.primaryWhite,
                    ),
                  )
                ],
                bottom: const CustomAppbar(),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    body,
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: const CustomBottomNavigationBar(),
        ),
      ),
    );
  }
}
