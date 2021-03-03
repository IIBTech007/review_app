import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_app/Controllers/AccountController.dart';
import 'package:review_app/Screens/WelcomeScreen/NewLoginScreen.dart';
import 'package:review_app/Utils/Utils.dart';
import 'package:review_app/components/colorConstants.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                      SizedBox(height: 40,),
                      Text(
                        'TASTE CLICKS',
                        style: new TextStyle(
                          fontSize: 40.0,
                          color: color4,
                          fontWeight: FontWeight.bold,
                          //foreground: Paint()..shader = linearGradient2
                        ),
                      ),
                      SizedBox(height: 10,),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Card(
                            elevation: 10,
                            color: color1,
                            child: Container(

                              width: 400,
                              height: 580,
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10),
                                  //color: color3,
                                  // border: Border.all(
                                  //     color: color3,
                                  //     width: 0
                                  // )
                              ),
                              child: Column(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'SIGN-UP',
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
                                        'Create an Account to Enter...',
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
                                      controller: accountController.nameTextEditingController,
                                      style: TextStyle(color: color4,fontWeight: FontWeight.bold),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: color3, width: 1.0)
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: color3, width: 1.0)
                                        ),
                                        labelText: "Name",
                                        labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),
                                        suffixIcon: Icon(Icons.assignment_ind,color: color3,size: 27,),
                                      ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
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
                                      obscureText: false,
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
                                        suffixIcon: IconButton(icon: Icon(Icons.visibility,color: color3,size: 27)),//Icon(Icons.https,color: yellowColor,size: 27,)
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: accountController.phoneTextEditingController,
                                      style: TextStyle(color: color4,fontWeight: FontWeight.bold),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: color3, width: 1.0)
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: color3, width: 1.0)
                                        ),
                                        labelText: "Phone",
                                        labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),
                                        suffixIcon: Icon(Icons.add_call,color: color3,size: 27,),
                                      ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: accountController.cityTextEditingController,
                                      style: TextStyle(color: color4,fontWeight: FontWeight.bold),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: color3, width: 1.0)
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: color3, width: 1.0)
                                        ),
                                        labelText: "City",
                                        labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),
                                        suffixIcon: Icon(Icons.add_location_alt_outlined,color: color3,size: 27,),
                                      ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: accountController.countryTextEditingController,
                                      style: TextStyle(color: color4,fontWeight: FontWeight.bold),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: color3, width: 1.0)
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: color3, width: 1.0)
                                        ),
                                        labelText: "Country",
                                        labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),
                                        suffixIcon: Icon(Icons.account_balance,color: color3,size: 27,),
                                      ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ),
                      SizedBox(height: 60,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already Have Account?',
                                  style: new TextStyle(
                                    fontSize: 17.0,
                                    color: color4,
                                    fontWeight: FontWeight.bold,
                                    //foreground: Paint()..shader = linearGradient2
                                  ),
                                ),
                                SizedBox(width: 4,),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> NewLoginScreen()));
                                  },
                                  child: Text(
                                    'Login',
                                    style: new TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 20.0,
                                      color: color3,
                                      fontWeight: FontWeight.bold,
                                      //foreground: Paint()..shader = linearGradient2
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 770,
                    left: 30,
                    right: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: (){
                          if(accountController.nameTextEditingController.text == null || accountController.nameTextEditingController.text.isEmpty){
                            Utils.showError(context, "Name Required");
                          }else if(accountController.emailTextEditingController.text == null || accountController.emailTextEditingController.text.isEmpty){
                            Utils.showError(context, "Email Required");
                          }else if(!Utils.validateEmail(accountController.emailTextEditingController.text)){
                            Utils.showError(context, "Email Not Valid");
                          }  else if(accountController.passwordTextEditingController.text == null || accountController.passwordTextEditingController.text.isEmpty){
                            Utils.showError(context, "Password Required");
                          } else if(!Utils.validateStructure(accountController.passwordTextEditingController.text)) {
                            Utils.showError(context, "password contain 1 upper case 1 num and 1 special chracter");
                          }else if(accountController.phoneTextEditingController.text == null || accountController.phoneTextEditingController.text.isEmpty){
                            Utils.showError(context, "Phone is Required");
                          }else if(accountController.cityTextEditingController.text == null || accountController.cityTextEditingController.text.isEmpty){
                            Utils.showError(context, "City is Required");
                          }else if(accountController.countryTextEditingController.text == null || accountController.countryTextEditingController.text.isEmpty){
                            Utils.showError(context, "Country is Required");
                          }else{
                            accountController.RegisterUser(context);
                          }
                        },
                        child: Center(
                          child: Container(
                            height: 55,
                            width: 220,

                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26.withOpacity(0.25),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
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
                              child: Text("Sign Up", style: TextStyle(
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
                ],
              )
          )
      ),
    );
  }
}
