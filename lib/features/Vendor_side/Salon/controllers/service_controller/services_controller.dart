import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/services_repository/services_repository.dart';
import 'package:stylesage/features/Vendor_side/Salon/models/services_model/services_model.dart';

class ServiceController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // TextEditingControllers
  final TextEditingController serviceNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final serviceRepository = Get.put(ServiceRepositories());

  // Dropdown state
  final RxString selectedCategory = 'Hair Care'.obs;
  final List<String> categories = [
    'Hair Care',
    'Nail Care',
    'Skin Care',
    'Beauty Services',
    'Body Treatment',
    'Mens Grooming',
    'Other Services'
  ];

  ///save service record
  Future<void> saveServiceRecord() async {
    try {
      //mapping the data
      final ServiceModel service = ServiceModel(
          serviceName: serviceNameController.text.trim(),
          servicePrice: double.tryParse(priceController.text) ?? 0);

      //save service data
      await serviceRepository.saveServiceData(
          service, selectedCategory.value.toString());

      //success message
      SLoaders.successSnackbar(
          Title: 'Congratulation',
          message: "Service data has been successfully added.");
    } catch (e) {
      SLoaders.warningSnackbar(
          Title: 'service not added',
          message: "Something went wrong while adding the service data.");
    }
  }

  @override
  void onClose() {
    serviceNameController.dispose();
    priceController.dispose();
    super.onClose();
  }
}
