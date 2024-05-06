import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/user/user_repositories.dart';
import 'package:stylesage/features/Authentication/models/user_model/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepositories());

  ///save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        //mapping the data
        final user = UserModel(
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName ?? '',
          email: userCredential.user!.email ?? '',
          phoneNumber: "",
          gender: "",
          profilePicture: "",
        );
        //save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      SLoaders.warningSnackbar(
          Title: 'Data not saved',
          message:
              "Something went wrong while saving your information. You can re-save your data in your profile");
    }
  }
}
