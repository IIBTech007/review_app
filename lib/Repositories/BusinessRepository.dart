import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:review_app/Interfaces/IBusinessRepository.dart';
import 'package:review_app/Models/BusinessViewModel.dart';
import 'package:http/http.dart'as http;
import 'package:review_app/Utils/Locator.dart';
import 'package:review_app/Utils/Utils.dart';
class BusinessRepository extends IBusinessRepository{
  @override
  Future<void> addBusiness(BusinessViewModel businessViewModel, BuildContext context) async{
    ArsProgressDialog progressDialog = ArsProgressDialog(
        context,
        blur: 2,
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 500));
    try{
      //progressDialog.show();
      var res=await http.post(Utils.baseUrl()+"Business/CreateBusiness",body:BusinessViewModel.BusinessViewModelToJson(businessViewModel),headers: {"Content-Type":"application/json","Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
      progressDialog.dismiss();
      locator<Logger>().i(BusinessViewModel.BusinessViewModelToJson(businessViewModel));
      if(res.statusCode==200)
      {
        Utils.showSuccess(context,"Business Added");
        Navigator.pop(context,"Refresh");
      }else if(res.body!=null&&res.body.isNotEmpty){
        locator<Logger>().i(res.body.trim());
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
  Future<List<BusinessViewModel>> getBusinessByOwner(BuildContext context) async{
    try{
      var response= await http.get(Utils.baseUrl()+"Business/GetBusinessByOwner",headers: {"Authorization":"Bearer ${locator<GetStorage>().read("token")}"});
      if(response.statusCode==200){
        locator<Logger>().i(BusinessViewModel.BusinessListFromJson(response.body));
        return BusinessViewModel.BusinessListFromJson(response.body);
      }else if(response.body!=null&&response.body.isNotEmpty){
        Utils.showError(context,response.body);
      }else
        Utils.showError(context,response.statusCode.toString());
    }catch(e){
      Utils.showError(context,e.toString());
    }
    return null;
  }

  @override
  Future<void> updateBusiness(BusinessViewModel businessViewModel, BuildContext context) async{

  }

  @override
  Future<void> changeVisibility(int id) {

  }


}