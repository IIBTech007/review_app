import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    customerFeedback.clear();
  }
  addFeedback(BuildContext context,int businessId,int categoryId,int subCategoryId){
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
    }).then((value){
      Navigator.pop(context);
      city.text="";
      country.text="";
      name.text="";
      phone.text="";
      email.text="";
      image="";
      comment.text="";
    });
  }
  getFeedBack(int businessId,BuildContext context){
    _feedbackRepository.getFeedBack(0, 0, businessId, context).then((value){
      feedbacks.clear();
      feedbacks.assignAll(value);
    });
  }
  @override
  void onClose() {
    comment?.dispose();
    phone?.dispose();
    email?.dispose();
    name?.dispose();
  }
}