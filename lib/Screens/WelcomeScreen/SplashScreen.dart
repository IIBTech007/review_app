
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:review_app/Screens/WelcomeScreen/NewLoginScreen.dart';
import 'package:review_app/Screens/WelcomeScreen/SignUpScreen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff222831),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 150,),
              Text(
                'THE REVIEWER',
                style: new TextStyle(
                  fontSize: 50.0,
                  color: Color(0xfff6f5f5),
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
                  child: Container(
                    height: 70,
                    width: 370,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                            width: 3,
                            color: Color(0xffb55400))
                    ),
                    child:  Center(
                      child: Text("Sign-Up", style: TextStyle(
                        //color: Color(0xffb55400),
                        color: Color(0xffb55400),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        //foreground: Paint()..shader = linearGradient
                      ),),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> NewLoginScreen()));
              },
                  child: Container(
                    height: 70,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Color(0xffb55400),
                      // gradient: new LinearGradient(
                      //     colors: [
                      //       Color(0xff222831), Color(0xff393e46)
                      //     ]
                      // ),
                      borderRadius: BorderRadius.circular(40),
                      //border: Border.all(color: Color(0xfbb55400), width: 3)
                    ),
                    child: Center(
                      child: Text("Sign-In", style: TextStyle(
                        color: Color(0xff222831),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        //foreground: Paint()..shader = linearGradient
                      ),),
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
