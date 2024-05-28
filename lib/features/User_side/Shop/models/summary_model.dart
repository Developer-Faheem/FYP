class SummaryModel {
  final String salonName;
  final String salonAddress;
  final String salonPhoneNumber;
  final String vendorName;
  final String summaryId;
  final String bookingDate;
  final String bookingTime;
  final String services;
  final double totalPrice;
  final double paidPrice;

  SummaryModel({
    required this.salonName,
    required this.salonAddress,
    required this.salonPhoneNumber,
    required this.vendorName,
    required this.summaryId,
    required this.bookingDate,
    required this.bookingTime,
    required this.services,
    required this.totalPrice,
    required this.paidPrice,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return SummaryModel(
      salonName: json['salonName'],
      salonAddress: json['salonAddress'],
      salonPhoneNumber: json['salonPhoneNumber'],
      vendorName: json['vendorName'],
      summaryId: json['summaryId'],
      bookingDate: json['bookingDate'],
      bookingTime: json['bookingTime'],
      services: json['services'],
      totalPrice: json['totalPrice'].toDouble(),
      paidPrice: json['paidPrice'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'salonName': salonName,
      'salonAddress': salonAddress,
      'salonPhoneNumber': salonPhoneNumber,
      'vendorName': vendorName,
      'summaryId': summaryId,
      'bookingDate': bookingDate,
      'bookingTime': bookingTime,
      'services': services,
      'totalPrice': totalPrice,
      'paidPrice': paidPrice,
    };
  }
}
