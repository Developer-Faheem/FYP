import 'package:cloud_firestore/cloud_firestore.dart';

class PackageModel {
  String id;
  String packageName;
  String packageImage;
  String packageServices;
  double packagePrice;

  PackageModel({
    required this.id,
    required this.packageName,
    required this.packagePrice,
    required this.packageImage,
    required this.packageServices,
  });

  static PackageModel empty() => PackageModel(
        id: '',
        packageName: '',
        packageImage: '',
        packageServices: '',
        packagePrice: 0.0,
      );

  factory PackageModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return PackageModel(
        id: data['id'] ?? '',
        packageName: data['packageName'] ?? '',
        packageServices: data['packageServices'] ?? '',
        packageImage: data['packageImage'] ?? '',
        packagePrice: (data['packagePrice'] ?? 0).toDouble(),
      );
    } else {
      return PackageModel.empty();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'packageName': packageName,
      'packageServices': packageServices,
      'packageImage': packageImage,
      'servicePrice': packagePrice,
    };
  }
}
