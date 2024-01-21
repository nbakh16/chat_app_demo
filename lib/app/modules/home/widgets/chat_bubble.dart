import 'dart:io';
import 'package:chat_app_demo/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/config/theme/color.dart';
import '../../../data/config/theme/style.dart';
import 'package:get/get.dart';

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
    bool isEmoji = isFile && msg.split(' ').length <= 1;
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        elevation: isEmoji ? 0 : 1.25,
        color: Colors.transparent,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.6,
          ),
          padding: EdgeInsets.all(12.r),
          // margin: EdgeInsets.only(bottom: 12.r),
          decoration: BoxDecoration(
            color: isEmoji
                ? Colors.transparent
                : isSentByMe
                    ? const Color(0xffb2fdee)
                    : kWhite,
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
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    decorationThickness: isEmoji ? 0 : 1.5,
                    fontSize: isEmoji ? 60 : 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              child: SizedBox(
                height: 225,
                // width: MediaQuery.sizeOf(context).width * 0.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: GestureDetector(
                    onTap: () {
                      // MyShowDialog.imageShowDialog(context, msg);
                      Get.toNamed(Routes.IMAGE, arguments: msg);
                    },
                    child: Hero(
                      tag: msg,
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
        ),
      ),
    ).animate().fade(duration: 200.ms).slideY(duration: 250.ms, begin: 1);
  }
}
