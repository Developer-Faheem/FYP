import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/gallery_repository/gallery_repository.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';

class GalleryImageController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;
  final galleyRepository = Get.put(GalleryRepositories());

  RxBool isImageUploading = false.obs;

  // Future<void> pickImage() async {
  //   final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     isImageUploading.value = true;
  //     try {
  //       await uploadImage(File(pickedImage.path));
  //     } catch (e) {
  //       print("Error uploading image: $e");
  //     }
  //   }
  // }

  // Future<void> uploadImage(File file) async {
  //   final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   final firebase_storage.Reference ref =
  //       _storage.ref().child('gallery').child(AuthenticationRepository.instance.authUser!.uid).child(fileName);

  //   await ref.putFile(file);

  //   // Get the download URL
  //   final String downloadURL = await ref.getDownloadURL();

  //   // Here you can save the downloadURL to Firestore
  //   print("Image uploaded successfully. URL: $downloadURL");

  //   isImageUploading.value = false;
  // }

  uploadGalleryImage() async {
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
