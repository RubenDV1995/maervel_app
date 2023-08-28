import 'package:flutter/material.dart';
import 'package:marvel_app/constants/sizes.dart';

class CustomVerticalListView extends StatelessWidget {
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  const CustomVerticalListView({
    required this.itemCount,
    required this.itemBuilder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: spacingXXS_4,
          );
        },
      ),
    );
  }
}
