import 'package:chat_app_demo/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/config/theme/color.dart';
import '../../../data/config/theme/style.dart';
import '../../../data/model/inbox_model.dart';
import '../widgets/message_text.dart';
import '../widgets/my_textfield.dart';

class InboxMessage extends StatelessWidget {
  const InboxMessage(
      {Key? key,
      required this.image,
      required this.name,
      required this.lastSeen,
      required this.isActive})
      : super(key: key);

  final String image, name, lastSeen;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBGColor,
      appBar: AppBar(
        backgroundColor: kScaffoldBGColor,
        foregroundColor: kTextColor,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 26.r,
              backgroundImage:
                  const AssetImage('assets/images/default_user.png'),
              foregroundImage: NetworkImage(image),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: kTitleMedium),
                const SizedBox(height: 4),
                Text(lastSeen,
                    style: kBodySmall.copyWith(
                        color: isActive ? Colors.green : kTextLightColor)),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.fromLTRB(25.w, 0, 25.w, 25.h),
        child: Row(
          children: [
            Expanded(
              child: MyTextFormField(
                controller: HomeController.to.msgTEController,
                hintText: 'Write message...',
                textInputAction: TextInputAction.send,
                onFieldSubmitted: (_) {
                  if (HomeController.to.msgTEController.text.isNotEmpty) {
                    HomeController.to.messages.add(MessageModel(
                        message: HomeController.to.msgTEController.text.trim(),
                        isSentByMe: true));
                    HomeController.to.msgTEController.clear();
                    HomeController.to.update();
                  }
                },
              ),
            ),
            IconButton(
                onPressed: () {
                  if (HomeController.to.msgTEController.text.isNotEmpty) {
                    HomeController.to.messages.add(MessageModel(
                        message: HomeController.to.msgTEController.text.trim(),
                        isSentByMe: true));
                    HomeController.to.msgTEController.clear();
                    HomeController.to.update();
                  }
                },
                icon: const Icon(
                  Icons.send,
                  color: kPrimaryColor,
                  size: 30,
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
          child: GetBuilder<HomeController>(builder: (controller) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                var msg = controller.messages[index];
                return MessageText(
                  msg: msg.message,
                  isSentByMe: msg.isSentByMe,
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
