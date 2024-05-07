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
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'] ?? '',
      salonName: json['salonName'] ?? '',
      userName: json['userName'] ?? '',
      email: json['email'] ?? '',
      jazzcashNumber: json['jazzcashNumber'] ?? '',
      easypaisaNumber: json['easypaisaNumber'] ?? '',
      tagline: json['tagline'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      city: json['city'] ?? '',
      aboutSection: json['aboutSection'] ?? '',
      followers: json['followers'] ?? 0,
    );
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
    };
  }
}
