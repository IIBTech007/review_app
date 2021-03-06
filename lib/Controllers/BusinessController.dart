import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:review_app/Interfaces/IBusinessRepository.dart';
import 'package:review_app/Models/BusinessViewModel.dart';
import 'package:review_app/Utils/Locator.dart';
import 'package:review_app/Utils/Utils.dart';

class BusinessController extends GetxController{
  var businesses =<BusinessViewModel>[];
  var _businesses =<BusinessViewModel>[].obs;
  var _businessRepository= locator<IBusinessRepository>();
  var openingTime=DateTime.now().obs;
  var closingTime=DateTime.now().obs;
  var longitude=0.0.obs;
  var latitude=0.0.obs;
  var image="".obs;
  TextEditingController nameTextEditingController,phoneTextEditingController,emailTextEditingController,descriptionTextEditingController,addressTextEditingController;
  @override
  void onInit() {
    if(nameTextEditingController==null){
      nameTextEditingController=TextEditingController();
    }
    if(phoneTextEditingController==null){
      phoneTextEditingController=TextEditingController();
    }
    if(emailTextEditingController==null){
      emailTextEditingController=TextEditingController();
    }
    if(descriptionTextEditingController==null){
      descriptionTextEditingController=TextEditingController();
    }
    if(addressTextEditingController==null){
      addressTextEditingController=TextEditingController();
    }
  }

  getBusinessByOwner(BuildContext context){
     _businessRepository.getBusinessByOwner(context).then((businessList){
       _businesses.assignAll(businessList);
       businesses.clear();
       businesses.addAll(_businesses);
     });
  }

  addBusiness(BuildContext context){
    if(nameTextEditingController.text==null||nameTextEditingController.text.isEmpty){
      Utils.showError(context,"Business Name is Required");
    }else if(emailTextEditingController.text==null||emailTextEditingController.text.isEmpty){
      Utils.showError(context,"Business Email is Required");
    }else if(!GetUtils.isEmail(emailTextEditingController.text)){
      Utils.showError(context,"Business Email is not Valid");
    }else if(addressTextEditingController.text==null||addressTextEditingController.text.isEmpty){
      Utils.showError(context,"Business Address is Required");
    }else if(descriptionTextEditingController.text==null||descriptionTextEditingController.text.isEmpty){
      Utils.showError(context,"Business Description is Required");
    }else if(phoneTextEditingController.text==null||phoneTextEditingController.text.isEmpty){
      Utils.showError(context,"Business Phone is Required");
    }else if(!GetUtils.isPhoneNumber(phoneTextEditingController.text)){
      Utils.showError(context,"Business Phone is Invalid");
    }else {
      _businessRepository.addBusiness(BusinessViewModel(
        id: 0,
        ownerId: "Business Owner",
        name: nameTextEditingController.text,
        email: emailTextEditingController.text,
        phone: phoneTextEditingController.text,
        description: descriptionTextEditingController.text,
        address: addressTextEditingController.text,
        openingTime: DateFormat("HH:mm:ss").format(openingTime.value),
        closingTime: DateFormat("HH:mm:ss").format(closingTime.value),
        longitude: longitude.value,
        latitude: latitude.value,
        image: image.value,
        businessTypeId: 1,
      ), context).then((value){
        nameTextEditingController.text="";
        emailTextEditingController.text="";
        phoneTextEditingController.text="";
        descriptionTextEditingController.text="";
        addressTextEditingController.text="";
        longitude.value=0.0;
        latitude.value=0.0;
        image.value="";
      });
    }
  }

  @override
  void onClose() {

  }
}