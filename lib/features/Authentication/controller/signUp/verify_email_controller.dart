import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  ///send eamil when the verification screen is open & set timer to auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      SLoaders.successSnackbar(
          Title: "Email Sent",
          message: "Please check you inbox and verify your email.");
    } catch (e) {
      SLoaders.errorSnackbar(Title: "Error", message: e.toString());
    }
  }

  //timer to automatically redirect to eamil verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        AuthenticationRepository.instance.screenRedirect();
      }
    });
  }

  //manually check if eamil verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      // Get.off(()=>UserNavigationMenu());
      AuthenticationRepository.instance.screenRedirect();
    }
  }
}
