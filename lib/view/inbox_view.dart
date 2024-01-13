import 'package:flutter/material.dart';

class InboxView extends StatelessWidget {
  const InboxView({super.key, required this.user});
  final String user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user),
      ),
      body: Center(
        child: Text('body'),
      ),
    );
  }
}
