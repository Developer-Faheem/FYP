import 'package:cloud_firestore/cloud_firestore.dart';

class PackageModel {
  String id;
  String packageImage;
  String packageName;
  String packageServices;
  double servicePrice;

  PackageModel({
    required this.id,
    required this.packageImage,
    required this.packageName,
    required this.packageServices,
    required this.servicePrice,
  });

  static PackageModel empty() => PackageModel(
        id: '',
        packageImage: '',
        packageName: '',
        packageServices: '',
        servicePrice: 0.0,
      );

  factory PackageModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return PackageModel(
        id: data['id'] ?? '',
        packageImage: data['packageImage'] ?? '',
        packageName: data['packageName'] ?? '',
        packageServices: data['packageServices'] ?? '',
        servicePrice: (data['servicePrice'] ?? 0.0).toDouble(),
      );
    } else {
      return PackageModel.empty();
    }
  }

  // Convert model to JSON structure to store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'packageImage': packageImage,
      'packageName': packageName,
      'packageServices': packageServices,
      'servicePrice': servicePrice,
    };
  }
}
