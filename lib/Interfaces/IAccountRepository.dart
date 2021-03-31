import 'package:flutter/material.dart';
import 'package:review_app/Models/Dropdown.dart';
import 'package:review_app/Models/LoginViewModel.dart';
import 'package:review_app/Models/RegisterViewModel.dart';

abstract class IAccountRepository{
 Future<void> register(BuildContext context,RegisterViewModel registerViewModel);
 Future<void> updateProfile(BuildContext context,RegisterViewModel registerViewModel);
 Future<void> login (BuildContext context,LoginViewModel loginViewModel);
 Future<void> resetPassword(BuildContext context,LoginViewModel loginViewModel);
 Future<List<Dropdown>> getRoles(BuildContext context);
}