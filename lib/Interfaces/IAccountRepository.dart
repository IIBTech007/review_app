import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:review_app/Models/LoginViewModel.dart';
import 'package:review_app/Models/RegisterViewModel.dart';

abstract class IAccountRepository{
 Future<String> Register(BuildContext context,RegisterViewModel registerViewModel);
 Future<String> Login (BuildContext context,LoginViewModel loginViewModel);
}