import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/route/FirstRoute.dart';
import 'package:flutter_app/route/SecondRoute.dart';
import 'package:flutter_app/ui/screens/Home.dart';
import 'package:flutter_app/ui/screens/LoginPage.dart';
import 'package:flutter_app/ui/theme.dart';

import 'flutter_design/FlightList.dart';
import 'flutter_design/FlutterDesingApp.dart';
import 'network/NetworkDataCall.dart';
import 'network/NetworkPictureCall.dart';

class RecipesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: buildTheme(),
      /*ThemeData(
        primarySwatch: Colors.blue,
      )*/
      debugShowCheckedModeBanner: false,
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
     // initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => FirstRoute(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondRoute("Hello Hello"),
        '/network': (context) => NetworkDataCall(post: fetchPost()),
        '/networkPhoto': (context) => NetworkPictureCall(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomeScreen(),
        '/design': (context) => FlutterDesignApp(),
        '/flight': (context) => FlightList(),
      },
    );
  }
}
