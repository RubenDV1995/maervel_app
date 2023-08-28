import 'package:flutter/material.dart';
import 'package:marvel_app/constants/colors.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
    showCustomScaffoldMessenger({
  required BuildContext context,
  required String title,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
      backgroundColor: MainColor.primaryColor300,
    ),
  );
}
