import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:review_app/Interfaces/IFeedbackRepository.dart';
import 'package:review_app/Models/feedback.dart';
import 'package:review_app/Utils/Locator.dart';
import 'package:http/http.dart'as http;
import 'package:review_app/Utils/Utils.dart';


class FeedBackRepository extends IFeedBackRepository{
  @override
  Future<void> AddFeedBack(feedback f, BuildContext context) async {
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    try{
      locator<Logger>().i(f.customerFeedBacks);
      progressDialog.show();
      var res=await http.post(Utils.baseUrl()+"Feedback",body:feedback.FeedbackToJson(f),headers: {"Content-Type":"application/json","Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
      progressDialog.dismiss();
      if(res.statusCode==200||res.statusCode==201)
      {
        progressDialog.dismiss();
       // Navigator.pop(context,"Refresh");
      }else if(res.body!=null&&res.body.isNotEmpty){
        progressDialog.dismiss();
        locator<Logger>().i(res.body.trim());
       // Utils.showError(context,res.body.trim());
      }else
        progressDialog.dismiss();
      Utils.showError(context,res.statusCode.toString());
    }catch(e){
      progressDialog.dismiss();
      locator<Logger>().e(e);
      //Utils.showError(context, e.toString());
    }finally{
      progressDialog.dismiss();
    }
  }

  @override
  Future<List<feedback>> getFeedBack(int categoryId, int subcategoryId, int businessId, BuildContext context) async{
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    try{
      progressDialog.show();
      var response= await http.get(Utils.baseUrl()+"Feedback?BusinessId=$businessId",headers: {"Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
      locator<Logger>().i(response.body);
      if(response.statusCode==200){
        progressDialog.dismiss();
        return feedback.FeedbackListFromJson(response.body);
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