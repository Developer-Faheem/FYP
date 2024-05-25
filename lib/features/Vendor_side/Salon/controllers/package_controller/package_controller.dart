import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/package_repository/package_repository.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/features/Vendor_side/Salon/models/package_model/package_model.dart';

class PackageController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // TextEditingControllers
  final TextEditingController packageNameController = TextEditingController();
  final TextEditingController packagePriceController = TextEditingController();
  final TextEditingController packageServicesController =
      TextEditingController();

  final packageRepository = Get.put(PackageRepositories());

  // Variable to hold the image URL
  String? imageUrl;

  // Upload the package image and get the link
  Future<void> uploadPackageImage() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxWidth: 512,
          maxHeight: 512);

      if (image != null) {
        // Upload image and get the URL
        imageUrl = await packageRepository.uploadImage(
            'vendors/images/servicesImages/', image);

        // SLoaders.successSnackbar(
        //     Title: 'Congratulation',
        //     message: "The image has been successfully added to gallery");
      }
    } catch (e) {
      SLoaders.warningSnackbar(
          Title: 'Operation unsuccessful', message: "Something went wrong");
    }
  }

  // Save package record
  Future<void> savePackageRecord() async {
    if (packageNameController.text.isEmpty ||
        packageServicesController.text.isEmpty ||
        packagePriceController.text.isEmpty ||
        imageUrl == null) {
      SLoaders.warningSnackbar(
          Title: 'Incomplete Information',
          message:
              "Please ensure all fields are filled and an image is uploaded.");
      return;
    }

    try {
      // Mapping the data
      final PackageModel packageData = PackageModel(
          id: AuthenticationRepository.instance.authUser?.uid ?? '',
          packageName: packageNameController.text.trim(),
          packageImage: imageUrl ?? '',
          packageServices: packageServicesController.text.trim(),
          packagePrice: double.tryParse(packagePriceController.text) ?? 0);

      // Save package data
      await packageRepository.savePackageData(packageData);

      // Success message
      SLoaders.successSnackbar(
          Title: 'Congratulation',
          message: "Package has been successfully added.");
    } catch (e) {
      SLoaders.warningSnackbar(
          Title: 'Package not added',
          message: "Something went wrong while adding the package data.");
    }
  }

  @override
  void onClose() {
    packageNameController.dispose();
    packagePriceController.dispose();
    packageServicesController.dispose();
    super.onClose();
  }
}
