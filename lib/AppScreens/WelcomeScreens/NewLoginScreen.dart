import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_app/Controllers/AccountController.dart';
import 'file:///C:/Users/IIB/AndroidStudioProjects/review_app/lib/AppScreens/WelcomeScreens/ForgotPassword.dart';
import 'package:review_app/Utils/Utils.dart';
import 'package:review_app/components/colorConstants.dart';


class NewLoginScreen extends StatefulWidget {
  @override
  _NewLoginScreenState createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  bool isVisible= true;
  final  accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       color: color1,
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
       child: SingleChildScrollView(
         child: Stack(
           children: [
             Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 60),
                   child: Row(
                     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       IconButton(
                         icon: Icon(Icons.arrow_back, color: color3,size:30),
                         onPressed: (){
                           Navigator.pop(context);
                         },
                       ),
                     ],
                   ),
                 ),
                 SizedBox(height: 70,),
                 Text(
                   'TASTE CLICKS',
                   style: new TextStyle(
                     fontSize: 50.0,
                     color: color4,
                     fontWeight: FontWeight.bold,
                     //foreground: Paint()..shader = linearGradient2
                   ),
                 ),
                 SizedBox(height: 100,),
                 Center(
                   child: Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: Card(
                       elevation: 10,
                         color: color1,
                       child: Container(
                         width: 400,
                         height: 280,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           //color: color3,
                           //   border: Border.all(
                           //       color: color3,
                           //       width: 2
                           //   )
                         ),
                         child: Column(
                           children: [
                             Center(
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text(
                                   'LOGIN',
                                   style: new TextStyle(
                                     fontSize: 30.0,
                                     color: color3,
                                     fontWeight: FontWeight.bold,
                                     //foreground: Paint()..shader = linearGradient2
                                   ),
                                 ),
                               ),
                             ),
                             Center(
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text(
                                   'Sign-In to Continue...',
                                   style: new TextStyle(
                                     fontSize: 20.0,
                                     color: color4,
                                     fontWeight: FontWeight.bold,
                                     //foreground: Paint()..shader = linearGradient2
                                   ),
                                 ),
                               ),
                             ),
                             SizedBox(height: 10,),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: TextFormField(
                                 controller: accountController.emailTextEditingController,
                                 style: TextStyle(color: color4,fontWeight: FontWeight.bold),
                                 obscureText: false,
                                 decoration: InputDecoration(
                                   focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(color: color3, width: 1.0)
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                       borderSide: BorderSide(color: color3, width: 1.0)
                                   ),
                                   labelText: "Email",
                                   labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),
                                   suffixIcon: Icon(Icons.email,color: color3,size: 27,),
                                 ),
                                 textInputAction: TextInputAction.next,
                               ),
                             ),

                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: TextFormField(
                                 controller: accountController.passwordTextEditingController,
                                 style: TextStyle(color: color4,fontWeight: FontWeight.bold),
                                 obscureText: isVisible,
                                 keyboardType: TextInputType.visiblePassword,
                                 decoration: InputDecoration(
                                   focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(color: color3, width: 1.0)
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                       borderSide: BorderSide(color: color3, width: 1.0)
                                   ),

                                   labelText: "Password",
                                   labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),
                                   suffixIcon: IconButton(icon: Icon(accountController.isVisible?Icons.visibility:Icons.visibility_off,color: color3,size: 27),onPressed: () {
                                     setState(() {
                                       if(accountController.isVisible){
                                         accountController.isVisible= false;
                                       }else{
                                         accountController.isVisible= true;
                                       }
                                     });
                                   },),//Icon(Icons.https,color: yellowColor,size: 27,)
                                 ),

                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ),
               SizedBox(height: 100,),
                 Center(
                   child: InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPasswordScreen()));
                     },
                     child: Padding(
                       padding: const EdgeInsets.only(bottom: 20),
                       child: Text(
                         'Forgot Password?',
                         style: new TextStyle(
                           fontSize: 20.0,
                           color: color4,
                           fontWeight: FontWeight.bold,
                           //foreground: Paint()..shader = linearGradient2
                         ),
                       ),
                     ),
                   )
                 ),
               ],
             ),
             Positioned(
               top: 605,
               left: 30,
               right: 30,
               child: Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: InkWell(
                    onTap: (){
                    if(accountController.emailTextEditingController.text==null||accountController.emailTextEditingController.text.isEmpty){
                    Utils.showError(context, "Email is Required");
                    }else if(!Utils.validateEmail(accountController.emailTextEditingController.text)){
                    Utils.showError(context, "Email Format is Invalid");
                    }
                    else if(accountController.passwordTextEditingController.text==null||accountController.passwordTextEditingController.text.isEmpty){
                    Utils.showError(context, "Password is Required");
                    }else if(!Utils.validateStructure(accountController.passwordTextEditingController.text)){
                    Utils.showError(context, "Password must contain atleast one lower case,Upper case and special characters");
                    }else{
                    accountController.AuthenticateUser(context);
                    }
                    },
                   child: Center(
                     child: Card(
                       elevation: 10,
                         color: color3,
                       child: Container(
                         height: 55,
                         width: 220,

                         decoration: BoxDecoration(
                           color: color3,
                           // gradient: new LinearGradient(
                           //     colors: [
                           //       Color(0xff222831), Color(0xff393e46)
                           //     ]
                           // ),
                           borderRadius: BorderRadius.circular(10),
                           //border: Border.all(color: Color(0xfbb55400), width: 3)
                         ),
                         child: Center(
                           child: Text("Sign-In", style: TextStyle(
                             color: color1,
                             fontWeight: FontWeight.bold,
                             fontSize: 22,
                             //foreground: Paint()..shader = linearGradient
                           ),),
                         ),
                       ),
                     ),
                   ),
                 ),
               ),
             ),
           ],
         )
       )
     ),
    );
  }
}
