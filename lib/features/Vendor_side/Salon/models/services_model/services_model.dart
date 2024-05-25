import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  String serviceName;
  double servicePrice;

  ServiceModel({
    required this.serviceName,
    required this.servicePrice,
  });

  static ServiceModel empty() => ServiceModel(
        serviceName: '',
        servicePrice: 0.0,
      );

  factory ServiceModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ServiceModel(
        serviceName: data['serviceName'] ?? '',
        servicePrice: (data['servicePrice'] ?? 0).toDouble(),
      );
    } else {
      return ServiceModel.empty();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'servicePrice': servicePrice,
    };
  }
}
