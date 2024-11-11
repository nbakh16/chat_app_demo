import 'package:chat_app_demo/app/routes/app_pages.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final nameTEC = TextEditingController();
  final emailTEC = TextEditingController();

  int? selectedRoleIndex;
  List<String> roles = ['teacher', 'student', 'staff'];
  updateRoleSelection(int index) {
    selectedRoleIndex = index;
    update();
  }

  String jwtToken = '';
  generateJWT() {
    final jwt = JWT(
      {
        'name': nameTEC.text.trim(),
        'email': emailTEC.text.trim(),
        'role': roles[selectedRoleIndex ?? 0],
        // 'created_at': DateTime.now().toString(),
        // 'expires_at': DateTime.now().add(Duration(minutes: 15)).toString(),
      },
    );
    jwtToken = jwt.sign(
      SecretKey('abscddd'),
    );

    print('Signed token: $jwtToken\n');
  }

  decodeJWT(String token) {
    final jwt = JWT.decode(token);

    print('Payload: ${jwt.payload}');
  }

  login() {
    generateJWT();
    // Get.toNamed(Routes.HOME);
  }
}
