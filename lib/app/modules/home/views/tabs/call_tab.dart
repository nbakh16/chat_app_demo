import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/inbox_model.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/call_list_tile.dart';

class CallTab extends StatelessWidget {
  const CallTab({
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
            return CallListTile(
              userImage: inbox.userImage,
              userName: inbox.userName,
              message: '28th October, 2023',
              isActive: inbox.isActive,
            );
          },
        );
      }),
    );
  }
}
