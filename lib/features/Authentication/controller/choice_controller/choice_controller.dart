import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoleController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> storeUserRole(String role, bool isChoiceDone) async {
    final user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('roles').doc(user.uid).set({
        'role': role,
        'isChoiceDone': isChoiceDone,
      });
    }
  }

  Future<Map<String, dynamic>?> retrieveUserRole() async {
    final user = _auth.currentUser;
    if (user != null) {
      final roleDoc = await _firestore.collection('roles').doc(user.uid).get();
      if (roleDoc.exists) {
        return roleDoc.data();
      }
    }
    return null;
  }
}
