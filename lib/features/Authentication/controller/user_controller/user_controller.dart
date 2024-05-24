import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/data/repositories/user/user_repositories.dart';
import 'package:stylesage/features/Authentication/models/user_model/user_model.dart';
import 'package:stylesage/features/Authentication/screens/login/login_screen.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepositories());
  final storage = GetStorage();
  final profileLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  ///save user record from any registration provider
  Future<void> saveUserRecord() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    //refresh user record
    //  await fetchUserRecord();

    try {
      //   if (user.value.id.isEmpty) {
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
        // }
      }
    } catch (e) {
      SLoaders.warningSnackbar(
          Title: 'Data not saved',
          message:
              "Something went wrong while saving your information. You can re-save your data in your profile");
    }
  }

  //delete user account
  void deleteUserAccount() async {
    try {
      //loading

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          await auth.deleteAccount();
          Get.off(() => const LoginScreen());
        }
      }
    } catch (e) {
      SLoaders.warningSnackbar(
          Title: 'Account not deleted', message: e.toString());
    }
  }

  //upload profile picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxWidth: 512,
          maxHeight: 512);

      if (image != null) {
        //upload image
        final imageUrl =
            await userRepository.uploadImage('users/images/profile/', image);

        //update user image record
        Map<String, dynamic> json = {'profilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl as String;

        SLoaders.successSnackbar(
            Title: 'Congratulation',
            message: "The profile image has been updated");
      }
    } catch (e) {
      // print(e);
      SLoaders.warningSnackbar(
          Title: 'operation unsuccessful', message: "something went wrong");
    }
  }
}
