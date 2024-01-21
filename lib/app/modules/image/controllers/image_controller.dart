import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController
    with GetSingleTickerProviderStateMixin {
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
  late AnimationController animationController;
  Animation<Matrix4>? animation;

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
    // transformationController.value = value;
    animation =
        Matrix4Tween(begin: transformationController.value, end: value).animate(
      CurveTween(curve: Curves.easeOut).animate(animationController),
    );

    animationController.forward(from: 0);
  }

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        transformationController.value = animation!.value;
      });
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    transformationController.dispose();
    super.onClose();
  }
}
