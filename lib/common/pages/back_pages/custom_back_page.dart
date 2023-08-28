import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../gradient/custom_gradient.dart';
import '../../icon/custom_icon.dart';
import '../../padding/custom_padding.dart';

class CustomBackPage extends StatelessWidget {
  final Widget body;

  const CustomBackPage({
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CustomIcon(
              iconData: FluentIcons.ios_arrow_ltr_24_filled,
              color: MainColor.primaryWhite,
            ),
          ),
        ),
        body: CustomPadding(
          typePadding: TypePadding.all,
          child: body,
        ),
      ),
    );
  }
}
