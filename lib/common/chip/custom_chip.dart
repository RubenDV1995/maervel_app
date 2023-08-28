import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../padding/custom_padding.dart';
import '../subtitle/custom_subtitle.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? fontColor;

  const CustomChip({
    required this.label,
    Key? key,
    this.color,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? MainColor.stateRed,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            spacingL_24,
          ),
        ),
      ),
      child: CustomPadding(
        typePadding: TypePadding.horizontal,
        padding: spacingS_12,
        child: CustomPadding(
          typePadding: TypePadding.vertical,
          padding: spacingXXS_4,
          child: CustomSubtitle(
            subtitle: label,
            color: fontColor ?? MainColor.primaryWhite,
          ),
        ),
      ),
    );
  }
}
