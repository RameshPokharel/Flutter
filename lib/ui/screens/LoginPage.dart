import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BoxDecoration _buildBackground() {
      return BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splash.jpg"),
          fit: BoxFit.cover,
        ),
      );
    }

    return Scaffold(
        /* appBar: AppBar(
          title: Text("Login page"),
        ),*/
        body: Container(
            decoration: _buildBackground(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.green),
                        child: Icon(
                          Icons.ac_unit,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 50.0, top: 50.0),
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.red),
                        child: Icon(
                          Icons.access_alarm,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50.0, top: 50.0),
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.blue),
                        child: Icon(
                          Icons.dashboard,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 70),
                        child: Text(
                          "Login page",
                          style: Theme.of(context).textTheme.headline,
/*
                          style: TextStyle(color: Colors.black, fontSize: 17.0),
*/
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, right: 20, left: 20),
                          child: Container(
                            alignment: Alignment.center,
                            height: 55.0,
                            child: Text("Sign in with Email",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0)),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 5, top: 10),
                          child: Container(
                            alignment: Alignment.center,
                            height: 55.0,
                            child: Text("Facebook",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0)),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 20, top: 10),
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 55.0,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed('/home');

                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "Sign in with google",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13.0),
                                  )),
                                ],
                              ),
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
                    ],
                  )
                ],
              ),
            )));
  }
}
