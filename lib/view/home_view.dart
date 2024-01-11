import 'package:chat_app_demo/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import '../services/auth/auth_service.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  void logout() async {
    try {
      AuthService().logoutUser();
    } catch (e) {
      Logger().e('Logout ERROR: $e');
    }
  }

  final ChatService _chat = ChatService();
  final AuthService _auth = AuthService();

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
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.abc,
                  color: Theme.of(context).colorScheme.primary,
                  size: 55,
                ),
              ),
              ListTile(
                title: const Text('Home'),
                leading: const Icon(Icons.home),
                onTap: () {
                  context.pop();
                },
              ),
              ListTile(
                title: const Text('Settings'),
                leading: const Icon(Icons.settings),
                onTap: () {
                  context.pop();
                },
              ),
              const Spacer(),
              ListTile(
                title: const Text('Logout'),
                leading: const Icon(Icons.logout),
                onTap: () {
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
      body: _getUsersList(),
    );
  }

  Widget _getUsersList() {
    return StreamBuilder(
        stream: _chat.getUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error loading user');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }

          print('>>${snapshot.data}');
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(context, userData))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      BuildContext context, Map<String, dynamic> userData) {
    return ListTile(
      onTap: () {},
      title: Text(
        userData['email'],
      ),
    );
  }
}
