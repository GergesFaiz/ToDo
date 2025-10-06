class UserModel {
  static const String collectionName = "Users";
  String userName;
  String email;
  String phone;
  String id;
  bool emailVerified;

  UserModel({
    required this.id,
    required this.email,
    this.phone = "",
    required this.userName,
    this.emailVerified = false,
  });

  UserModel.fromJson(Map<String, dynamic> json)
    : this(
        userName: json['userName'],
        email: json['email'],
        phone: json['phone'],
        id: json['id'],
        emailVerified: json['emailVerified'],
      );

  Map<String, dynamic> toJson() {
    return {
      "userName": userName,
      "phone": phone,
      "email": email,
      "id": id,
      "emailVerified": emailVerified,
    };
  }
}
