import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/data/repositories/user/user_repositories.dart';
import 'package:stylesage/features/Authentication/models/user_model/user_model.dart';
import 'package:stylesage/features/Authentication/screens/verification/verification_screen.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///variables

  final privacyPolicy = true.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> SignUpFormKey = GlobalKey<FormState>();

  /// signup

  void signup() async {
    try {
      //start loading
      //FullScreenLoader.openScreenDialog("We are processing your information...", images.decor)
      //check internet connectivity
      // final isConnected = await NetworkManger.instance.isConnected();

      // if (!isConnected) {
      //   return;
      // }

      //form validation
      // if (SignUpFormKey.currentState!.validate()) {
      //   return;
      // }

      //privacy policy check
      if (!privacyPolicy.value) {
        SLoaders.warningSnackbar(
            Title: "Accept privacy policy",
            message:
                "In order to create account, must have to read and accept Privacy Policy and Terms of Use");
        return;
      }

      //register user in firebase auth & and store data in firestore
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save authenticated user data in firestore

      final newUser = UserModel(
        id: userCredential.user!.uid,
        name: name.text.trim(),
        email: email.text.trim(),
        phoneNumber: "",
        gender: "",
        profilePicture: "",
      );

      final userRepository = Get.put(UserRepositories());

      await userRepository.saveUserRecord(newUser);

      //stop loading

      //show the success message
      SLoaders.successSnackbar(
          Title: "Congratulations", message: "Your account has been created!");

      //move to verify email
      Get.to(() => VerificationScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      //some thing generic to the user
      SLoaders.errorSnackbar(
          Title: "Something went wrong!", message: e.toString());
    }
  }
}
