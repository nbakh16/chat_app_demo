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
    this.minLines = 1,
    this.maxLines = 3,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.controller,
    this.scrollController,
    this.validate,
    this.onChanged,
    this.onTap,
    this.onTapSuffix,
  });

  final String hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final int maxLines;
  final int minLines;
  final bool obscureText;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final ScrollController? scrollController;
  final String? Function(String?)? validate;
  final void Function(String?)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final void Function()? onTapSuffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollController: scrollController,
      controller: controller,
      onTap: onTap,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: 250,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: !readOnly,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      style: kBodyLarge,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: '',
        // labelText: hintText,
        hintStyle: kBodyLarge.copyWith(color: kTextLightColor),
        fillColor: kWhite, filled: true,
        focusColor: kPrimaryColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(width: 1.5, color: kPrimaryColor.withOpacity(0.5))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 2.0, color: kPrimaryColor)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validate,
      onChanged: onChanged,
    );
  }
}
