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

//
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      gender: json['gender'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
    );
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
