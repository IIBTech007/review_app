import 'dart:convert';

import 'package:review_app/Models/BusinessViewModel.dart';

class RegisterViewModel{
 String name,email,phone,password,roleId,city,country;
 BusinessViewModel businessViewModel;

 RegisterViewModel({
  this.name,
  this.email,
  this.phone,
  this.password,
  this.roleId,
  this.city,
  this.country,
  this.businessViewModel
 });
 static RegisterViewModel registerViewModelFromJson(String str) => RegisterViewModel.fromJson(json.decode(str));

 static String registerViewModelToJson(RegisterViewModel data) => json.encode(data.toJson());
 factory RegisterViewModel.fromJson(Map<String, dynamic> json) => RegisterViewModel(
  name: json["name"],
  country: json["country"],
  city: json["city"],
  email: json["email"],
  password: json["password"],
  phone: json["phone"],
  roleId:json["roleId"]
 );

 Map<String, dynamic> toJson() => {
  "name": name,
  "country": country,
  "city": city,
  "email": email,
  "password": password,
  "phone": phone,
  "roleId":roleId,
  "business": businessViewModel == null ? null : businessViewModel,
 };
}