import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/features/Authentication/models/user_model/user_model.dart';
import 'package:stylesage/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:stylesage/utils/exceptions/firebase_exceptions.dart';
import 'package:stylesage/utils/exceptions/firebase_plateform_exceptions.dart';

//repository class for user related opertaions
class UserRepositories extends GetxController {
  static UserRepositories get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //function to save the user data to firestore

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("users").doc(user.id).set(user.toJson());
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

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection('users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
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

  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection('users')
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
          .collection('users')
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
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('users').doc(userId).delete();
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
