import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get to => Get.find();

  final String image = Get.arguments;

  bool showAppbar = true;
  void toggleShowAppbar() {
    showAppbar = !showAppbar;
    update();
  }

  ///double tap zoom
  TransformationController transformationController =
      TransformationController();
  TapDownDetails? tapDownDetails;

  void doubleTapZoom() {
    final position = tapDownDetails!.localPosition;
    const double scale = 3;
    final posX = -position.dx * (scale - 1);
    final posY = -position.dy * (scale - 1);

    final zoomed = Matrix4.identity()
      ..translate(posX, posY)
      ..scale(scale);
    final value = transformationController.value.isIdentity()
        ? zoomed
        : Matrix4.identity();
    transformationController.value = value;
  }
}
