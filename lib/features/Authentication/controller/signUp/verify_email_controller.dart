import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  ///send eamil when the verification screen is open & set timer to auto redirect
  @override
  void onInit() {
    sendEmailVerification();
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

  //manually check if eamil verified
}
