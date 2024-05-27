import 'dart:convert';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/vendor_repository/vendor_repositories.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';
import 'package:stylesage/utils/local%20storage/storage_utility.dart';

class FaviouritiesController extends GetxController {
  static FaviouritiesController get instance => Get.find();

//variables
  final favourities = <String, bool>{}.obs;
  final vendorRepository = Get.put(VendorRepositories());

  @override
  void onInit() {
    super.onInit();
    initFavourities();
  }

  //method to initilize the faviouruteis by reading from storage
  void initFavourities() {
    final json = SlocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavourities = jsonDecode(json) as Map<String, dynamic>;
      favourities.assignAll(
          storedFavourities.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourities[productId] ?? false;
  }

  void toggleFaviouriteSalon(String salonId) {
    if (!favourities.containsKey(salonId)) {
      favourities[salonId] = true;
      saveFavouritesToStrorage();
      SLoaders.successSnackbar(Title: 'salon has been added to favorites');
    } else {
      SlocalStorage.instance().removeData(salonId);
      favourities.remove(salonId);
      saveFavouritesToStrorage();
      favourities.refresh();
      SLoaders.successSnackbar(Title: 'salon has been removed from favorites');
    }
  }

  void saveFavouritesToStrorage() {
    final encodedFavourites = json.encode(favourities);
    SlocalStorage.instance().savedata('favorites', encodedFavourites);
  }

  Future<List<VendorModel>> favoriteSalons() async {
    return await vendorRepository
        .getFavoriteProducts(favourities.keys.toList());
  }
}
