import 'package:chat_app_demo/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/inbox_model.dart';
import '../../widgets/chat_list_tile.dart';
import '../inbox_message.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<HomeController>(builder: (controller) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: controller.inboxes.length,
          itemBuilder: (context, index) {
            InboxModel inbox = controller.inboxes[index];
            return ChatListTile(
              onTap: () {
                Get.to(() => InboxMessage(
                      image: inbox.userImage,
                      name: inbox.userName,
                      lastSeen: inbox.lastSeen,
                      isActive: inbox.isActive,
                    ));
                inbox.isRead = true;
                controller.update();
              },
              userImage: inbox.userImage,
              userName: inbox.userName,
              message: inbox.message,
              messageCount: inbox.messageCount,
              time: inbox.time,
              isRead: inbox.isRead,
              isActive: inbox.isActive,
            );
          },
        );
      }),
    );
  }
}
