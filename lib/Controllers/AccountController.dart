import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_app/Models/LoginViewModel.dart';
import 'package:review_app/Repositories/AccountRepository.dart';
import 'package:review_app/Utils/Locator.dart';

class AccountController extends GetxController{
 var accountRepository =locator<AccountRepository>();
 bool isVisible=true;
 TextEditingController emailTextEditingController,passwordTextEditingController;
  @override
  void onInit() {
    emailTextEditingController=TextEditingController();
    passwordTextEditingController=TextEditingController();
  }

  Future<String> AuthenticateUser(BuildContext context)async{
   return accountRepository.Login(context, LoginViewModel(email:emailTextEditingController.text,password:passwordTextEditingController.text));
  }

  @override
  void onClose() {
    emailTextEditingController?.dispose();
    passwordTextEditingController?.dispose();
  }
}