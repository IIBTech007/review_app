import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:review_app/Interfaces/IBusinessTypeRepository.dart';
import 'package:review_app/Models/Dropdown.dart';
import 'package:review_app/Utils/Locator.dart';
import 'package:review_app/Utils/Utils.dart';
import 'package:http/http.dart'as http;
class BusinessTypeRepository extends IBusinessTypeRepository{
  @override
  Future<Dropdown> getBusinessTypes(BuildContext context,String token) async {
    try{
      var response= await http.get(Utils.baseUrl()+"BusinessTypes",headers: {"Authorization":"Bearer $token"});
      if(response.statusCode==200){
        locator<Logger>().i(Dropdown.DropdownListFromJson(response.body));
      }else if(response.body!=null){
        Utils.showError(context,response.body);
      }else
        Utils.showError(context,response.statusCode.toString());
    }catch(e){
      Utils.showError(context,e.toString());
    }

  }

  @override
  Future<void> changeVisibility(int id) {

  }

}