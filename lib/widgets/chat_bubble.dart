import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.msg,
    required this.isCurrentUser,
  });

  final String msg;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.green : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        msg,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: isCurrentUser ? Colors.white : Colors.black87,
            ),
      ),
    );
  }
}
