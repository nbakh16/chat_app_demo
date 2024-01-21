import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../data/config/theme/color.dart';
import '../../../data/config/theme/style.dart';
import '../controllers/image_controller.dart';

class ImageView extends GetView<ImageController> {
  const ImageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: controller.toggleShowAppbar,
        onDoubleTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Hero(
                tag: controller.image,
                child: Center(
                  child: InteractiveViewer(
                    maxScale: 8,
                    minScale: 0.5,
                    child: Image.file(
                      File(controller.image),
                      fit: BoxFit.fitWidth,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              GetBuilder<ImageController>(builder: (controller) {
                return Visibility(
                  visible: controller.showAppbar,
                  replacement: const SizedBox(),
                  child: ColoredBox(
                    color: Colors.black38,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'User Name',
                              style: kTitleLarge.copyWith(color: kWhite),
                            ),
                            Text(
                              'Yesterday, 10:10 AM',
                              style: kBodyLarge.copyWith(color: kWhite),
                            ),
                          ],
                        )
                      ],
                    ),
                  ).animate().fade(duration: 600.ms),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
