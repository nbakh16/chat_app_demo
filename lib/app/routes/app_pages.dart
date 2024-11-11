import 'package:chat_app_demo/app/modules/auth/bindings/auth_binding.dart';
import 'package:chat_app_demo/app/modules/auth/view/auth_view.dart';
import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/image/bindings/image_binding.dart';
import '../modules/image/views/image_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE,
      page: () => const ImageView(),
      binding: ImageBinding(),
    ),
  ];
}
