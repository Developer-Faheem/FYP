//these repository contains the backend related data like fetch data etc

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stylesage/features/Onboarding/screens/Choice/choice.dart';
import 'package:stylesage/features/Onboarding/screens/onboarding/onboarding_screen.dart';
import 'package:stylesage/features/Onboarding/screens/splash/splash_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variables
  final deviceStorage = GetStorage();

  ///called from main.dart when the app is launched like init
  @override
  void onReady() {
    screenRedirect();
  }

  ///function to show the relevand screen after checking the user
  screenRedirect() async {
    deviceStorage.writeIfNull("isFirstTime", true);
    print(deviceStorage.read("isFirstTime"));
    deviceStorage.read("isFirstTime") != true
        ? Get.offAll(() => const Choice())
        : Get.offAll(() => const SplashScreen());
  }
}
