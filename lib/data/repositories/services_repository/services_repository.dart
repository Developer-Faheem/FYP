import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/features/Vendor_side/Salon/models/services_model/services_model.dart';
import 'package:stylesage/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:stylesage/utils/exceptions/firebase_exceptions.dart';
import 'package:stylesage/utils/exceptions/firebase_plateform_exceptions.dart';

//repository class for service related related opertaions
class ServiceRepositories extends GetxController {
  static ServiceRepositories get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //functon to save the service data to the relevent salon
  Future<void> saveServiceData(
      ServiceModel service, String selectedCategory) async {
    try {
      await _db
          .collection('services')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .collection(selectedCategory)
          .add(service.toJson());
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
