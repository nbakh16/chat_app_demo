import 'package:chat_app_demo/core/utils/int_extensions.dart';
import 'package:chat_app_demo/widgets/btn_text.dart';
import 'package:chat_app_demo/widgets/my_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/my_text_form_field.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();
  final TextEditingController _conPassTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
              25.height,
              Text(
                'Register',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              25.height,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextFormField(
                      controller: _emailTEController,
                      hintText: 'Email',
                    ),
                    12.height,
                    MyTextFormField(
                      controller: _passTEController,
                      hintText: 'Password',
                    ),
                    12.height,
                    MyTextFormField(
                      controller: _conPassTEController,
                      hintText: 'Confirm Password',
                    ),
                  ],
                ),
              ),
              const Spacer(),
              PrimaryBtn(
                onTap: () {},
                child: const BtnText('Register'),
              ),
              12.height,
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: <WidgetSpan>[
                    WidgetSpan(
                      child: TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
                .animate(interval: 250.ms)
                .fade(duration: 200.ms)
                .scale(duration: 250.ms),
          ),
        ),
      ),
    );
  }
}
