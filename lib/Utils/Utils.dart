import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';


class Utils{
   static String baseUrl(){
    // return "https://foodbooks.conveyor.cloud/api/";
     return "http://192.168.10.12:45457/api/";
   }
   static bool validateStructure(String value){
     RegExp regExp = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{6,}$');
     return regExp.hasMatch(value);
   }
   static bool validateEmail(String value){
     RegExp regExp=  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
     return regExp.hasMatch(value);
   }
   static Future<bool> check_connectivity () async{
     bool result = await DataConnectionChecker().hasConnection;
     return result;
   }
   static dynamic myEncode(dynamic item){
     if(item is DateTime)
       return item.toIso8601String();
   }
   static void showSuccess(BuildContext context,String message){
     Flushbar(
       backgroundColor: Colors.green,
       duration: Duration(seconds: 3),
       message: message,
     ).show(context);

   }
   static void showError(BuildContext context,String message){
     Flushbar(
       backgroundColor: Colors.red,
       duration: Duration(seconds: 3),
       message: message,
     ).show(context);
   }
   static Map<String, dynamic> parseJwt(String token) {
     final parts = token.split('.');
     if (parts.length != 3) {
       throw Exception('invalid token');
     }

     final payload = _decodeBase64(parts[1]);
     final payloadMap = json.decode(payload);
     if (payloadMap is! Map<String, dynamic>) {
       throw Exception('invalid payload');
     }

     return payloadMap;
   }
   static String _decodeBase64(String str) {
     String output = str.replaceAll('-', '+').replaceAll('_', '/');

     switch (output.length % 4) {
       case 0:
         break;
       case 2:
         output += '==';
         break;
       case 3:
         output += '=';
         break;
       default:
         throw Exception('Illegal base64url string!"');
     }

     return utf8.decode(base64Url.decode(output));
   }
   static String getQuestionType(int id){
     if(id==1){
       return "Star Rating";
     }else if(id==2){
       return "Yes/No";
     }else if(id==3){
       return "Radio Button";
     }else if(id==4){
       return "Numbering";
     }
   }
   static Future<File> getImage() async {
     var image = await ImagePicker.pickImage(source: ImageSource.gallery);
     return image;
   }
   static void shareImage(BuildContext context,Uint8List pngBytes) async{
     try{
       var rng = new Random();

       Directory tempDir = await getTemporaryDirectory();

       String tempPath = tempDir.path;

       File file = new File('$tempPath'+ (rng.nextInt(10000)).toString() +'.png');

       await file.writeAsBytes(pngBytes);
       Share.shareFiles([file.path], text:"Please Scan this qr code to get details");
     }catch(e){
       showError(context,e.toString());
     }
   }
   static Widget getRatingType(int type){
     if(type==1){
       return Center(
         child: RatingBar.builder(
           initialRating: 0,
           itemCount: 5,
           itemBuilder: (context, index) {
             switch (index) {
               case 0:
                 return Icon(
                   Icons.sentiment_very_dissatisfied,
                   color: Colors.red,
                 );
               case 1:
                 return Icon(
                   Icons.sentiment_dissatisfied,
                   color: Colors.redAccent,
                 );
               case 2:
                 return Icon(
                   Icons.sentiment_neutral,
                   color: Colors.amber,
                 );
               case 3:
                 return Icon(
                   Icons.sentiment_satisfied,
                   color: Colors.lightGreen,
                 );
               case 4:
                 return Icon(
                   Icons.sentiment_very_satisfied,
                   color: Colors.green,
                 );
             }
           },
           onRatingUpdate: (rating) {
             print(rating);
           },
         ),
       );
     }else if(type==2){
       return Column(
         mainAxisSize: MainAxisSize.min,
         children: <Widget>[
           _myRadioButton(
             title: "Yes",
             value: 5,
           //  onChanged: (newValue) => setState(() => _groupValue = newValue),
           ),
           _myRadioButton(
             title: "No",
             value: 1,
            // onChanged: (newValue) => setState(() => _groupValue = newValue),
           ),
         ],
       );
     }
   }
 static  Widget _myRadioButton({String title, int value, Function onChanged}) {
     return RadioListTile(
       value: value,
       groupValue: "groupValue",
       onChanged: onChanged,
       title: Text(title),
     );
   }
}