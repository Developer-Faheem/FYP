import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/salon_repository/salon_repository.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';

class SalonController extends GetxController {
  static SalonController get instance => Get.find();

  final salonRepository = Get.put(SalonRepositories());
  final RxList<VendorModel> vendors = <VendorModel>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSalons();
  }

  void fetchSalons() async {
    try {
      //start the loader
      isLoading.value = true;

      //fetch the categories
      final salonsList = await salonRepository.fetchAllSalons();

      //update the category list
      vendors.assignAll(salonsList);
    } catch (e) {
      SLoaders.errorSnackbar(
          Title: 'oh Sanp!',
          message: "something went wrong while fetching the salon data");
    } finally {
      isLoading.value = false;
    }
  }
}
