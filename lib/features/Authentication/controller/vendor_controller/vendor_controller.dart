import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/data/repositories/vendor_repository/vendor_repositories.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';
import 'package:stylesage/features/Authentication/screens/login/login_screen.dart';

class VendorController extends GetxController {
  static VendorController get instance => Get.find();

  Rx<VendorModel> vendor = VendorModel.empty().obs;
  final vendorRepository = Get.put(VendorRepositories());
  final storage = GetStorage();
  final profileLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchVendorRecord();
  }

  Future<void> fetchVendorRecord() async {
    try {
      profileLoading.value = true;
      final vendor = await vendorRepository.fetchVendorDetails();
      this.vendor(vendor);
    } catch (e) {
      vendor(VendorModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  ///save vendor record from any registration provider
  Future<void> saveVendorRecord() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    try {
      if (currentUser != null) {
        final name = await storage.read('name');

        //mapping the data
        final vendor = VendorModel(
            id: currentUser.uid,
            salonName: '',
            userName: currentUser.displayName ?? name,
            email: currentUser.email ?? '',
            jazzcashNumber: '',
            easypaisaNumber: '',
            tagline: '',
            phoneNumber: '',
            city: '',
            aboutSection: '',
            followers: 0,
            address: '',
            profilePicture: '',
            mapLocation: '',
            ratings: 0.0);

        //save user data
        await vendorRepository.saveVendorRecord(vendor);
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
        final imageUrl = await vendorRepository.uploadImage(
            'users/images/vendorProfile/', image);

        //update user image record
        Map<String, dynamic> json = {'profilePicture': imageUrl};
        await vendorRepository.updateSingleField(json);

        //      vendor.value.profilePicture = imageUrl as String;    change need to be done

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
