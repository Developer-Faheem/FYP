import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';

class SalonController extends GetxController {
  static SalonController get instance => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<VendorModel> vendors = <VendorModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchVendors();
  }

  void fetchVendors() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('vendors').get();
      List<VendorModel> vendorList =
          snapshot.docs.map((doc) => VendorModel.fromSnapshot(doc)).toList();
      vendors.assignAll(vendorList);
    } catch (e) {
      print("Error fetching vendors: $e");
    }
  }
}
