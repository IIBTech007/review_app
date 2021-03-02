import 'dart:convert';

class LoginViewModel{
  String email,password;

  LoginViewModel({
    this.email,
    this.password
  });
  static LoginViewModel loginModelFromJson(String str) => LoginViewModel.fromJson(json.decode(str));

  static String loginModelToJson(LoginViewModel data) => json.encode(data.toJson());

  factory LoginViewModel.fromJson(Map<String, dynamic> json) => LoginViewModel(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}