import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/features/Authentication/models/user_model/user_model.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';
import 'package:stylesage/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:stylesage/utils/exceptions/firebase_exceptions.dart';
import 'package:stylesage/utils/exceptions/firebase_plateform_exceptions.dart';

//repository class for user related opertaions
class VendorRepositories extends GetxController {
  static VendorRepositories get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<VendorModel>> getFavoriteProducts(List<String> vendorIds) async {
    try {
      final snapshot = await _db
          .collection('vendors')
          .where(FieldPath.documentId, whereIn: vendorIds)
          .get();
      return snapshot.docs
          .map((querySnapshot) => VendorModel.fromSnapshot(querySnapshot))
          .toList();
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

  //function to save the user data to firestore

  Future<void> saveVendorRecord(VendorModel user) async {
    try {
      await _db.collection("vendors").doc(user.id).set(user.toJson());
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

  //function to fetch user details based on uid

  Future<VendorModel> fetchVendorDetails() async {
    try {
      final documentSnapshot = await _db
          .collection('vendors')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return VendorModel.fromSnapshot(documentSnapshot);
      } else {
        return VendorModel.empty();
      }
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

  //update the user data

  Future<void> updateUserDetails(VendorModel updatedUser) async {
    try {
      await _db
          .collection('vendors')
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
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

  //update any single field in a specific collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection('vendors')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
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

  //function to remove the data from firestore
  // Method to delete the image from Firebase Storage
  Future<void> deleteImageFromStorage(String? imageUrl) async {
    if (imageUrl != null) {
      final storageRef = FirebaseStorage.instance.refFromURL(imageUrl);
      await storageRef.delete();
    }
  }

// Updated removeUserRecord method
  Future<void> removeUserRecord(String userId) async {
    try {
      // Get the profile picture URL before deleting the document
      // final userSnapshot = await _db.collection('users').doc(userId).get();
      // final profilePictureUrl = userSnapshot.get('profilePicture') as String?;

      // Delete the Firestore document
      await _db.collection('vendors').doc(userId).delete();

      // Delete the image from Firebase Storage
      //   await deleteImageFromStorage(profilePictureUrl);
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

  //upload image
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
}
