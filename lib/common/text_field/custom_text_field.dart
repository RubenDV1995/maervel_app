import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../icon/custom_icon.dart';

class CustomTextField extends StatelessWidget {
  final void Function(String)? onChanged;

  const CustomTextField({required this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      autofocus: false,
      style: const TextStyle(
        color: MainColor.textCharcoal1,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        contentPadding: const EdgeInsets.all(
          spacingXS_8,
        ),
        filled: true,
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.7),
        ),
        hintText: "Buscar...",
        fillColor: MainColor.primaryWhite,
        suffixIcon: CustomIcon(
          iconData: Icons.search,
          color: Colors.grey.withOpacity(0.7),
        ),
      ),
    );
  }
}
