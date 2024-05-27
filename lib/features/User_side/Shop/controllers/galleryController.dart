import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/gallery_repository/gallery_repository.dart';

class GalleryController extends GetxController {
  static GalleryController get instance => Get.find();
  final String vendorId;
  final galleryRepository = Get.put(GalleryRepositories());

  final RxList<String> images = <String>[].obs;

  GalleryController(this.vendorId);

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchGalleryImages();
  }

  void fetchGalleryImages() async {
    try {
      //start the loader
      isLoading.value = true;

      //fetch the categories
      final imagesList = await galleryRepository.getGalleryImages(vendorId);

      //update the images list
      images.assignAll(imagesList);
    } catch (e) {
      SLoaders.errorSnackbar(
          Title: 'oh Sanp!',
          message:
              "something went wrong while fetching the Gallery images data");
    } finally {
      isLoading.value = false;
    }
  }
}
