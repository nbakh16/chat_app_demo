import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'color.dart';

// logger
Logger kLogger = Logger();

/// style
TextStyle kHeadlineLarge = const TextStyle(
    color: kTextColor, fontSize: 32, fontWeight: FontWeight.w500);
TextStyle kHeadlineMedium = const TextStyle(
    color: kTextColor, fontSize: 24, fontWeight: FontWeight.w500);
TextStyle headlineSmall = const TextStyle(
    color: kTextColor, fontSize: 18, fontWeight: FontWeight.w500);
// title
TextStyle kTitleLarge = const TextStyle(
    color: kTextColor, fontSize: 20, fontWeight: FontWeight.w500);
TextStyle kTitleMedium = const TextStyle(
    color: kTextColor, fontSize: 18, fontWeight: FontWeight.w500);
TextStyle kTitleSmall = const TextStyle(
    color: kTextColor, fontSize: 16, fontWeight: FontWeight.w500);
// body
TextStyle kBodyLarge = const TextStyle(
    color: kTextColor, fontSize: 16, fontWeight: FontWeight.w400);
TextStyle kBodyMedium = const TextStyle(
    color: kTextColor, fontSize: 14, fontWeight: FontWeight.w400);
TextStyle kBodySmall = const TextStyle(
    color: kTextColor, fontSize: 12, fontWeight: FontWeight.w400);
// label
TextStyle kLabelLarge = const TextStyle(
    color: kTextColor, fontSize: 16, fontWeight: FontWeight.w600);
TextStyle kLabelMedium = const TextStyle(
    color: kTextColor, fontSize: 14, fontWeight: FontWeight.w600);
TextStyle kLabelSmall = const TextStyle(
    color: kTextColor, fontSize: 12, fontWeight: FontWeight.w600);

///
const TextStyle kDangerStyle = TextStyle(color: kDangerColor, fontSize: 14);
const TextStyle kRegulerStyle = TextStyle(color: kTextColor, fontSize: 14);
