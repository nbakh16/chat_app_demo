import 'package:chat_app_demo/core/config/routes.dart';
import 'package:chat_app_demo/core/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) {
          return MaterialApp.router(
            title: 'Chit Chat',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.defaultTheme,
            // darkTheme: AppTheme.darkTheme,
            routerConfig: appRoutes,
          );
        });
  }
}
