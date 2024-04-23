import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/utils/constants/colors.dart';

class SLoaders {
  static successSnackbar({required Title, message = '', duration = 3}) {
    Get.snackbar(Title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: SColors.primary,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(10),
        icon: Icon(
          Icons.check,
          color: SColors.tertiary,
        ));
  }

  static warningSnackbar({required Title, message = '', duration = 3}) {
    Get.snackbar(Title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: SColors.primary, //usually use orange
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.warning_amber_outlined,
          color: Colors.white,
        ));
  }

  static errorSnackbar({required Title, message = '', duration = 3}) {
    Get.snackbar(Title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade600, //usually use orange
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.warning_amber_outlined,
          color: Colors.white,
        ));
  }
}
