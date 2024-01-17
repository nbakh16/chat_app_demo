import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/config/theme/color.dart';
import '../../../data/config/theme/style.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.controller,
    this.validate,
    this.onChanged,
    this.onTap,
    this.onTapSuffix,
  });

  final String hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final int maxLines;
  final bool obscureText;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final void Function(String?)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final void Function()? onTapSuffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      maxLines: maxLines,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: !readOnly,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      style: kBodyLarge,
      decoration: InputDecoration(
        hintText: hintText,
        // labelText: hintText,
        hintStyle: kBodyLarge.copyWith(color: kTextLightColor),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 1.5)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validate,
      onChanged: onChanged,
    );
  }
}
