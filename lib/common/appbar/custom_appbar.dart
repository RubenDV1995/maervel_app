import 'package:flutter/material.dart';
import 'package:marvel_app/common/padding/custom_padding.dart';
import '../text_field/custom_text_field.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final IconData? iconData;
  final String? title;

  const CustomAppbar({
    Key? key,
    this.iconData,
    this.title,
  }) : super(key: key);

  void _filterSearchResults(String query) {
    /*
    _productController.onSortOption(
      query: query,
    );

     */
  }

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      typePadding: TypePadding.all,
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Center(
          child: CustomTextField(
            onChanged: _filterSearchResults,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
