import 'package:chat_app_demo/core/config/theme/app_theme.dart';
import 'package:chat_app_demo/view/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chit Chat',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      // darkTheme: AppTheme.darkTheme,
      home: LoginView(),
    );
  }
}
