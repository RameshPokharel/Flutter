import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  String _contactText;

  GoogleSignIn _googleSignIn = new GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  checkLog() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLog', true);
    Navigator.pushNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      if (account != null) {
        checkLog();
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    _googleSignIn.disconnect();
  }

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
                                _handleSignIn();
                                /*  Navigator.of(context)
                                    .pushReplacementNamed('/home');*/
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
                      // _buildBody()
                    ],
                  )
                ],
              ),
            )));
  }
}
