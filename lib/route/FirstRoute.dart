import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Builder(
          builder: (context) =>
              Center(
                child: Column(
                    children: <Widget>[
                RaisedButton(
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
                  _navigateAndDisplaySelection(context);
                },
              ),
          RaisedButton(
            child: Text('Open Network call'),
            onPressed: () {
              Navigator.pushNamed(context, '/network');
            },
          ),
          RaisedButton(
          child: Text('Open Login page'),
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
    )],
    )
    )
    ,
    )
    );
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    User user = new User(name: 'Ramesh', age: 18);
    final result =
    await Navigator.pushNamed(context, '/second', arguments: user);

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('$result'),
    ));
  }
}

class User {
  final String name;
  final int age;

  User({this.name, this.age});
}
