import 'dart:convert';

import 'package:ars_progress_dialog/ars_progress_dialog.dart';
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
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    progressDialog.show();
    try{
      var res=await http.post(Utils.baseUrl()+"Account/Login",body:LoginViewModel.loginModelToJson(loginViewModel),headers: {"Content-Type":"application/json"});
      progressDialog.dismiss();
      if(res.statusCode==200)
      {
        Utils.showSuccess(context,"Login Sucess");
        locator<Logger>().i(jsonDecode(res.body)["token"]);
        return res.body;
      }else if(res.body!=null){
        Utils.showError(context,res.body.trim());
      }else
        Utils.showError(context,res.statusCode.toString());
      return "InValid Username or Password";
    }catch(e){
      Utils.showError(context, e.toString());
      progressDialog.dismiss();
    }

  }

  @override
  Future<String> Register(BuildContext context,RegisterViewModel registerViewModel)async {
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    progressDialog.show(); // show dialog
    try{
      var res=await http.post(Utils.baseUrl()+"Account/Register",body:RegisterViewModel.registerViewModelToJson(registerViewModel),headers: {"Content-type":"application/json"});
      progressDialog.dismiss();
      if(res.statusCode==200)
      {
        Utils.showSuccess(context,res.body.trim());
        locator<Logger>().w(res.body.trim());
        return res.body.trim();
      }else if(res.body!=null){
        Utils.showError(context,res.body.trim());
      }else
        Utils.showError(context,res.statusCode.toString());
      return "Registration Failed";
    }catch(e){
      progressDialog.dismiss();
      Utils.showError(context, e.toString());
    }

  }

}