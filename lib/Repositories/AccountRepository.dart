import 'dart:convert';
import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:review_app/AppScreens/Admin/Business/BusinessList.dart';
import 'package:review_app/Interfaces/IAccountRepository.dart';
import 'package:review_app/Interfaces/IBusinessRepository.dart';
import 'package:review_app/Models/Dropdown.dart';
import 'package:review_app/Models/LoginViewModel.dart';
import 'package:review_app/Models/RegisterViewModel.dart';
import 'package:http/http.dart'as http;
import 'package:review_app/Utils/Locator.dart';
import 'package:review_app/Utils/Utils.dart';

class AccountRepository extends IAccountRepository{
  @override
  Future<void> login(BuildContext context,LoginViewModel loginViewModel)async {
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));

    try{
     // progressDialog.show();
      var res=await http.post(Utils.baseUrl()+"Account/Login",body:LoginViewModel.loginModelToJson(loginViewModel),headers: {"Content-Type":"application/json"});
      if(res.statusCode==200)
      {
        progressDialog.dismiss();
        Utils.showSuccess(context,"Login Sucess");
        locator<Logger>().i(jsonDecode(res.body)["token"]);
        locator<GetStorage>().write("token", jsonDecode(res.body)["token"]);
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>BusinessList()));
        return res.body;
      }else if(res.body!=null&&res.body.isNotEmpty){
        progressDialog.dismiss();
        Utils.showError(context,res.body.trim());
      }else
        progressDialog.dismiss();
        Utils.showError(context,res.statusCode.toString());
      return "InValid Username or Password";
    }catch(e){
      Utils.showError(context, e.toString());
      progressDialog.dismiss();
    }finally{
      progressDialog.dismiss();
    }

  }

  @override
  Future<void> register(BuildContext context,RegisterViewModel registerViewModel)async {
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    // show dialog
    try{
      progressDialog.show();
      var res=await http.post(Utils.baseUrl()+"Account/Register",body:RegisterViewModel.registerViewModelToJson(registerViewModel),headers: {"Content-type":"application/json"});
      progressDialog.dismiss();
      if(res.statusCode==200)
      {
        progressDialog.dismiss();
        Utils.showSuccess(context,res.body.trim());
        locator<Logger>().w(res.body.trim());
        return res.body.trim();
      }else if(res.body!=null&&res.body.isNotEmpty){
        progressDialog.dismiss();
        Utils.showError(context,res.body.trim());
      }else
        progressDialog.dismiss();
        Utils.showError(context,res.statusCode.toString());
    }catch(e){
      progressDialog.dismiss();
      Utils.showError(context, e.toString());
    }finally{
      progressDialog.dismiss();
    }

  }

  @override
  Future<void> resetPassword(BuildContext context, LoginViewModel loginViewModel)async {
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    progressDialog.show();
    try{
      var res=await http.post(Utils.baseUrl()+"Account/ForgotPassword",body:LoginViewModel.loginModelToJson(loginViewModel),headers: {"Content-Type":"application/json"});
      progressDialog.dismiss();
      if(res.statusCode==200)
      {
        Utils.showSuccess(context,res.body);
      }else if(res.body!=null){
        Utils.showError(context,res.body.trim());
      }else
        Utils.showError(context,res.statusCode.toString());
    }catch(e){
      Utils.showError(context, e.toString());
      progressDialog.dismiss();
    }finally{
      progressDialog.dismiss();
    }
  }

  @override
  Future<List<Dropdown>> getRoles(BuildContext context) async{
    var response= await http.get(Utils.baseUrl()+"Account/GetRoles");
    if(response.statusCode==200){
      locator<Logger>().i(Dropdown.DropdownListFromJson(response.body).toString());
     return Dropdown.DropdownListFromJson(response.body);
    }else if(response.body!=null){
        Utils.showError(context,response.body);
    }else
      Utils.showError(context,response.statusCode.toString());
    return null;
  }

}