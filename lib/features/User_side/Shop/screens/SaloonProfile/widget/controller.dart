import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DropDownController extends GetxController {
  static DropDownController get instance => Get.find();

  final String vendorId;
  var selectedItems1 = <dynamic>[].obs;
  var selectedItems2 = <dynamic>[].obs;
  var selectedItems3 = <dynamic>[].obs;
  var selectedItems4 = <dynamic>[].obs;
  var selectedItems5 = <dynamic>[].obs;
  var selectedItems6 = <dynamic>[].obs;
  var selectedItems7 = <dynamic>[].obs;

  var hairServices = <Map<String, String>>[].obs;
  var nailServices = <Map<String, String>>[].obs;
  var beautyServices = <Map<String, String>>[].obs;
  var bodyServices = <Map<String, String>>[].obs;
  var mensServices = <Map<String, String>>[].obs;
  var otherServices = <Map<String, String>>[].obs;
  var skinServices = <Map<String, String>>[].obs;

  DropDownController(this.vendorId);

  @override
  void onInit() {
    super.onInit();
    // Fetch data asynchronously and wait for it to complete
    fetchServices('Hair Care', hairServices);
    fetchServices('Nail Care', nailServices);
    fetchServices('Skin Care', skinServices);
    fetchServices('Beauty Services', beautyServices);
    fetchServices('Body Treatment', bodyServices);
    fetchServices('Mens Grooming', mensServices);
    fetchServices('Other Services', otherServices);
  }

  Future<void> fetchServices(
      String category, RxList<Map<String, String>> servicesList) async {
    try {
      var servicesSnapshot = await FirebaseFirestore.instance
          .collection('services')
          .doc(vendorId)
          .collection(category)
          .get();

      // print('Fetched $category services snapshot:');
      // print(servicesSnapshot.docs);

      servicesList.clear();
      for (var doc in servicesSnapshot.docs) {
        servicesList.add({
          'id': doc.id,
          'label': '${doc['serviceName']} - Rs.${doc['servicePrice']}',
        });
        //   print('Fetched service: ${doc.id}, ${doc['serviceName']}');
      }
    } catch (e) {
      print('Error fetching $category services: $e');
    }
  }
}
