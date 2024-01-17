import 'package:chat_app_demo/app/data/config/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/model/inbox_model.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  List<InboxModel> inboxes = [
    InboxModel(
      userImage: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde",
      userName: 'Rakib Hossain',
      message: 'I have booked your house cleaning service. Have a look',
      messageCount: 2,
      time: '10:10 AM',
      isRead: false,
      isActive: true,
      lastSeen: 'Active Now',
    ),
    InboxModel(
        userImage:
            "https://static.photocdn.pt/images/articles/2019/08/07/images/articles/2019/07/31/linkedin_photo_tips.webp",
        userName: 'Asma Begum',
        message: 'I have booked your house cleaning service.',
        messageCount: 2,
        time: '10:10 AM',
        isRead: true,
        isActive: false,
        lastSeen: '10 hours ago'),
  ];

  TextEditingController msgTEController = TextEditingController();
  bool isSendBtnVisible = false;
  void toggleSendButtonVisibility(String? value) {
    if (value == null || value.isEmpty) {
      isSendBtnVisible = false;
    } else {
      isSendBtnVisible = true;
    }
    update();
  }

  List<MessageModel> messages = [
    MessageModel(
      message: 'Hello, Good morning.',
      isImage: false,
      isSentByMe: false,
    ),
    MessageModel(
      message:
          'I have booked your house cleaning service. Waiting for your reply. Let me know when you\'re available.',
      isImage: false,
      isSentByMe: false,
    ),
  ];

  String? imgString;
  void sendMessage({bool isImage = false, String? msg}) {
    if (msgTEController.text.isNotEmpty) {
      messages.add(MessageModel(
          message: msg ?? msgTEController.text.trim(),
          isSentByMe: true,
          isImage: isImage));

      kLogger.w(imgString);

      msgTEController.clear();
      isSendBtnVisible = false;
      update();
    }
  }
}
