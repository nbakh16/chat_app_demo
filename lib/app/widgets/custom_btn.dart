import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'my_text.dart';

class PrimaryBtn extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget child;
  final Function()? onPressed;
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? elevation;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final BorderSide? side;
  final bool isOutlined;

  const PrimaryBtn({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    required this.onPressed,
    this.borderRadius,
    this.style,
    this.height,
    this.width,
    this.elevation,
    this.padding,
    required this.child,
    this.side,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: !isOutlined
          ? ElevatedButton.styleFrom(
              elevation: elevation ?? 0,
              disabledBackgroundColor: theme.primaryColor.withOpacity(.2),
              disabledForegroundColor: Colors.white,
              backgroundColor: backgroundColor ?? theme.primaryColorLight,
              foregroundColor: foregroundColor ?? Colors.white,
              splashFactory: NoSplash.splashFactory,
              padding: padding ??
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 50.sp),
              ),
              side: side
              //  BorderSide(
              //   color: theme.disabledColor,
              //   width: 2,
              // ),
              )
          : ElevatedButton.styleFrom(
              elevation: elevation ?? 0,
              disabledBackgroundColor: theme.primaryColor.withOpacity(.2),
              disabledForegroundColor: Colors.white,
              backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
              foregroundColor: foregroundColor ?? Colors.white,
              splashFactory: NoSplash.splashFactory,
              padding: padding ??
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 50.sp),
              ),
              side: side ??
                  const BorderSide(
                    // color: AppColors.primaryLight,
                    width: 1.5,
                  ),
            ),
      child: child,
    );
  }
}

class OutLineBtn extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget child;
  final Color? foregroundColor;
  final VoidCallback? onPressed;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final TextStyle? textStyle;

  const OutLineBtn(
      {super.key,
      this.backgroundColor,
      this.borderColor,
      this.foregroundColor,
      this.onPressed,
      this.borderRadius,
      this.padding,
      this.height,
      this.width,
      this.textStyle,
      required this.child});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            padding: padding ??
                const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            foregroundColor: foregroundColor ?? theme.primaryColor,
            side: BorderSide(
                width: 1,
                color: borderColor ??
                    (onPressed == null
                        ? theme.disabledColor
                        : theme.primaryColor)),
            backgroundColor: backgroundColor ?? Colors.transparent,
            disabledForegroundColor: theme.disabledColor,
            disabledBackgroundColor: theme.disabledColor.withOpacity(.5),
            textStyle: textStyle,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  borderRadius ?? 16.r), // Change the border radius value
            ),
          ),
          onPressed: onPressed,
          child: child),
    );
  }
}

class GradientBtn extends StatelessWidget {
  const GradientBtn({
    super.key,
    required this.text,
    this.textSize = 18,
    this.onTap,
    this.width,
    this.height,
    this.padding,
  });

  final String text;
  final double textSize;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 48,
        width: width,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          gradient: onTap == null
              ? const LinearGradient(
                  colors: [
                    Color(0xff9F9F9F),
                    Color(0xff9F9F9F)
                  ], // Define your gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [
                    theme.primaryColor,
                    theme.primaryColorLight,
                  ],
                ),
          borderRadius:
              BorderRadius.circular(50), // Optional: Add border radius
        ),
        child: Center(
          child: MyText(
            text,
            fontSize: textSize,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
