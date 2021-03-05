import 'dart:convert';

import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:review_app/Interfaces/ICategoryRepository.dart';
import 'package:review_app/Models/CategoriesViewModel.dart';
import 'package:http/http.dart'as http;
import 'package:review_app/Utils/Locator.dart';
import 'package:review_app/Utils/Utils.dart';
class CategoryRepository extends ICategoryRepository{
  @override
  Future<void> addCategories(CategoriesViewModel categoriesViewModel,BuildContext context) async{
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    try{
      progressDialog.show();
      var res=await http.post(Utils.baseUrl()+"Categories",body:CategoriesViewModel.CategoriesViewModelToJson(categoriesViewModel),headers: {"Content-Type":"application/json","Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
      progressDialog.dismiss();
      if(res.statusCode==200)
      {
        Utils.showSuccess(context,"Category Added");
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
  Future<List<CategoriesViewModel>> getCategories(int businessId,BuildContext context) async{
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    try{
      progressDialog.show();
      var response= await http.get(Utils.baseUrl()+"Categories/GetCategoriesByBusiness/$businessId",headers: {"Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
      if(response.statusCode==200){
        locator<Logger>().i(CategoriesViewModel.CategoriesListFromJson(response.body));
        return CategoriesViewModel.CategoriesListFromJson(response.body);
      }else if(response.body!=null){
        Utils.showError(context,response.body.toString());
      }else
        Utils.showError(context,response.statusCode.toString());
    }catch(e){
      Utils.showError(context,e.toString());
    }finally{
      progressDialog.dismiss();
    }
    return null;
  }

  @override
  Future<void> changeVisibility(int id) {

  }

}