import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/user/user_repositories.dart';
import 'package:stylesage/features/Authentication/models/user_model/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepositories());
  final storage = GetStorage();

  ///save user record from any registration provider
  Future<void> saveUserRecord() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    try {
      if (currentUser != null) {
        final name = await storage.read('name');

        //mapping the data
        final user = UserModel(
          id: currentUser.uid,
          name: currentUser.displayName ?? name,
          email: currentUser.email ?? '',
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
