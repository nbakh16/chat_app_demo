import 'dart:io';
import 'package:chat_app_demo/app/widgets/my_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/config/theme/color.dart';
import '../../../data/config/theme/style.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.msg,
    this.isImage = false,
    this.isFile = false,
    required this.isSentByMe,
  });

  final String msg;
  final bool isImage;
  final bool isFile;
  final bool isSentByMe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.6,
        ),
        padding: EdgeInsets.all(12.r),
        margin: EdgeInsets.only(bottom: 12.r),
        decoration: BoxDecoration(
          color: isSentByMe ? kPrimaryColor.withOpacity(0.1) : kWhite,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Visibility(
          visible: isImage || isFile,
          replacement: Text(
            msg,
            style: kBodyLarge.copyWith(fontSize: 18),
          ),
          child: Visibility(
            visible: isImage,
            replacement: GestureDetector(
              onTap: () {},
              child: Text(
                msg,
                style: const TextStyle(
                  color: kPrimaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: kPrimaryColor,
                  decorationThickness: 2,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            child: SizedBox(
              height: 225,
              width: MediaQuery.sizeOf(context).width * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: GestureDetector(
                  onTap: () => MyShowDialog.imageShowDialog(context, msg),
                  child: Image.file(
                    File(msg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ).animate().fade(duration: 200.ms).slideY(duration: 250.ms, begin: 1);
  }
}
