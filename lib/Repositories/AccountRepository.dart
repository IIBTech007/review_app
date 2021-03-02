import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:review_app/Interfaces/IAccountRepository.dart';
import 'package:review_app/Models/LoginViewModel.dart';
import 'package:review_app/Models/RegisterViewModel.dart';
import 'package:http/http.dart'as http;
import 'package:review_app/Utils/Locator.dart';
import 'package:review_app/Utils/Utils.dart';
class AccountRepository extends IAccountRepository{
  @override
  Future<String> Login(BuildContext context,LoginViewModel loginViewModel)async {
    var res=await http.post(Utils.baseUrl()+"Account/Login",body:LoginViewModel.loginModelToJson(loginViewModel),headers: {"Content-Type":"application/json"});
    if(res.statusCode==200)
    {
      Utils.showSuccess(context,"Login Sucess");
      locator<Logger>().i(jsonDecode(res.body)["token"]);
      return res.body;
    }else
      Utils.showError(context,res.statusCode.toString());
      return "InValid Username or Password";
  }

  @override
  Future<String> Register(BuildContext context,RegisterViewModel registerViewModel)async {
    var res=await http.post(Utils.baseUrl()+"Account/Login",body: registerViewModel,headers: {"Content-type":"application/json"});
    if(res.statusCode==200)
    {
      Utils.showSuccess(context,"Login Sucess");
      Logger().d(jsonDecode(res.body)["token"]);
      return res.body;
    }else
      return "InValid Username or Password";
  }

}