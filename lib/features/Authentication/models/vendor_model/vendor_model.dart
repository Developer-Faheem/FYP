import 'package:cloud_firestore/cloud_firestore.dart';

class VendorModel {
  String id;
  String salonName;
  String userName;
  String email;
  String jazzcashNumber;
  String easypaisaNumber;
  String tagline;
  String phoneNumber;
  String city;
  String aboutSection;
  int followers;
  List<String> followersList; // List of follower user IDs
  String address;
  double ratings;
  String profilePicture;
  String mapLocation;

  VendorModel({
    required this.id,
    required this.salonName,
    required this.userName,
    required this.email,
    required this.jazzcashNumber,
    required this.easypaisaNumber,
    required this.tagline,
    required this.phoneNumber,
    required this.city,
    required this.aboutSection,
    required this.followers,
    this.followersList = const [], // Initialize with empty list
    required this.address,
    required this.profilePicture,
    required this.mapLocation,
    required this.ratings,
  });

  static VendorModel empty() => VendorModel(
        id: '',
        salonName: '',
        userName: '',
        email: '',
        jazzcashNumber: '',
        easypaisaNumber: '',
        tagline: '',
        phoneNumber: '',
        city: '',
        aboutSection: '',
        followers: 0,
        followersList: const [],
        address: '',
        profilePicture: '',
        mapLocation: '',
        ratings: 0.0,
      );

  factory VendorModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return VendorModel(
        id: data['id'] ?? '',
        salonName: data['salonName'] ?? '',
        userName: data['userName'] ?? '',
        email: data['email'] ?? '',
        jazzcashNumber: data['jazzcashNumber'] ?? '',
        easypaisaNumber: data['easypaisaNumber'] ?? '',
        tagline: data['tagline'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        city: data['city'] ?? '',
        aboutSection: data['aboutSection'] ?? '',
        followers: data['followers'] ?? 0,
        followersList: List<String>.from(
            data['followersList'] ?? []), // Convert to List<String>
        address: data['address'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
        mapLocation: data['mapLocation'] ?? '',
        ratings: (data['ratings'] ?? 0.0) as double, // Cast to double
      );
    } else {
      return VendorModel.empty();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'salonName': salonName,
      'userName': userName,
      'email': email,
      'jazzcashNumber': jazzcashNumber,
      'easypaisaNumber': easypaisaNumber,
      'tagline': tagline,
      'phoneNumber': phoneNumber,
      'city': city,
      'aboutSection': aboutSection,
      'followers': followers,
      'followersList': followersList,
      'address': address,
      'profilePicture': profilePicture,
      'mapLocation': mapLocation,
      'ratings': ratings,
    };
  }
}
