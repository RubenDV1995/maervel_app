import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class CustomGridView extends StatelessWidget {
  final int itemCount;
  final double childAspectRatio;
  final Widget? Function(BuildContext, int) itemBuilder;

  const CustomGridView({
    required this.itemCount,
    required this.itemBuilder,
    required this.childAspectRatio,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(spacingXS_8),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
