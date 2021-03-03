
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:review_app/Screens/WelcomeScreen/NewLoginScreen.dart';
import 'package:review_app/Screens/WelcomeScreen/SignUpScreen.dart';
import 'package:review_app/components/colorConstants.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color1,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 150,),
              Text(
                'TASTE CLICKS',
                style: new TextStyle(
                  fontSize: 50.0,
                  color: color4,
                  fontWeight: FontWeight.bold,
                  //foreground: Paint()..shader = linearGradient2
                ),
              ),
              SizedBox(height: 350,),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                  },
                  child: Card(
                    elevation: 10,
                    color: color1,
                    child: Container(
                      height: 55,
                      width: 370,
                      decoration: BoxDecoration(
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black26.withOpacity(0.25),
                          //     spreadRadius: 3,
                          //     blurRadius: 5,
                          //     offset: Offset(0, 2), // changes position of shadow
                          //   ),
                          // ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1.5,
                              color: color3
                          )
                      ),
                      child:  Center(
                        child: Text("Sign-Up", style: TextStyle(
                          //color: Color(0xffb55400),
                          color: color3,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          //foreground: Paint()..shader = linearGradient
                        ),),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> NewLoginScreen()));
              },
                  child: Card(
                    elevation: 10,
                      color: color3,
                    child: Container(
                      height: 55,
                      width: 370,
                      decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black26.withOpacity(0.25),
                        //     spreadRadius: 3,
                        //     blurRadius: 5,
                        //     offset: Offset(0, 3), // changes position of shadow
                        //   ),
                        // ],
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
            ],
          ),
        ),
      ),
    );
  }
}
