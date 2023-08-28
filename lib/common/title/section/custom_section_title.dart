import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/sizes.dart';
import '../../chip/custom_chip.dart';
import '../../padding/custom_padding.dart';
import '../custom_title.dart';

class CustomSectionTile extends StatelessWidget {
  final String title;

  const CustomSectionTile({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      typePadding: TypePadding.all,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: spacingM_16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTitle(
                title: title,
              ),
              const CustomChip(
                label: seeMore,
                fontColor: MainColor.primarySpaceCadet,
                color: MainColor.primaryColor300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
