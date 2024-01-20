import 'package:chat_app_demo/app/data/config/my_converter.dart';
import 'package:file_picker/file_picker.dart';
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
      isSentByMe: false,
    ),
    MessageModel(
      message:
          'I have booked your house cleaning service. Waiting for your reply. Let me know when you\'re available.',
      isSentByMe: false,
    ),
  ];

  PlatformFile? platformFile;
  void sendFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result != null) {
      // Load result and file details
      String formattedSize = MyConverter.formatBytes(result.files.first.size);
      platformFile = result.files.first;
      // controller.attachedFile = result.files.single.path!;
      sendMessage(text: '${result.files.first.name} ($formattedSize)');
    } else {
      // User canceled the picker
    }
  }

  void sendImage() async {
    await MyImagePicker.getImageSource().then((value) {
      if (value != null && value) {
        MyImagePicker.pickImage().then((value) {
          sendMessage(images: [value!.path]);
        }).catchError((error) {
          kLogger.e('Camera error: $error');
        });
      } else if (value != null && !value) {
        MyImagePicker.pickMultipleImage().then((value) {
          List<String> images = value!.map((e) => e.path).toList();
          sendMessage(images: images);
        }).catchError((error) {
          kLogger.e('Image pick error: $error');
        });
      }
    });
  }

  void sendMessage({List<String>? images, String? text}) {
    if (images == null || images.isEmpty) {
      messages.add(
        MessageModel(
          message: text ?? msgTEController.text.trim(),
          isSentByMe: true,
          isFile: text != null ? true : false,
        ),
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
