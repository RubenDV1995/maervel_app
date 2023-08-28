import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../icon/custom_icon.dart';
import '../padding/custom_padding.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final void Function()? onPressed;
  final Color? color;
  final Color? backgroundColor;

  const CustomIconButton({
    required this.onPressed,
    required this.iconData,
    Key? key,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? MainColor.primarySpaceCadet,
      ),
      child: CustomPadding(
        typePadding: TypePadding.all,
        padding: spacingXXS_4,
        child: IconButton(
          padding: const EdgeInsets.all(0.0),
          constraints: const BoxConstraints(),
          icon: CustomIcon(
            iconData: iconData,
            color: color ?? MainColor.primaryColor,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
