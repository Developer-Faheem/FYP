import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/data/repositories/user/user_repositories.dart';
import 'package:stylesage/features/Authentication/controller/user_controller/user_controller.dart';
import 'package:stylesage/features/User_side/Personalization/screens/profile_main/profile_screen.dart';

class UpdateUserProfileController extends GetxController {
  static UpdateUserProfileController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final gender = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepositories());

  GlobalKey<FormState> updateUserProfile = GlobalKey<FormState>();

  ///init user data when home screen initilized
  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  fetchUserRecord() {
    name.text = userController.user.value.name;
    phoneNumber.text = userController.user.value.phoneNumber;
    gender.text = userController.user.value.gender;
  }

  Future<void> updateUserData() async {
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

      //update user name ,gender,and the phone number
      Map<String, dynamic> profileData = {
        'name': name.text.trim(),
        'gender': gender.text.trim(),
        'phoneNumber': phoneNumber.text.trim()
      };

      //send eamil to reset the password
      await userRepository.updateSingleField(profileData);

      //update the fields in the usercontroller
      userController.user.value.name = name.text.trim();
      userController.user.value.gender = gender.text.trim();
      userController.user.value.phoneNumber = phoneNumber.text.trim();

      //remove the loader
      //FullScreenLoader.stopLoading();

      //show the success message
      SLoaders.successSnackbar(
          Title: "Congratulations",
          message: "Your profile data has been updated");

      //redirect to next screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      //remove the loader
      //FullScreenLoader.stopLoading();

      //show the success message
      SLoaders.successSnackbar(
          Title: "Profile data not updated",
          message: "Your profile data has not been updated");
    }
  }
}
