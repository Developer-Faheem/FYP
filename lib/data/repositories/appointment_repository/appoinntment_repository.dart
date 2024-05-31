import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/features/User_side/Shop/models/appointment.dart';
import 'package:stylesage/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:stylesage/utils/exceptions/firebase_exceptions.dart';
import 'package:stylesage/utils/exceptions/firebase_plateform_exceptions.dart';

//repository class for service related related opertaions
class AppointmentRepositories extends GetxController {
  static AppointmentRepositories get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveAppointmentRecord(AppointmentModel appointmentModel) async {
    try {
      final String userId =
          AuthenticationRepository.instance.authUser?.uid ?? '';

      await _db
          .collection("appointment")
          .doc(userId)
          .set(appointmentModel.toJson());
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

  Future<List<AppointmentModel>> fetchAllAppointments() async {
    try {
      final String userId =
          AuthenticationRepository.instance.authUser?.uid ?? '';
      // Perform the query with filters
      QuerySnapshot<Map<String, dynamic>> snapshot = await _db
          .collection('appointment')
          .where('userId', isEqualTo: userId)
          .where('userSideStatus', isEqualTo: 'upcoming')
          .get();

      print('-------------------------');
      print(snapshot);

      // Convert the documents to a list of AppointmentModel
      List<AppointmentModel> appointmentList = snapshot.docs
          .map((doc) => AppointmentModel.fromSnapshot(doc))
          .toList();

      return appointmentList;
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

  Future<List<AppointmentModel>> fetchCancelled() async {
    try {
      final String userId =
          AuthenticationRepository.instance.authUser?.uid ?? '';
      // Perform the query with filters
      QuerySnapshot<Map<String, dynamic>> snapshot = await _db
          .collection('appointment')
          .where('userId', isEqualTo: userId)
          .where('userSideStatus', isEqualTo: 'cancel')
          .get();

      print('-------------------------');
      print(snapshot);

      // Convert the documents to a list of AppointmentModel
      List<AppointmentModel> appointmentList = snapshot.docs
          .map((doc) => AppointmentModel.fromSnapshot(doc))
          .toList();

      return appointmentList;
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

  Future<List<AppointmentModel>> fetchCompleted1() async {
    try {
      final String userId =
          AuthenticationRepository.instance.authUser?.uid ?? '';
      // Perform the query with filters
      QuerySnapshot<Map<String, dynamic>> snapshot = await _db
          .collection('appointment')
          .where('userId', isEqualTo: userId)
          .where('vendorSideStatus', isEqualTo: 'completed')
          .get();

      print('-------------------------');
      print(snapshot);

      // Convert the documents to a list of AppointmentModel
      List<AppointmentModel> appointmentList = snapshot.docs
          .map((doc) => AppointmentModel.fromSnapshot(doc))
          .toList();

      return appointmentList;
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

  Future<List<AppointmentModel>> fetchAll() async {
    try {
      final String userId =
          AuthenticationRepository.instance.authUser?.uid ?? '';
      // Perform the query with filters
      QuerySnapshot<Map<String, dynamic>> snapshot = await _db
          .collection('appointment')
          .where('vendorId', isEqualTo: userId)
          .where('userSideStatus', isEqualTo: 'cancel')
          .get();

      print('-------------------------');
      print(snapshot);

      // Convert the documents to a list of AppointmentModel
      List<AppointmentModel> appointmentList = snapshot.docs
          .map((doc) => AppointmentModel.fromSnapshot(doc))
          .toList();

      return appointmentList;
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

  Future<List<AppointmentModel>> fetc() async {
    try {
      final String userId =
          AuthenticationRepository.instance.authUser?.uid ?? '';
      // Perform the query with filters
      QuerySnapshot<Map<String, dynamic>> snapshot = await _db
          .collection('appointment')
          .where('userId', isEqualTo: userId)
          .where('vendorSideStatus', isEqualTo: 'completed')
          .get();

      print('-------------------------');
      print(snapshot);

      // Convert the documents to a list of AppointmentModel
      List<AppointmentModel> appointmentList = snapshot.docs
          .map((doc) => AppointmentModel.fromSnapshot(doc))
          .toList();

      return appointmentList;
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
          .collection('appointment')
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
}
