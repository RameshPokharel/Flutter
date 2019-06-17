import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            //for simple route
            /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
*/
            //for named route
            //    Navigator.pushNamed(context, '/second');

            User user = new User(name: 'Ramesh', age: 18);
            Navigator.pushNamed(context, '/second', arguments: user);
          },
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User({this.name, this.age});
}
