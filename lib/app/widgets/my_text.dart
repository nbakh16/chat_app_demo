import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final dynamic fontWeight;
  final dynamic textAlign;
  final TextOverflow? overflow;
  final int maxLines;
  final FontStyle? fontStyle;
  final double letterSpacing;

  const MyText(
    this.text, {
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines = 2,
    this.fontStyle,
    this.letterSpacing = 0.45,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        overflow: overflow ?? TextOverflow.ellipsis,
        maxLines: maxLines,
        style: TextStyle(
          color: color ?? Colors.black87,
          fontSize: fontSize ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          letterSpacing: letterSpacing,
        ),
      );
}
