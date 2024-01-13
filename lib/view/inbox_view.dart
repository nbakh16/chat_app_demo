import 'package:chat_app_demo/services/auth/auth_service.dart';
import 'package:chat_app_demo/services/chat/chat_service.dart';
import 'package:chat_app_demo/widgets/my_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_bubble.dart';

class InboxView extends StatefulWidget {
  const InboxView({super.key, required this.userEmail, required this.userId});
  final String userEmail, userId;

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  final TextEditingController _msgTEController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () => scrollDown(),
        );
      }
    });

    Future.delayed(
      const Duration(milliseconds: 500),
      () => scrollDown(),
    );
  }

  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _msgTEController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  //send msg
  void sendMsg() async {
    if (_msgTEController.text.isNotEmpty) {
      await _chatService.sendMessage(
        widget.userId,
        _msgTEController.text.trim(),
      );
      _msgTEController.clear();

      scrollDown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userEmail),
        backgroundColor: Theme.of(context).colorScheme.background,
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
          stream: _chatService.getMessage(widget.userId, senderId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              controller: _scrollController,
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
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      child: Row(
        children: [
          Expanded(
            child: MyTextFormField(
              controller: _msgTEController,
              focusNode: _focusNode,
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
