import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:stylesage/utils/exceptions/firebase_exceptions.dart';
import 'package:stylesage/utils/exceptions/firebase_plateform_exceptions.dart';

//repository class for service related related opertaions
class GalleryRepositories extends GetxController {
  static GalleryRepositories get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

//upload image in storage
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).meassage;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again!";
    }
  }

  //save the data link in the firestsore
  Future<void> saveGalleryImageData(String imageURL) async {
    try {
      final String userId =
          AuthenticationRepository.instance.authUser?.uid ?? '';

      final DocumentReference userDocRef =
          _db.collection('gallery').doc(userId);
      final DocumentSnapshot userDocSnapshot = await userDocRef.get();

      // Use a batch write to reduce Firestore reads and writes
      WriteBatch batch = _db.batch();

      if (userDocSnapshot.exists) {
        // If the document exists, update the galleryImages array
        batch.update(userDocRef, {
          'galleryImages': FieldValue.arrayUnion([imageURL])
        });
      } else {
        // If the document does not exist, create it with the galleryImages array
        batch.set(userDocRef, {
          'id': userId,
          'galleryImages': [imageURL]
        });
      }

      // Commit the batch write
      await batch.commit();
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).meassage;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again!";
    }
  }
}
