import 'dart:io';
import 'package:flutter/material.dart';

class MyShowDialog {
  static Future<Object?> imageShowDialog(
      BuildContext context, String imageString) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        return const SizedBox();
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1).animate(anim1),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1).animate(anim1),
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              contentPadding: const EdgeInsets.all(0),
              content: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.75,
                // width: MediaQuery.sizeOf(context).width * 0.9,
                child: InteractiveViewer(
                  maxScale: 8,
                  minScale: 0.5,
                  child: Image.file(
                    File(imageString),
                    // fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none),
            ),
          ),
        );
      },
    );
  }
}
