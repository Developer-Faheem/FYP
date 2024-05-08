import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String phoneNumber;
  String gender;
  String profilePicture;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.profilePicture,
  });

  static UserModel empty() => UserModel(
      id: '',
      name: '',
      email: '',
      phoneNumber: '',
      gender: '',
      profilePicture: '');

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: data['id'] ?? '',
        name: data['name'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        gender: data['gender'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }

//convert model to json structure to store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'profilePicture': profilePicture,
    };
  }
}
