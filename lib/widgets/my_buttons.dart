import 'package:flutter/material.dart';
import '../core/config/theme/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 4,
          // disabledBackgroundColor: kDisabledColor,
          // disabledForegroundColor: kWhite,
          backgroundColor: kPrimaryColor,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: child,
      ),
    );
  }
}
