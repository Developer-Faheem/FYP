class AppointmentModel {
  final String appointmentId;
  final String userId;
  final String vendorId;
  final String salonProfileUrl;
  final String userProfileUrl;
  final String services; // Changed to String
  final String userName;
  final String bookingTime;
  final String bookingDate;
  final String vendorAddress;
  final String vendorTagline;
  final String salonName;
  final String userSideStatus;
  final String vendorSideStatus;
  final double totalPrice;
  final String rating;

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

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      appointmentId: json['appointmentId'],
      userId: json['userId'],
      vendorId: json['vendorId'],
      salonProfileUrl: json['salonProfileUrl'],
      userProfileUrl: json['userProfileUrl'],
      services: json['services'], // Changed to String
      userName: json['userName'],
      bookingTime: json['bookingTime'],
      bookingDate: json['bookingDate'],
      vendorAddress: json['vendorAddress'],
      vendorTagline: json['vendorTagline'],
      salonName: json['salonName'],
      userSideStatus: json['userSideStatus'],
      vendorSideStatus: json['vendorSideStatus'],
      totalPrice: json['totalPrice'].toDouble(),
      rating: json['rating'],
    );
  }

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
