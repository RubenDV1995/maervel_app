import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final double? size;
  final int? maxLines;

  const CustomTitle({
    required this.title,
    Key? key,
    this.size,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines ?? 1,
      style: size != null
          ? Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: size,
                overflow: TextOverflow.fade,
              )
          : Theme.of(context).textTheme.titleLarge,
    );
  }
}
