import 'package:flutter/material.dart';

ThemeData buildTheme() {
  // We're going to define all of our font styles
  // in this method:
  TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline: base.headline.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 40.0,
        color: const Color(0xFF807A6B),
      ),
      // New code:
      // Used for the recipes' title:
      title: base.title.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 15.0,
        color: const Color(0xFF807A6B),
      ),
      // Used for the recipes' duration:
      caption: base.caption.copyWith(
        color: const Color(0xFFCCC5AF),
      ),

      //we can used it to details text??
      display1: base.display1.copyWith(
        color: const Color(0xFFCCC5AF),
      ),
    );
  }

  // We want to override a default light blue theme.
  final ThemeData base = ThemeData.light();

  // And apply changes on it:
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    // New code:
    primaryColor: Colors.blue,//const Color(0xFF1E88E5),
    indicatorColor: Colors.lightBlueAccent,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    accentColor: Colors.blueAccent,
    iconTheme: IconThemeData(
      color: Colors.blue,
      size: 20.0,
    ),
    buttonColor: Colors.white,
  );
}
