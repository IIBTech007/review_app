import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:review_app/AppScreens/Admin/Business/AddBusiness.dart';
import 'package:review_app/AppScreens/Admin/Business/BusinessList.dart';
import 'package:review_app/AppScreens/Admin/Profile/ProfileScreen.dart';
import 'file:///C:/Users/IIB/AndroidStudioProjects/review_app/lib/AppScreens/WelcomeScreens/SplashScreen.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

