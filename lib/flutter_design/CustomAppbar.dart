import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  List<BottomNavigationBarItem> list;

  CustomAppbar() {
    list = [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: Text(
            "Explore",
            style: TextStyle(color: Colors.black),
          )),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          title: Text(
            "Watches",
            style: TextStyle(color: Colors.black),
          )),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.local_offer,
            color: Colors.black,
          ),
          title: Text(
            "Deals",
            style: TextStyle(color: Colors.black),
          )),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          title: Text(
            "Notifications",
            style: TextStyle(color: Colors.black),
          ))
    ];
  }

  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: BottomNavigationBar(
        items: widget.list,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
