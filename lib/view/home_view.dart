import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../auth/auth_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  void logout() async {
    try {
      AuthService().logoutUser();
    } catch (e) {
      Logger().e('Logout ERROR: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
