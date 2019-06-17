import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FirstRoute.dart';

class SecondRoute extends StatelessWidget {
  String name;

  SecondRoute(this.name);
  User user;

  @override
  Widget build(BuildContext context) {


    RouteSettings settings = ModalRoute.of(context).settings;
    user = settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('${this.name}'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context," set Result as start activity for result in android ");
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
