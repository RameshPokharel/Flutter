import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Route'),
        ),
        body: Builder(
          builder: (context) => Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 55.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: MaterialButton(
                        onPressed: () {
                          _navigateAndDisplaySelection(context);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                                child: Text(
                              "Open route",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            )),
                          ],
                        ),
                        /* GestureDetector(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              height: 55.0,
                              child: Text("Google",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17.0)),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          )*/
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 55.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/network');
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                                child: Text(
                              "Open Network call",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 55.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: MaterialButton(
                        onPressed: () {
                          _checkLog(context);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                                child: Text(
                              "Open Home",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }

  _checkLog(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoged = (prefs.getBool('isLog') ?? false);
    if (!isLoged)
      Navigator.pushNamed(context, '/login');
    else
      Navigator.pushNamed(context, '/home');
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
