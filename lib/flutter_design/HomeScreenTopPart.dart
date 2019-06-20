

import 'package:flutter/material.dart';

import 'package:flutter_app/flutter_design/ChoiceChip.dart';
import 'package:flutter_app/flutter_design/CustomShapeClipper.dart';





Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF272C);
List<String> locations = ["Gulmi(Nepal)", "New delhi( India)"];

const TextStyle dropDownLableStyle =
TextStyle(color: Colors.white, fontSize: 14.0);
const TextStyle dropDownMenuItemStyle =
TextStyle(color: Colors.black, fontSize: 16.0);


ThemeData appTheme = ThemeData(
  primaryColor: Colors.orange,
);

class HomeScreenTopPart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenTopPostScreen();
}
class _HomeScreenTopPostScreen extends State<HomeScreenTopPart> {
  var selectedIndex = 0;
  bool isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 370,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  secondColor,
                  firstColor,
                ])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        itemBuilder: (BuildContext context) =>
                        <PopupMenuItem<int>>[
                          PopupMenuItem(
                            child: Text(
                              locations[0],
                              style: dropDownMenuItemStyle,
                            ),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text(
                              locations[1],
                              style: dropDownMenuItemStyle,
                            ),
                            value: 1,
                          )
                        ],
                        child: Row(
                          children: <Widget>[
                            Text(
                              locations[selectedIndex],
                              style: dropDownLableStyle,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  "Where would you want to go?",
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      style: dropDownMenuItemStyle,
                      controller: TextEditingController(
                        text: locations[0],
                      ),
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 14),
                          border: InputBorder.none,
                          suffix: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: CustomChoiceChip(
                        Icons.flight_takeoff,
                        "Flights",
                        isFlightSelected,
                      ),
                      onTap: () {
                        setState(() {
                          isFlightSelected = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        child: CustomChoiceChip(
                            Icons.hotel, "Hotels", !isFlightSelected),
                        onTap: () {
                          setState(() {
                            isFlightSelected = false;
                          });
                        })
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
