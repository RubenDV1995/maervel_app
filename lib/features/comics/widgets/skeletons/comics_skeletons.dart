import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../common/list_view/custom_list_view.dart';
import '../../../../common/padding/custom_padding.dart';
import '../../../../constants/sizes.dart';

class ComicsSkeletons extends StatelessWidget {
  const ComicsSkeletons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      typePadding: TypePadding.all,
      child: CustomListView(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ComicItemSkeleton();
        },
      ),
    );
  }
}

class ComicItemSkeleton extends StatelessWidget {
  const ComicItemSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 140,
      child: SkeletonAvatar(
        style: SkeletonAvatarStyle(
          width: 140,
          borderRadius: BorderRadius.all(
            Radius.circular(
              spacingS_12,
            ),
          ),
        ),
      ),
    );
  }
}
