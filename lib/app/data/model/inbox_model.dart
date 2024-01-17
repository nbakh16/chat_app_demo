class InboxModel {
  String userImage;
  String userName;
  String message;
  int messageCount;
  String time;
  bool isRead;
  bool isActive;
  String lastSeen;

  InboxModel({
    required this.userImage,
    required this.userName,
    required this.message,
    required this.messageCount,
    required this.time,
    required this.isRead,
    required this.isActive,
    required this.lastSeen,
  });
}

class MessageModel {
  String message;
  bool isSentByMe;

  MessageModel({
    required this.message,
    required this.isSentByMe,
  });
}
