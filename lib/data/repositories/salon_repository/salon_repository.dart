import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';
import 'package:stylesage/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:stylesage/utils/exceptions/firebase_exceptions.dart';
import 'package:stylesage/utils/exceptions/firebase_plateform_exceptions.dart';

//repository class for service related related opertaions
class SalonRepositories extends GetxController {
  static SalonRepositories get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //save the data link in the firestsore
  Future<List<VendorModel>> fetchAllSalons() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _db.collection('vendors').get();
      List<VendorModel> vendorList =
          snapshot.docs.map((doc) => VendorModel.fromSnapshot(doc)).toList();
      return vendorList;
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
