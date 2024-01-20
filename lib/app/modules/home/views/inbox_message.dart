import 'package:chat_app_demo/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../data/config/theme/color.dart';
import '../../../data/config/theme/style.dart';
import '../../../widgets/my_network_image.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/my_textfield.dart';

class InboxMessage extends StatefulWidget {
  const InboxMessage(
      {Key? key,
      required this.image,
      required this.name,
      required this.lastSeen,
      required this.isActive,
      required this.heroTag})
      : super(key: key);

  final String image, name, lastSeen, heroTag;
  final bool isActive;

  @override
  State<InboxMessage> createState() => _InboxMessageState();
}

class _InboxMessageState extends State<InboxMessage> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhite,
        elevation: 0,
        title: Row(
          children: [
            Hero(
              tag: widget.heroTag,
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: kPrimaryColor.withOpacity(0.5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.r),
                  child: MyNetworkImage(imageUrl: widget.image),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name, style: kTitleMedium.copyWith(color: kWhite)),
                const SizedBox(height: 4),
                Text(widget.lastSeen,
                    style: kBodySmall.copyWith(color: kWhite)),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: ColoredBox(
        color: Colors.grey.shade100,
        child: Padding(
          padding: EdgeInsets.fromLTRB(12.w, 6.h, 12.w, 25.h),
          child: GetBuilder<HomeController>(builder: (controller) {
            return Row(
              children: [
                IconButton(
                  onPressed: controller.sendImage,
                  icon: const Icon(
                    Icons.camera_alt,
                    color: kPrimaryColor,
                  ),
                ),
                IconButton(
                  onPressed: controller.sendFile,
                  icon: const Icon(
                    Icons.attach_file,
                    color: kPrimaryColor,
                  ),
                ),
                Expanded(
                  child: RawScrollbar(
                    controller: _scrollController,
                    thumbColor: kPrimaryColor.withOpacity(0.5),
                    thickness: 3.0,
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: MyTextFormField(
                        scrollController: _scrollController,
                        controller: controller.msgTEController,
                        hintText: 'Write message...',
                        textInputAction: TextInputAction.newline,
                        // onFieldSubmitted: (_) => controller.sendMessage(),
                        onChanged: controller.toggleSendButtonVisibility,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Visibility(
                  visible: controller.isSendBtnVisible,
                  replacement: const SizedBox(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: controller.sendMessage,
                      icon: const Icon(
                        Icons.send,
                        color: kWhite,
                        size: 28,
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(25.w, 25.h, 25.w, 128.h),
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                var msg = controller.messages[index];
                return ChatBubble(
                  msg: msg.message,
                  isImage: msg.isImage,
                  isFile: msg.isFile,
                  isSentByMe: msg.isSentByMe,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
