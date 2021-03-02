import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_app/Models/LoginViewModel.dart';
import 'package:review_app/Models/RegisterViewModel.dart';
import 'package:review_app/Repositories/AccountRepository.dart';
import 'package:review_app/Utils/Locator.dart';

class AccountController extends GetxController{
 var accountRepository =locator<AccountRepository>();
 bool isVisible=true;
 TextEditingController nameTextEditingController,emailTextEditingController,passwordTextEditingController,cityTextEditingController,countryTextEditingController,phoneTextEditingController;
  @override
  void onInit() {
    nameTextEditingController=TextEditingController();
    emailTextEditingController=TextEditingController();
    phoneTextEditingController=TextEditingController();
    cityTextEditingController=TextEditingController();
    countryTextEditingController=TextEditingController();
    passwordTextEditingController=TextEditingController();
  }

  Future<String> AuthenticateUser(BuildContext context)async{
   return accountRepository.Login(context, LoginViewModel(email:emailTextEditingController.text,password:passwordTextEditingController.text));
  }
  Future<String> RegisterUser(BuildContext context){
    return accountRepository.Register(context, RegisterViewModel(
      name:nameTextEditingController.text,
      email:emailTextEditingController.text,
      password: passwordTextEditingController.text,
      phone: phoneTextEditingController.text,
      country: countryTextEditingController.text,
      city: cityTextEditingController.text,
      roleId: "5380d13a-983f-487f-981d-7f18c651ce0f"
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
}