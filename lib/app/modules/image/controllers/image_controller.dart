import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get to => Get.find();

  final String image = Get.arguments;

  bool showAppbar = true;
  void toggleShowAppbar() {
    showAppbar = !showAppbar;
    update();
  }
}
