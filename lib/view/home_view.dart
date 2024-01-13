import 'package:chat_app_demo/core/config/routes.dart';
import 'package:chat_app_demo/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import '../services/auth/auth_service.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  void logout(BuildContext context) async {
    try {
      AuthService().logoutUser();
      context.goNamed(RouteName.login);
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
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
            onPressed: () => logout(context),
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
            return const Text('Error loading user');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

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
    if (userData['email'] != _auth.getCurrentUser()!.email) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          onTap: () {
            context.goNamed(RouteName.inbox,
                // pathParameters: {'user': userData['email']},
                queryParameters: {
                  'userEmail': userData['email'],
                  'userId': userData['uid']
                });
          },
          title: Text(
            userData['email'],
            style: Theme.of(context).textTheme.titleLarge,
          ),
          leading: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person_2,
              color: Colors.grey,
            ),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
