import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:review_app/Screens/WelcomeScreen/NewPasswordScreen.dart';
import 'package:review_app/components/colorConstants.dart';


class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State< ForgotPasswordScreen> {
  bool isVisible= true;

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
                              height: 210,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  //color: color3,
                                  // border: Border.all(
                                  //     color: color3,
                                  //     width: 2
                                  // )
                              ),
                              child: Column(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'FORGOT PASSWORD',
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
                                        'Enter your Email to Continue...',
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
                                      //controller: email,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 100,),
                    ],
                  ),
                  Positioned(
                    top: 530,
                    left: 30,
                    right: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> NewPasswordScreen()));
                        },
                        child: Center(
                          child: Card(
                            color: color3,
                            elevation: 10,
                            child: Container(
                              height: 55,
                              width: 220,

                              decoration: BoxDecoration(
                                //color: color3,
                                // gradient: new LinearGradient(
                                //     colors: [
                                //       Color(0xff222831), Color(0xff393e46)
                                //     ]
                                // ),
                                borderRadius: BorderRadius.circular(10),
                                //border: Border.all(color: Color(0xfbb55400), width: 3)
                              ),
                              child: Center(
                                child: Text("Submit", style: TextStyle(
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
