import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/config/theme/style.dart';
import '../../../data/model/inbox_model.dart';
import '../../../widgets/my_image_picker.dart';

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
            "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg",
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

  void sendImage() async {
    await MyImagePicker.getImageSource().then((value) {
      if (value) {
        MyImagePicker.pickImage().then((value) {
          sendMessage(images: [value!.path]);
        }).catchError((error) {
          kLogger.e('Camera error: $error');
        });
      } else {
        MyImagePicker.pickMultipleImage().then((value) {
          List<String> images = value!.map((e) => e.path).toList();
          sendMessage(images: images);
        }).catchError((error) {
          kLogger.e('Image pick error: $error');
        });
      }
    });
  }

  void sendMessage({List<String>? images}) {
    if (images == null || images.isEmpty) {
      messages.add(
        MessageModel(
            message: msgTEController.text.trim(),
            isSentByMe: true,
            isImage: false),
      );
    } else {
      for (String image in images) {
        messages.add(
          MessageModel(message: image, isSentByMe: true, isImage: true),
        );
      }
    }
    msgTEController.clear();
    isSendBtnVisible = false;
    update();
  }
}
