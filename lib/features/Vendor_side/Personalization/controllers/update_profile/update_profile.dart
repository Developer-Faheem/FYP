import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/vendor_repository/vendor_repositories.dart';
import 'package:stylesage/features/Authentication/controller/vendor_controller/vendor_controller.dart';
import 'package:stylesage/features/Vendor_side/Personalization/screens/profile_main/vendor_profile_screen.dart';
import 'package:stylesage/vendor_nav_menu.dart';

class UpdateVendorProfileController extends GetxController {
  static UpdateVendorProfileController get instance => Get.find();

  final saloonName = TextEditingController();
  final userName = TextEditingController();
  final salonAddress = TextEditingController();
  final googleAddressLink = TextEditingController();
  final jazzcashNumber = TextEditingController();
  final easypaisaNumber = TextEditingController();
  final salonTagline = TextEditingController();
  final phoneNumber = TextEditingController();
  final city = TextEditingController();
  final about = TextEditingController();

  final vendorController = VendorController.instance;
  final vendorRepository = Get.put(VendorRepositories());

  GlobalKey<FormState> updateVendorProfile = GlobalKey<FormState>();

  ///init user data when home screen initilized
  @override
  void onInit() {
    fetchVendorRecord();
    super.onInit();
  }

  fetchVendorRecord() {
    saloonName.text = vendorController.vendor.value.salonName;
    userName.text = vendorController.vendor.value.userName;
    salonAddress.text = vendorController.vendor.value.address;
    googleAddressLink.text = vendorController.vendor.value.mapLocation;
    jazzcashNumber.text = vendorController.vendor.value.jazzcashNumber;
    easypaisaNumber.text = vendorController.vendor.value.easypaisaNumber;
    salonTagline.text = vendorController.vendor.value.tagline;
    phoneNumber.text = vendorController.vendor.value.phoneNumber;
    city.text = vendorController.vendor.value.city;
    about.text = vendorController.vendor.value.aboutSection;
  }

  Future<void> updateVendorData() async {
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
        'salonName': saloonName.text.trim(),
        'userName': userName.text.trim(),
        'jazzcashNumber': jazzcashNumber.text.trim(),
        'easypaisaNumber': easypaisaNumber.text.trim(),
        'tagline': salonTagline.text.trim(),
        'phoneNumber': phoneNumber.text.trim(),
        'city': city.text.trim(),
        'aboutSection': about.text.trim(),
        'address': salonAddress.text.trim(),
        'mapLocation': googleAddressLink.text.trim(),
        // 'followers': followers,
        // 'followersList': followersList,
        //'email': email,
        //'ratings': ratings,
      };

      //send eamil to reset the password
      await vendorRepository.updateSingleField(profileData);

      //update the fields in the usercontroller

      vendorController.vendor.value.salonName = saloonName.text.trim();
      vendorController.vendor.value.userName = userName.text.trim();
      vendorController.vendor.value.address = salonAddress.text.trim();
      vendorController.vendor.value.mapLocation = googleAddressLink.text.trim();
      vendorController.vendor.value.jazzcashNumber = jazzcashNumber.text.trim();
      vendorController.vendor.value.easypaisaNumber =
          easypaisaNumber.text.trim();
      vendorController.vendor.value.tagline = salonTagline.text.trim();
      vendorController.vendor.value.phoneNumber = phoneNumber.text.trim();
      vendorController.vendor.value.city = city.text.trim();
      vendorController.vendor.value.aboutSection = about.text.trim();

      //remove the loader
      //FullScreenLoader.stopLoading();

      //show the success message
      SLoaders.successSnackbar(
          Title: "Congratulations",
          message: "Your profile data has been updated");

      //redirect to next screen
      // Get.back();
      //final vendorMenuController = Get.put(VendorNavigationController());
      // Get.off(() => const VendorProfileScreen());
      // vendorMenuController.updateIndex(0);
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
