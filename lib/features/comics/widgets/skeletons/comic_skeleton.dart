import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ComicSkeleton extends StatelessWidget {
  const ComicSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SkeletonParagraph(
        style: SkeletonParagraphStyle(
          lines: 12,
          spacing: 8,
          lineStyle: SkeletonLineStyle(
            randomLength: true,
            height: 15,
            borderRadius: BorderRadius.circular(8),
            minLength: MediaQuery.of(context).size.width / 2,
            maxLength: MediaQuery.of(context).size.width / 1,
          ),
        ),

    );
  }
}
