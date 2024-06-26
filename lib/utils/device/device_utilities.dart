import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SDeviceUtils {
  static Future<void> launch(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  // static void hideKeyboard(BuildContext context) {
  //   FocusScope.of(context).requestFocus(FocusNode());
  // }

  // static Future<void> setStatusBarColor(Color color) async {
  //   SystemChrome.setSystemUIOverlayStyle(
  //       SystemUiOverlayStyle(statusBarColor: color));
  // }

  // static bool isLandScapeOrientation(BuildContext context) {
  //   final viewInsets = View.of(context).viewInsets;
  //   return viewInsets.bottom == 0;
  // }

  // static bool isPotraitOrientation(BuildContext context) {
  //   final viewInsets = View.of(context).viewInsets;
  //   return viewInsets.bottom != 0;
  // }

  // static void setFullScreen(bool enable) {
  //   SystemChrome.setEnabledSystemUIMode(
  //       enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  // }

  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  // static double getPixelRatio() {
  //   return MediaQuery.of(Get.context!).devicePixelRatio;
  // }

  // static getStatusBarHeight() {
  //   return MediaQuery.of(Get.context!).padding.top;
  // }

  // static double getBottomNavigationBarHeight() {
  //   return 12; //certain height
  // }

  // static double getAppBarHeight() {
  //   return 12; //certain height
  // }

  // static double getKeyboardHeight() {
  //   final viewInsets = MediaQuery.of(Get.context!).viewInsets;
  //   return viewInsets.bottom; //certain height
  // }

  // static bool isKeyboardVisible() {
  //   final viewInsets = MediaQuery.of(Get.context!).viewInsets;
  //   return viewInsets.bottom > 0; //certain height
  // }

  // static Future<bool> isPhysicalDevice() async {
  //   return defaultTargetPlatform == TargetPlatform.android ||
  //       defaultTargetPlatform == TargetPlatform.iOS;
  // }

  // static void vibrate(Duration duration) {
  //   HapticFeedback.vibrate();
  //   Future.delayed(duration, () => HapticFeedback.vibrate());
  // }

  // static Future<void> setPreferredOrientation(
  //     List<DeviceOrientation> orientation) async {
  //   await SystemChrome.setPreferredOrientations(orientation);
  // }

  // static void hideStatusBar() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  // }

  // static void showStatusBar() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: SystemUiOverlay.values);
  // }

  // static Future<bool> hasInternetConnection() async {
  //   try {
  //     final result = await InternetAddress.lookup('example.com');
  //     return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  //   } on SocketException catch (_) {
  //     return false;
  //   }
  // }

  // static bool isIos() {
  //   return Platform.isIOS;
  // }

  // static bool isAndroid() {
  //   return Platform.isIOS;
  // }
}
