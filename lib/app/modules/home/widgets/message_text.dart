import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/config/theme/color.dart';
import '../../../data/config/theme/style.dart';

class MessageText extends StatelessWidget {
  const MessageText({
    super.key,
    required this.msg,
    required this.isSentByMe,
  });

  final String msg;
  final bool isSentByMe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.6,
        padding: EdgeInsets.all(10.r),
        margin: EdgeInsets.only(bottom: 16.r),
        decoration: BoxDecoration(
          color: isSentByMe
              ? kPrimaryColor.withOpacity(0.33)
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          msg,
          style: kBodyLarge,
        ),
      ),
    );
  }
}
