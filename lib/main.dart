import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:review_app/AppScreens/Admin/Home/HomeScreen.dart';
import 'package:review_app/AppScreens/WelcomeScreens/OnBoardingScreen.dart';
import 'AppScreens/Admin/BottomNavBar/BottomNavBar.dart';
import 'AppScreens/WelcomeScreens/OnBoardingScreen.dart';
import 'AppScreens/Admin/Feedbacks/IndividualFeedbacks.dart';
import 'Utils/Locator.dart';

void main() {
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

