import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:review_app/Utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';



class networksOperation{

  // static Future<bool> signUp(BuildContext context,String firstName,String lastName,String email,String password,String address,String cellNo) async {
  //   ProgressDialog pd=ProgressDialog(context);
  //   pd.show();
  //   var body=jsonEncode({"firstname":firstName,
  //     "lastname":lastName,
  //     "email":email,
  //     "password":password,
  //     "confirmpassword":password,
  //     "address":address,
  //     "postcode":"aaa",
  //     "cellNo":cellNo,
  //     "country":"Abc",
  //     "city":address,
  //     //"storeid":"1",
  //     "roleid":9});
  //   try{
  //     var response=await http.post(Utils.baseUrl()+"account/register",body:body,headers: {"Content-type":"application/json"});
  //     print(response.body);
  //     print(response.statusCode.toString());
  //     if(response.statusCode==200){
  //       pd.hide();
  //       Utils.showSuccess(context, "Register Successfully");
  //       return true;
  //     }else if(response.body!=null){
  //       pd.hide();
  //       Utils.showError(context, response.body);
  //       return false;
  //     }else{
  //
  //       pd.hide();
  //       Utils.showError(context, "Some Error");
  //       return false;
  //     }
  //   }catch(e) {
  //     pd.hide();
  //     Utils.showError(context, e.toString());
  //     return false;
  //   }
  // }
  // static void signIn(BuildContext context,String email,String password,String admin) async {
  //   ProgressDialog pd=ProgressDialog(context);
  //   pd.show();
  //   var body=jsonEncode({"email":email,"password":password});
  //   try{
  //     List rolesAndStores =[],restaurantList=[];
  //     bool isCustomer =true;
  //     var response=await http.post(Utils.baseUrl()+"account/login",body:body,headers: {"Content-type":"application/json"});
  //     print(response.body);
  //     if(response!=null&&response.statusCode==200){
  //       pd.hide();
  //       List decoded = jsonDecode(response.body)['roles'];
  //       rolesAndStores.clear();
  //       restaurantList.clear();
  //       for(int i=0;i<decoded.length;i++){
  //         rolesAndStores.add(decoded[i]);
  //         restaurantList.add(decoded[i]['restaurant']);
  //       }
  //       print(rolesAndStores);
  //       var claims = Utils.parseJwt(jsonDecode(response.body)['token']);
  //       SharedPreferences.getInstance().then((prefs){
  //         prefs.setString("token", jsonDecode(response.body)['token']);
  //         prefs.setString("email", email);
  //         prefs.setString('userId', claims['nameid']);
  //         prefs.setString('nameid', claims['nameid']);
  //         // prefs.setString('isCustomer', claims['IsCustomerOnly']);
  //
  //
  //       });
  //       Utils.showSuccess(context, "Login Successful");
  //       print(claims['IsCustomerOnly'].toString()+"vfdgfdgfdgfdgdfgd");
  //       if(claims['IsCustomerOnly'] == "false"){
  //         if(decoded[0]['roleId']== 1){
  //
  //           Navigator.pushAndRemoveUntil(context,
  //               //MaterialPageRoute(builder: (context) => DashboardScreen()), (
  //               MaterialPageRoute(builder: (context) => RequestList(1)), (
  //                   Route<dynamic> route) => false);
  //         }
  //         else if(decoded[0]['roleId']==2){
  //           Navigator.pushAndRemoveUntil(context,
  //               //MaterialPageRoute(builder: (context) => DashboardScreen()), (
  //               MaterialPageRoute(builder: (context) => RestaurantScreen(restaurantList,2)), (
  //                   Route<dynamic> route) => false);
  //         }
  //         else{
  //           Navigator.pushAndRemoveUntil(context,
  //               //MaterialPageRoute(builder: (context) => DashboardScreen()), (
  //               MaterialPageRoute(builder: (context) => RoleBaseStoreSelection(rolesAndStores)), (
  //                   Route<dynamic> route) => false);
  //         }
  //
  //       }else{
  //         Navigator.pushAndRemoveUntil(context,
  //             MaterialPageRoute(builder: (context) => ClientNavBar()), (
  //                 Route<dynamic> route) => false);
  //       }
  //       print(response.body);
  //     }
  //     // else if(response.body!=null){
  //     //   pd.hide();
  //     //   Utils.showError(context, "Try Again");
  //     // }
  //     else{
  //       pd.hide();
  //       Utils.showError(context, "Please try Again");
  //     }
  //   }catch(e) {
  //     pd.hide();
  //     Utils.showError(context, "Error Found");
  //   }
  // }
}
