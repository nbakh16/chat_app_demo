import 'package:flutter/material.dart';

import '../core/config/theme/color.dart';
import '../core/config/theme/text_theme.dart';

class BtnText extends StatelessWidget {
  const BtnText(
    this.text, {
    super.key,
    this.txtColor = kWhite,
  });

  final String text;
  final Color txtColor;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        text,
        style: kHeadlineSmall.copyWith(color: txtColor),
      ),
    );
  }
}
