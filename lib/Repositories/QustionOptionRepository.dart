import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:review_app/Interfaces/IQuestionOptionsRepository.dart';
import 'package:review_app/Models/QuestionOptions.dart';
import 'package:http/http.dart'as http;
import 'package:review_app/Utils/Locator.dart';
import 'package:review_app/Utils/Utils.dart';


class QuestionOptionsRepository extends IQuestionOptionsRepository{
  @override
  Future<void> addQuestionOptions(QuestionOptions questions, BuildContext context) async{
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    try{
      progressDialog.show();
      var res=await http.post(Utils.baseUrl()+"QuestionOptions",body:QuestionOptions.questionOptionToJson(questions),headers: {"Content-Type":"application/json","Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
      progressDialog.dismiss();
      if(res.statusCode==200||res.statusCode==201)
      {
        progressDialog.dismiss();
        Navigator.pop(context,"Refresh");
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
  Future<void> updateQuestionOptions(QuestionOptions questions, BuildContext context) async{
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    try{
      progressDialog.show();
      var res=await http.post(Utils.baseUrl()+"QuestionOptions",body:QuestionOptions.questionOptionToJson(questions),headers: {"Content-Type":"application/json","Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
      progressDialog.dismiss();
      if(res.statusCode==200||res.statusCode==201)
      {
        progressDialog.dismiss();
        Navigator.pop(context,"Refresh");
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
  Future<void> changeVisibility(int id, BuildContext context)async {
    var response=await http.get(Utils.baseUrl()+"QuestionOptions/ChangeVisibility/$id",headers: {"Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
    if(response.statusCode==200){
      Utils.showSuccess(context,"Visibility Changed");
    }else if(response.body!=null&&response.body.isNotEmpty){
      Utils.showError(context,response.body);
    }else
      Utils.showError(context,response.statusCode.toString());
    return null;
  }

  @override
  Future<List<QuestionOptions>> getQuestionOptions(int questionId, BuildContext context) async{
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    try{
      progressDialog.show();
      var response= await http.get(Utils.baseUrl()+"QuestionOptions?QuestionId=$questionId",headers: {"Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
      print(Utils.baseUrl()+"getQuestionsforCustomer?SubCategoryId=$questionId");
      print(response.body);
      locator<Logger>().i(response.body);
      if(response.statusCode==200){
        progressDialog.dismiss();
        locator<Logger>().i(response.body);
        return QuestionOptions.questionOptionsListFromJson(response.body);
      }else if(response.body!=null&&response.body.isNotEmpty){
        progressDialog.dismiss();
        Utils.showError(context,response.body.toString());
      }else
        progressDialog.dismiss();
      Utils.showError(context,response.statusCode.toString());
    }catch(e){
      progressDialog.dismiss();
      Utils.showError(context,e.toString());
    }finally{
      progressDialog.dismiss();
    }
    return null;
  }



}