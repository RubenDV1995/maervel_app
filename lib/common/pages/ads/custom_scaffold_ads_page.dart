import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/sizes.dart';
import '../../appbar/custom_appbar.dart';
import '../../floating_action_button/custom_floating_action_button.dart';
import '../../gradient/custom_gradient.dart';
import '../../padding/custom_padding.dart';

class CustomScaffoldAdsPage extends StatelessWidget {
  final Widget body;
  final Widget ads;

  const CustomScaffoldAdsPage({
    required this.body,
    required this.ads,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomGradient(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
              const CustomAppbar(
                iconData: FluentIcons.sleep_20_regular,
                title: titleApp,
              ),
            ],
            body: Column(
              children: [
                Expanded(
                  child: CustomPadding(
                    typePadding: TypePadding.all,
                    child: body,
                  ),
                ),
                ads,
              ],
            ),
          ),
          floatingActionButton: const Padding(
            padding: EdgeInsets.only(
              bottom: spacingXXL_48,
            ),
            child: CustomFloatingActionButton(),
          ),
        ),
      ),
    );
  }
}
