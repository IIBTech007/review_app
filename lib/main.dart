import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:review_app/AppScreens/WelcomeScreens/NewOnBoardingScreen.dart';
import 'package:review_app/AppScreens/WelcomeScreens/OnBoardingScreen.dart';
import 'package:review_app/components/OnBoardingAnimation.dart';
import 'AppScreens/Admin/Business/BusinessReport.dart';
import 'AppScreens/Admin/Profile/ProfileScreen.dart';
import 'Utils/Locator.dart';

void main()async {
  GetStorage.init();
  SetupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}

