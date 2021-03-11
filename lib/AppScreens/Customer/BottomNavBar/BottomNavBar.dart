
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:review_app/AppScreens/Admin/Home/HomeScreen.dart';
import 'package:review_app/AppScreens/Customer/Home/HomeScreen.dart';

class ClientBottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}
class _BottomNavBarState extends State<ClientBottomNavBar> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
            iconData: Icons.question_answer,
            title: "Reviews",
          ),
          TabData(iconData: Icons.home, title: "Home",),

          TabData(iconData: Icons.settings, title: "Settings"),

        ],
        initialSelection: 1,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return ClientHomeScreen();
      case 1:
        return ClientHomeScreen();
      default:
        return ClientHomeScreen();
    }
  }
}