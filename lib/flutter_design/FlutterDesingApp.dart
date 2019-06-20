import 'package:flutter/material.dart';

import 'package:flutter_app/flutter_design/CityCard.dart';
import 'package:flutter_app/flutter_design/HomeScreenTopPart.dart';

ThemeData appTheme = ThemeData(
  primaryColor: Colors.orange,
);

class FlutterDesignApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[HomeScreenTopPart(), homeScreenBottomPart],
      ),
    );
  }
}

var homeScreenBottomPart = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Currently watched items",
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          Spacer(),
          Text(
            "View All",
            style: TextStyle(color: appTheme.primaryColor, fontSize: 14),
          ),
        ],
      ),
    ),
    Container(
        height: 226,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: cityCards,
        ))
  ],
);
List<CityCard> cityCards = [
  CityCard("assets/images/splash.jpg", "Kathmandu", "Apr 2018", "345", "456",
      "456"),
  CityCard(
      "assets/images/splash.jpg", "Butwal", "Mar 2018", "678", "908", "4577"),
  CityCard(
      "assets/images/profile.jpg", "Bhaira", "jun 2017", "463", "890", "5654"),
];