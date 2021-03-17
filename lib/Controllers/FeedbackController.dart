import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_app/Controllers/AccountController.dart';
import 'package:review_app/Interfaces/IFeedbackRepository.dart';
import 'package:review_app/Models/CustomerFeedBack.dart';
import 'package:review_app/Models/feedback.dart';
import 'package:review_app/Utils/Locator.dart';

class FeedbackController extends GetxController{
TextEditingController comment,phone,email,name,city,country;
String image;
var _feedbackRepository=locator<IFeedBackRepository>();
var feedbacks=<feedback>[].obs;
List<CustomerFeedBack> customerFeedback=<CustomerFeedBack>[];
final _accountController=Get.find<AccountController>();
  @override
  void onInit() {
    if(comment==null){
      comment=TextEditingController();
    }
    if(phone==null){
      phone=TextEditingController();
    }
    if(email==null){
      email=TextEditingController();
    }
    if(name==null){
      name=TextEditingController();
    }
    if(city==null){
      city=TextEditingController();
    }
    if(country==null){
      country=TextEditingController();
    }
    //Assigning values for Already Logged in User
      if(_accountController.getLoggedInUserData().userInfo.name!=null&&_accountController.getLoggedInUserData().userInfo.name.isNotEmpty){
        name.text=_accountController.getLoggedInUserData().userInfo.name;
      }
      if(_accountController.getLoggedInUserData().userInfo.email!=null&&_accountController.getLoggedInUserData().userInfo.email.isNotEmpty){
        email.text=_accountController.getLoggedInUserData().userInfo.email;
      }
      if(_accountController.getLoggedInUserData().userInfo.phone!=null&&_accountController.getLoggedInUserData().userInfo.phone.isNotEmpty){
        phone.text=_accountController.getLoggedInUserData().userInfo.phone;
      }
      if(_accountController.getLoggedInUserData().userInfo.city!=null&&_accountController.getLoggedInUserData().userInfo.city.isNotEmpty){
        city.text=_accountController.getLoggedInUserData().userInfo.city;
      }
      if(_accountController.getLoggedInUserData().userInfo.country!=null&&_accountController.getLoggedInUserData().userInfo.country.isNotEmpty){
        country.text=_accountController.getLoggedInUserData().userInfo.country;
      }
    customerFeedback.clear();
  }
  addFeedback(BuildContext context,int businessId,int categoryId,int subCategoryId){
    final ids = customerFeedback.map((e) => e.questionId).toSet();
    customerFeedback.retainWhere((x) => ids.remove(x.questionId));
    _feedbackRepository.AddFeedBack(feedback(
      subCategoryId: subCategoryId,
      categoryId: categoryId,
      phone:phone.text,
      businessId: businessId,
      email: email.text,
      customerName: name.text,
      comment: comment.text,
      image: image,
      customerFeedBacks: customerFeedback
    ), context).then((value){
      customerFeedback.clear();
      city.text="";
      country.text="";
      name.text="";
      phone.text="";
      email.text="";
      image="";
      comment.text="";
      Navigator.pop(context);
    });
  }
  getFeedBack(int businessId,BuildContext context){
    _feedbackRepository.getFeedBack(0, 0, businessId,null,context).then((value){
      feedbacks.clear();
      feedbacks.assignAll(value);
    });
  }
getFeedBackByEmail(BuildContext context){
   if(_accountController.getLoggedInUserData().userInfo.email!=null){
     _feedbackRepository.getFeedBack(0, 0,0,_accountController.getLoggedInUserData().userInfo.email, context).then((value){
       feedbacks.clear();
       feedbacks.assignAll(value);
     });
   }

}
  @override
  void onClose() {
    comment?.dispose();
    phone?.dispose();
    email?.dispose();
    name?.dispose();
  }
}