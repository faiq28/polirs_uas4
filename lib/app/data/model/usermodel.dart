class UserModel {
  final String uid;
  final String userName;
  final String email;
  final String password;
  final bool isAdmin;

  UserModel({
    required this.email,
    required this.uid,
    required this.password,
    required this.userName,
    required this.isAdmin,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        uid: json[' uid'],
        password: json['password'],
        userName: json['userName'],
        isAdmin: json['isAdmin']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      ' uid': uid,
      'password': password,
      'userName': userName,
      'isAdmin': isAdmin,
    };
  }
}
