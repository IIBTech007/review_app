import 'package:flutter/material.dart';
import 'package:review_app/AppScreens/Admin/Business/AddBusiness.dart';
import 'package:review_app/AppScreens/Admin/Business/BusinessList.dart';
import 'package:review_app/AppScreens/Admin/Profile/ProfileScreen.dart';
import 'file:///C:/Users/IIB/AndroidStudioProjects/review_app/lib/AppScreens/WelcomeScreens/SplashScreen.dart';

import 'Utils/Locator.dart';

void main() {
  SetupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BusinessList(),
    );
  }
}

