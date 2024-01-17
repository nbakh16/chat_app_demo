import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff0EAB8B);
const Color kPrimaryDarkColor = Color(0xff005947);
const Color kTitleColor = Color(0xff161616);
const Color kTextColor = Color(0xff222222);
const Color kTextLightColor = Color(0xff757575);

const Color kScaffoldBGColor = Colors.white;
const Color kDangerColor = Color(0xffF53D43);
const Color kRedLight = Color(0xffEC7979);
const Color kDisabledColor = Color(0xffEEEEEE);
const Color kDisabledTextColor = Color(0xff9F9F9F);
const Color kBtnBackDisableColor = Color(0xffDBDBDB);
const Color kSuccessColor = Color(0xff19B265);
const Color kInfoColor = Color.fromARGB(255, 2, 120, 255);
const Color kAppbarTextColor = Color(0xff1C1B1F);
const Color kHintTextColor = Color(0xff999999);
const Color kContainerBorderColor = Color(0xff0EAB8B);
const Color kBtnTextColor = Color(0xffFFFFFF);
const Color kBtnBackgroundColor = Color(0xff0EAB8B);
const Color kBtnDisableColor = Color(0xff7B7878);
const Color kTextDisableColor = Color(0xff7A7A7A);
const Color kBorderColor = Color.fromARGB(89, 159, 159, 159);
const Color kCardColor = Color(0xffF3F3F3);

// override color
const Color kWhite = Colors.white;
const Color kRed = Colors.red;
const Color kBlack = Colors.black;
const Color kYellow = Color(0xffFFCA1E);

// gradiant color
// const LinearGradient kBtnGradiantColor = LinearGradient(
//   colors: [kBrandColor, Color(0xffFFDE17)],
//   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
// );
// const LinearGradient kAppbarGradiantColor = LinearGradient(
//   colors: [kSecondaryColor, kBlack],
//   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
// );
//shadow
BoxShadow kCardShadow = const BoxShadow(
  color: Color.fromRGBO(34, 34, 34, 0.086),
  offset: Offset(4, 8),
  blurRadius: 24,
  spreadRadius: 4,
);

BoxShadow kbtnShadow = BoxShadow(
  offset: const Offset(1, 4),
  blurRadius: 8,
  spreadRadius: 0,
  color: const Color(0xff000000).withOpacity(0.2),
);
BoxShadow kbtnShadow2 = BoxShadow(
  offset: const Offset(1, 7),
  blurRadius: 8,
  spreadRadius: 0,
  color: const Color(0xff000000).withOpacity(0.24),
);

BoxShadow kAppbarShadow = BoxShadow(
  offset: const Offset(1, 3),
  blurRadius: 8,
  spreadRadius: 0,
  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
);
BoxShadow kSearchBarShadow = BoxShadow(
  offset: const Offset(1, 3),
  blurRadius: 8,
  spreadRadius: 5,
  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
);
