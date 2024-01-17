import 'package:chat_app_demo/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../data/config/theme/color.dart';
import '../../../data/config/theme/style.dart';
import '../../../data/model/inbox_model.dart';
import '../../../widgets/my_network_image.dart';
import '../widgets/chat_bubble.dart';
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
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhite,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundColor: kPrimaryColor.withOpacity(0.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: MyNetworkImage(imageUrl: image),
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: kTitleMedium.copyWith(color: kWhite)),
                const SizedBox(height: 4),
                Text(lastSeen, style: kBodySmall.copyWith(color: kWhite)),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: ColoredBox(
        color: Colors.grey.shade300,
        child: Padding(
          padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 25.h),
          child: Row(
            children: [
              Expanded(
                child: MyTextFormField(
                  controller: HomeController.to.msgTEController,
                  hintText: 'Write message...',
                  textInputAction: TextInputAction.send,
                  onFieldSubmitted: (_) => HomeController.to.sendMessage(),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  onPressed: HomeController.to.sendMessage,
                  icon: const Icon(
                    Icons.send,
                    color: kPrimaryColor,
                    size: 28,
                  ),
                ),
              )
            ],
          ),
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
                return ChatBubble(
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
