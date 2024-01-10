import 'package:flutter/material.dart';
import 'color.dart';

TextTheme kTextTheme(Color color) => TextTheme(
      //headline
      headlineLarge: kHeadlineLarge.copyWith(color: color),
      headlineMedium: kHeadlineMedium.copyWith(color: color),
      headlineSmall: kHeadlineSmall.copyWith(color: color),
      //title
      titleLarge: kTitleLarge.copyWith(color: color),
      titleMedium: kTitleMedium.copyWith(color: color),
      titleSmall: kTitleSmall.copyWith(color: color),
      //body
      bodyLarge: kBodyLarge.copyWith(color: color),
      bodyMedium: kBodyMedium.copyWith(color: color),
      bodySmall: kBodySmall.copyWith(color: color),
      //Label
      labelLarge: kLabelLarge.copyWith(color: color),
      labelMedium: kLabelMedium.copyWith(color: color),
      labelSmall: kLabelSmall.copyWith(color: color),
    );

TextStyle kHeadlineLarge = const TextStyle(
  color: kTextColor,
  fontSize: 32,
  fontWeight: FontWeight.w600,
);
TextStyle kHeadlineMedium = const TextStyle(
  color: kTextColor,
  fontSize: 26,
  fontWeight: FontWeight.w600,
);
TextStyle kHeadlineSmall = const TextStyle(
  color: kTextColor,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

TextStyle kTitleLarge = const TextStyle(
  color: kTextColor,
  fontSize: 20,
  fontWeight: FontWeight.w500,
);
TextStyle kTitleMedium = const TextStyle(
  color: kTextColor,
  fontSize: 18,
  fontWeight: FontWeight.w500,
);
TextStyle kTitleSmall = const TextStyle(
  color: kTextColor,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

TextStyle kBodyLarge = const TextStyle(
  color: kTextColor,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);
TextStyle kBodyMedium = const TextStyle(
  color: kTextColor,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);
TextStyle kBodySmall = const TextStyle(
  color: kTextColor,
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

TextStyle kLabelLarge = const TextStyle(
  color: kTextColor,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);
TextStyle kLabelMedium = const TextStyle(
  color: kTextColor,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);
TextStyle kLabelSmall = const TextStyle(
  color: kTextColor,
  fontSize: 12,
  fontWeight: FontWeight.w500,
);
