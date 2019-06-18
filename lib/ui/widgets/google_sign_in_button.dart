import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  GoogleSignInButton({this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Image _buildLogo() {
      return Image.asset(
        "assets/images/g_logo.png",
        height: 15.0,
        width: 15.0,
      );
    }

    Opacity _buildText() {
      return Opacity(
        opacity: 0.54,
        child: Text(
          "Sign in with Google",
          style: TextStyle(color: Colors.black, fontSize: 13.0),
        ),
      );
    }

    return MaterialButton(
      onPressed: this.onPressed,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildLogo(),
          SizedBox(width: 4.0),
          _buildText(),
        ],
      ),
    );
  }
}
