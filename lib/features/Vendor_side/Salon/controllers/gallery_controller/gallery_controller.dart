import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/gallery_repository/gallery_repository.dart';

class GalleryImageController extends GetxController {
  final galleyRepository = Get.put(GalleryRepositories());

  RxBool isImageUploading = false.obs;

  Future<void> uploadGalleryImage() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxWidth: 512,
          maxHeight: 512);

      if (image != null) {
        isImageUploading.value = true;
        //upload image
        final imageUrl = await galleyRepository.uploadImage(
            'vendors/images/gallery/', image);

        //add the image address in firestore
        await galleyRepository.saveGalleryImageData(imageUrl);

        SLoaders.successSnackbar(
            Title: 'Congratulation',
            message: "The image has been successfully added to gallery");
        isImageUploading.value = false;
      }
    } catch (e) {
      // print(e);
      SLoaders.warningSnackbar(
          Title: 'operation unsuccessful', message: "something went wrong");
      isImageUploading.value = false;
    }
  }
}
