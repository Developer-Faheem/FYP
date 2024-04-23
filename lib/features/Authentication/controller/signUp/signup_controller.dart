import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/features/User_side/Personalization/screens/privacy_policy/widgets/privacy_policy_item.dart';
import 'package:stylesage/utils/network_manager/network_manger.dart';
import 'package:stylesage/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///variables

  final privacyPolicy = true.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> SignUpFormKey = GlobalKey<FormState>();

  /// signup

  Future<void> signup() async {
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

      //save authenticated user data in firestore

      //show th success message
    } catch (e) {
      //some thing generic to the user
      SLoaders.errorSnackbar(
          Title: "Something went wrong!", message: e.toString());
    } finally {
      //remove the loader
      //FullScreenLoader.stopLoading();
    }
  }
}
