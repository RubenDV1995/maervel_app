import 'package:flutter/material.dart';
import 'package:marvel_app/constants/sizes.dart';

class CustomListView extends StatelessWidget {
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  const CustomListView({
    required this.itemCount,
    required this.itemBuilder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 220,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: spacingM_16,
            );
          },
        ),
      ),
    );
  }
}
