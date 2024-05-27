import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/package_repository/package_repository.dart';
import 'package:stylesage/features/Vendor_side/Salon/models/package_model/package_model.dart';

class PackageController2 extends GetxController {
  static PackageController2 get instance => Get.find();
  final String vendorId;
  final pacakageRepository = Get.put(PackageRepositories());
  final RxList<PackageModel> packages = <PackageModel>[].obs;

  PackageController2(this.vendorId);

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPacakges();
  }

  void fetchPacakges() async {
    try {
      //start the loader
      isLoading.value = true;

      //fetch the categories
      final salonsList = await pacakageRepository.fetchAllPackages(vendorId);

      //update the category list
      packages.assignAll(salonsList);
    } catch (e) {
      SLoaders.errorSnackbar(
          Title: 'oh Sanp!',
          message: "something went wrong while fetching the Packages data");
    } finally {
      isLoading.value = false;
    }
  }
}
