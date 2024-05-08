import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/features/Authentication/screens/forgotPassword/emailsent.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  ///variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      //start loading
      //FullScreenLoader.openScreenDialog("Processing your request...", images.decor)

      //check internet connectivity
      // final isConnected = await NetworkManger.instance.isConnected();
      // if (!isConnected) {
      // FullScreenLoader.stopLoading();
      //   return;
      // }

      //form validation
      // if (!forgotPasswordFormKey.currentState!.validate()) {
      // FullScreenLoader.stopLoading();
      // }

      //send eamil to reset the password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      //remove the loader
      //FullScreenLoader.stopLoading();

      //show the success message
      SLoaders.successSnackbar(
          Title: "Email Sent",
          message: "Email link sent to Reset your Password");

      //redirect to next screen
      Get.to(() => ForgotPasswordEmailsent(
            email: email.text.trim(),
          ));
    } catch (e) {
      //remove the loader
      //FullScreenLoader.stopLoading();

      //some thing generic to the user
      SLoaders.errorSnackbar(
          Title: "Something went wrong!", message: e.toString());
    }
  }

  reSendPasswordResetEmail(String email) async {
    try {
      //start loading
      //FullScreenLoader.openScreenDialog("Processing your request...", images.decor)

      //check internet connectivity
      // final isConnected = await NetworkManger.instance.isConnected();
      // if (!isConnected) {
      // FullScreenLoader.stopLoading();
      //   return;
      // }

      //send eamil to reset the password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //remove the loader
      //FullScreenLoader.stopLoading();

      //show the success message
      SLoaders.successSnackbar(
          Title: "Email Sent",
          message: "Email link sent to Reset your Password");
    } catch (e) {
      //remove the loader
      //FullScreenLoader.stopLoading();

      //some thing generic to the user
      SLoaders.errorSnackbar(
          Title: "Something went wrong!", message: e.toString());
    }
  }
}
