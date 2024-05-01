import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  ///variables
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// signup

  void signup() async {
    try {
      //start loading
      //FullScreenLoader.openScreenDialog("logging you in...", images.decor)

      //check internet connectivity
      // final isConnected = await NetworkManger.instance.isConnected();
      // if (!isConnected) {
      //   return;
      // }

      //form validation
      // if (!loginformkey.currentState!.validate()) {
      //FullScreenLoader.stopLoading();
      // }

      //save data is remeber me is selected
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      //login user with email and password
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //remove loader
      //FullScreenLoader.stopLoading();

      //redirect user
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //some thing generic to the user
      SLoaders.errorSnackbar(
          Title: "Something went wrong!", message: e.toString());
    }
  }
}
