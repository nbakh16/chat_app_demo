import 'package:chat_app_demo/services/auth/auth_service.dart';
import 'package:chat_app_demo/services/chat/chat_service.dart';
import 'package:chat_app_demo/widgets/my_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_bubble.dart';

class InboxView extends StatelessWidget {
  InboxView({super.key, required this.userEmail, required this.userId});
  final String userEmail, userId;

  final TextEditingController _msgTEController = TextEditingController();
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //send msg
  void sendMsg() async {
    if (_msgTEController.text.isNotEmpty) {
      await _chatService.sendMessage(
        userId,
        _msgTEController.text.trim(),
      );
      _msgTEController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userEmail),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderId = _authService.getCurrentUser()!.uid;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StreamBuilder(
          stream: _chatService.getMessage(userId, senderId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              children:
                  snapshot.data!.docs.map((e) => _buildMessageItem(e)).toList(),
            );
          }),
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderId'] == _authService.getCurrentUser()!.uid;

    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      // child: Text(data['message']),
      child: ChatBubble(
        msg: data['message'],
        isCurrentUser: isCurrentUser,
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextFormField(
              controller: _msgTEController,
              hintText: 'Write message...',
            ),
          ),
          IconButton(
            onPressed: sendMsg,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
