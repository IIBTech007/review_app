import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:review_app/AppScreens/Admin/BottomNavBar/BottomNavBar.dart';
import 'package:review_app/AppScreens/Admin/Feedbacks/CommentWithPicture.dart';
import 'package:review_app/AppScreens/Admin/Feedbacks/FeedbackDetails.dart';
import 'package:review_app/AppScreens/Admin/Feedbacks/IndividualFeedbacks.dart';
import 'package:review_app/AppScreens/Admin/Home/HomeScreen.dart';
import 'package:review_app/AppScreens/Customer/BottomNavBar/BottomNavBar.dart';
import 'package:review_app/AppScreens/Customer/Details/DetailsScreen.dart';
import 'package:review_app/AppScreens/Customer/Details/NewDetailScreen.dart';
import 'package:review_app/AppScreens/Customer/Home/HomeScreen.dart';
import 'package:review_app/AppScreens/Customer/Home/SeeAllBusinesses.dart';
import 'package:review_app/AppScreens/WelcomeScreens/NewWelcomeScreens/OnBoardingScreen.dart';
import 'package:review_app/AppScreens/WelcomeScreens/SplashScreen.dart';
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
      home: CommentWithPicture(),
    );
  }
}

