import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/vendor_repository/vendor_repositories.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';

class VendorController extends GetxController {
  static VendorController get instance => Get.find();

  final vendorRepository = Get.put(VendorRepositories());
  final storage = GetStorage();

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
        );

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
}
