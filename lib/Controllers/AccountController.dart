import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_app/Interfaces/IAccountRepository.dart';
import 'package:review_app/Models/LoginViewModel.dart';
import 'package:review_app/Models/RegisterViewModel.dart';
import 'package:review_app/Repositories/AccountRepository.dart';
import 'package:review_app/Utils/Locator.dart';

import '../Models/LoginViewModel.dart';
import '../Utils/Utils.dart';

class AccountController extends GetxController{
 var accountRepository =locator<IAccountRepository>();
 bool isVisible=true;
 TextEditingController confirmPasswordTextEditingController, nameTextEditingController,emailTextEditingController,passwordTextEditingController,cityTextEditingController,countryTextEditingController,phoneTextEditingController;

 @override
  void onInit() {
   if(emailTextEditingController==null){
     emailTextEditingController=TextEditingController();
   }
   if(passwordTextEditingController==null){
     passwordTextEditingController=TextEditingController();
   }
   if(confirmPasswordTextEditingController==null){
     confirmPasswordTextEditingController=TextEditingController();
   }
   if(nameTextEditingController==null) {
     nameTextEditingController = TextEditingController();
   }
   if(phoneTextEditingController==null) {
     phoneTextEditingController = TextEditingController();
   }
   if(cityTextEditingController==null) {
     cityTextEditingController = TextEditingController();
   }
   if(countryTextEditingController==null) {
     countryTextEditingController = TextEditingController();
   }
  }

  Future<String> AuthenticateUser(BuildContext context)async{
    Utils.check_connectivity().then((isConnected){
      if(isConnected){
        if(emailTextEditingController.text==null||emailTextEditingController.text.isEmpty){
          Utils.showError(context, "Email is Required");
        }else if(!Utils.validateEmail(emailTextEditingController.text)){
          Utils.showError(context, "Email Format is Invalid");
        }
        else if(passwordTextEditingController.text==null||passwordTextEditingController.text.isEmpty){
          Utils.showError(context, "Password is Required");
        }else if(!Utils.validateStructure(passwordTextEditingController.text)){
          Utils.showError(context, "Password must contain atleast one lower case,Upper case and special characters");
        }else {
          return accountRepository.login(context, LoginViewModel(
              email: emailTextEditingController.text,
              password: passwordTextEditingController.text,
              confirmPassword: passwordTextEditingController.text));
        }
      }else
        Utils.showError(context,"Network not Available");
    });

  }
  Future<void> ResetPassword(BuildContext context){

    return accountRepository.resetPassword(context,LoginViewModel(
      email: emailTextEditingController.text,
      password: passwordTextEditingController.text,
      confirmPassword: confirmPasswordTextEditingController.text
    ));
  }
  Future<void> RegisterUser(BuildContext context){

    return accountRepository.register(context, RegisterViewModel(
      name:nameTextEditingController.text,
      email:emailTextEditingController.text,
      password: passwordTextEditingController.text,
      phone: phoneTextEditingController.text,
      country: countryTextEditingController.text,
      city: cityTextEditingController.text,
      roleId: "d24a371d-764c-4e62-99bd-2497bef73099"
    ));
  }

  @override
  void onClose() {
    nameTextEditingController?.dispose();
    emailTextEditingController?.dispose();
    passwordTextEditingController?.dispose();
    phoneTextEditingController?.dispose();
    cityTextEditingController?.dispose();
    countryTextEditingController?.dispose();
  }

  @override
  void dispose() {
   this.dispose();
    super.dispose();
  }
}