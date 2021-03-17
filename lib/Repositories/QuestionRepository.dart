import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:review_app/Interfaces/IQuestionRepository.dart';
import 'package:review_app/Models/Questions.dart';
import 'package:http/http.dart'as http;
import 'package:review_app/Utils/Locator.dart';
import 'package:review_app/Utils/Utils.dart';
class QuestionRepository extends IQuestionRepository{
  @override
  Future<void> addQuestions(Questions questions, BuildContext context) async{
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    try{
      progressDialog.show();
      var res=await http.post(Utils.baseUrl()+"Questions",body:Questions.QuestionsToJson(questions),headers: {"Content-Type":"application/json","Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
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
  Future<List<Questions>> getQuestionsBySubCategory(int subcategoryId,BuildContext context) async{
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    try{
      progressDialog.show();
      var response= await http.get(Utils.baseUrl()+"Questions?SubCategoryId$subcategoryId",headers: {"Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
      print(Utils.baseUrl()+"Questions?SubCategoryId=$subcategoryId");
      locator<Logger>().i(response.body);
      if(response.statusCode==200){
        progressDialog.dismiss();
         locator<Logger>().i(response.body);
        return Questions.QuestionsListFromJson(response.body);
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

  @override
  Future<List<Questions>> getQuestionsByBusiness(int businessId, BuildContext context)async {
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    try{
      progressDialog.show();
      var response= await http.get(Utils.baseUrl()+"Questions?BusinessId=$businessId",headers: {"Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
      locator<Logger>().i(response.body);
      if(response.statusCode==200){
        progressDialog.dismiss();
        locator<Logger>().i(response.body);
        return Questions.QuestionsListFromJson(response.body);
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

  @override
  Future<List<Questions>> getQuestionsCategory(int categoryId, BuildContext context) async {
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    try{
      progressDialog.show();
      var response= await http.get(Utils.baseUrl()+"Questions?CategoryId=$categoryId",headers: {"Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
      print(Utils.baseUrl()+"Questions?SubCategoryId=$categoryId");
      locator<Logger>().i(response.body);
      if(response.statusCode==200){
        progressDialog.dismiss();
        locator<Logger>().i(response.body);
        return Questions.QuestionsListFromJson(response.body);
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

  @override
  Future<void> changeVisibility(int id, BuildContext context)async {
    var response=await http.get(Utils.baseUrl()+"Questions/ChangeVisibility/$id",headers: {"Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
    if(response.statusCode==200){
      Utils.showSuccess(context,"Visibility Changed");
    }else if(response.body!=null&&response.body.isNotEmpty){
      Utils.showError(context,response.body);
    }else
      Utils.showError(context,response.statusCode.toString());
    return null;
  }

  @override
  Future<void> updateQuestions(Questions questions, BuildContext context) {
    // TODO: implement updateQuestions
    throw UnimplementedError();
  }

  @override
  Future<List<Questions>> getQuestionsBySubCategoryforCustomer(int subcategoryId, BuildContext context) async {
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    try{
      progressDialog.show();
      var response= await http.get(Utils.baseUrl()+"Questions/getQuestionsforCustomer?SubCategoryId=$subcategoryId&BusinessId=0&CategoryId=0",headers: {"Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
      print(Utils.baseUrl()+"getQuestionsforCustomer?SubCategoryId=$subcategoryId");
      locator<Logger>().i(response.body);
      if(response.statusCode==200){
        progressDialog.dismiss();
        locator<Logger>().i(response.body);
        return Questions.QuestionsListFromJson(response.body);
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