import 'package:chat_app_demo/app/widgets/custom_btn.dart';
import 'package:chat_app_demo/app/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/selection_chip.dart';
import '../controllers/auth_controller.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (c) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: c.nameTEC,
              prefixIcon: const Icon(
                Icons.person,
                color: Color(0xff7A7A7A),
              ),
              hintText: "Name",
              keyboardType: TextInputType.name,
            ),
            CustomTextField(
              controller: c.emailTEC,
              prefixIcon: const Icon(
                Icons.mail_outline,
                color: Color(0xff7A7A7A),
              ),
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            Wrap(
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: List.generate(
                c.roles.length,
                (index) => SelectionChip(
                  onTap: () => c.updateRoleSelection(index),
                  text: c.roles[index].capitalize ?? '',
                  isSelected: c.selectedRoleIndex == index,
                ),
              ),
            ),
            SizedBox(height: 14),
            PrimaryBtn(
              onPressed: c.login,
              child: const MyText('Login'),
            ),
            PrimaryBtn(
              onPressed: () => c.decodeJWT(c.jwtToken),
              child: const MyText('Decode'),
            ),
          ],
        );
      }),
    );
  }
}
