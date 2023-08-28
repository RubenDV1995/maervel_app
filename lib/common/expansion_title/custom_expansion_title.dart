import 'package:flutter/material.dart';
import 'package:marvel_app/common/subtitle/custom_subtitle.dart';
import 'package:marvel_app/common/title/custom_title.dart';
import 'package:marvel_app/constants/colors.dart';
import 'package:marvel_app/constants/sizes.dart';

class CustomExpansionTitle extends StatelessWidget {
  final String title;
  final String? content;

  const CustomExpansionTitle({
    required this.title,
    Key? key,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      dense: true,
      horizontalTitleGap: 0.0,
      minLeadingWidth: 0,
      child: ExpansionTile(
        backgroundColor: MainColor.secondaryCharcoal,
        collapsedBackgroundColor: MainColor.secondaryCharcoal,
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            spacingXS_8,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            spacingXS_8,
          ),
        ),
        title: CustomTitle(
          title: title,
          size: spacingM_16,
        ),
        trailing: const Icon(
          Icons.arrow_drop_down,
        ),
        children: <Widget>[
          if (content != null)
            ListTile(
              title: CustomSubtitle(
                subtitle: content!,
                color: MainColor.textColor200,
              ),
            ),
        ],
        onExpansionChanged: (bool expanded) {},
      ),
    );
  }
}
