import 'package:get/get.dart';
import 'package:stylesage/data/repositories/vendor_repository/vendor_repositories.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';

class SalonSearchController extends GetxController {
  var isLoading = false.obs;
  var searchResults = <VendorModel>[].obs;
  var isSearching = false.obs;
  final vendorRepopository = Get.put(VendorRepositories());

  void searchSalons(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      isSearching(false);
      return;
    }

    isLoading(true);
    isSearching(true);

    try {
      query = query.toLowerCase();
      var salonsList = await vendorRepopository.fetchAndFilterSalons(query);
      searchResults.value = salonsList;
    } finally {
      isLoading(false);
    }
  }
}
