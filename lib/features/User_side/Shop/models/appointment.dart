import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel {
  String appointmentId;
  String userId;
  String vendorId;
  String salonProfileUrl;
  String userProfileUrl;
  String services; // Changed to String
  String userName;
  String bookingTime;
  String bookingDate;
  String vendorAddress;
  String vendorTagline;
  String salonName;
  String userSideStatus;
  String vendorSideStatus;
  double totalPrice;
  double rating;

  AppointmentModel({
    required this.appointmentId,
    required this.userId,
    required this.vendorId,
    required this.salonProfileUrl,
    required this.userProfileUrl,
    required this.services, // Changed to String
    required this.userName,
    required this.bookingTime,
    required this.bookingDate,
    required this.vendorAddress,
    required this.vendorTagline,
    required this.salonName,
    required this.userSideStatus,
    required this.vendorSideStatus,
    required this.totalPrice,
    required this.rating,
  });

  // Default values for an empty AppointmentModel
  static AppointmentModel empty() => AppointmentModel(
        appointmentId: '',
        userId: '',
        vendorId: '',
        salonProfileUrl: '',
        userProfileUrl: '',
        services: '',
        userName: '',
        bookingTime: '',
        bookingDate: '',
        vendorAddress: '',
        vendorTagline: '',
        salonName: '',
        userSideStatus: '',
        vendorSideStatus: '',
        totalPrice: 0.0,
        rating: 0.0,
      );

  // Factory method to create AppointmentModel from Firestore snapshot
  factory AppointmentModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return AppointmentModel(
        appointmentId: data['appointmentId'] ?? '',
        userId: data['userId'] ?? '',
        vendorId: data['vendorId'] ?? '',
        salonProfileUrl: data['salonProfileUrl'] ?? '',
        userProfileUrl: data['userProfileUrl'] ?? '',
        services: data['services'] ?? '', // Changed to String
        userName: data['userName'] ?? '',
        bookingTime: data['bookingTime'] ?? '',
        bookingDate: data['bookingDate'] ?? '',
        vendorAddress: data['vendorAddress'] ?? '',
        vendorTagline: data['vendorTagline'] ?? '',
        salonName: data['salonName'] ?? '',
        userSideStatus: data['userSideStatus'] ?? '',
        vendorSideStatus: data['vendorSideStatus'] ?? '',
        totalPrice: (data['totalPrice'] ?? 0.0).toDouble(),
        rating: (data['rating'] ?? 0.0).toDouble(),
      );
    } else {
      return AppointmentModel.empty();
    }
  }

  // Convert AppointmentModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'appointmentId': appointmentId,
      'userId': userId,
      'vendorId': vendorId,
      'salonProfileUrl': salonProfileUrl,
      'userProfileUrl': userProfileUrl,
      'services': services, // Changed to String
      'userName': userName,
      'bookingTime': bookingTime,
      'bookingDate': bookingDate,
      'vendorAddress': vendorAddress,
      'vendorTagline': vendorTagline,
      'salonName': salonName,
      'userSideStatus': userSideStatus,
      'vendorSideStatus': vendorSideStatus,
      'totalPrice': totalPrice,
      'rating': rating,
    };
  }
}
