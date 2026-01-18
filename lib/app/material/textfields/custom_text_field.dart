import 'package:flutter/material.dart';

import '../../core/config/theme/app_colors.dart';
import '../../core/config/theme/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.controller,
  });
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText ?? '',
          textAlign: TextAlign.start,
          style: TextStyles.regular13,
        ),
        TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          style: TextStyles.medium15.copyWith(color: AppColors.primaryText),
          decoration: InputDecoration(
            hintText: hintText ?? '',
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
