import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:review_app/components/colorConstants.dart';


class NewPasswordScreen extends StatefulWidget {
  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool isVisible= true;
  bool isVisible2= true;
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
                            color: color1,
                            elevation: 10,
                            child: Container(
                              width: 400,
                              height: 280,
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
                                        'NEW PASSWORD',
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
                                        'Enter New Password...',
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
                                      //controller: password,
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

                                        labelText: "New Password",
                                        labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),
                                        suffixIcon: IconButton(icon: Icon(isVisible?Icons.visibility:Icons.visibility_off,color: color3,size: 27),onPressed: () {
                                          setState(() {
                                            if(isVisible){
                                              isVisible= false;
                                            }else{
                                              isVisible= true;
                                            }
                                          });
                                        },),//Icon(Icons.https,color: yellowColor,size: 27,)
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      //controller: password,
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
                                        labelText: "Confirm Password",
                                        labelStyle: TextStyle(color: color3, fontWeight: FontWeight.bold),
                                        suffixIcon: IconButton(icon: Icon(isVisible2?Icons.visibility:Icons.visibility_off,color: color3,size: 27),onPressed: () {
                                          setState(() {
                                            if(isVisible2){
                                              isVisible2= false;
                                            }else{
                                              isVisible2= true;
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
                    ],
                  ),
                  Positioned(
                    top: 600,
                    left: 30,
                    right: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> NewLoginScreen()));
                        },
                        child: Center(
                          child: Card(
                            elevation: 10,
                            color: color3,
                            child: Container(
                              height: 55,
                              width: 220,
                              decoration: BoxDecoration(

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
