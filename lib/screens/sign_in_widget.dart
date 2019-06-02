import 'package:flutter/material.dart';
import './home.dart';

class SignInWidget extends StatelessWidget {
  void _twitterPressed(BuildContext context) {
    print('Twitter');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Home()),
    );
  }

  void _googlePressed(BuildContext context) {
    print('Google');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 246, 246, 246),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 56,
              child: Image.asset(
                "assets/images/group.png",
                fit: BoxFit.none,
              ),
            ),
            Container(
              child: Text(
                "Pensieve",
                style: TextStyle(
                  color: Color.fromARGB(222, 0, 0, 0),
                  fontSize: 60.96,
                  letterSpacing: -0.5,
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 278,
                height: 43,
                margin: EdgeInsets.only(top: 81),
                child: RaisedButton(
                  onPressed: () => this._twitterPressed(context),
                  color: Color(0xFF38A1F3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "SIGN IN WITH TWITTER",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 278,
                height: 43,
                margin: EdgeInsets.only(top: 27),
                child: RaisedButton(
                  onPressed: () => this._googlePressed(context),
                  color: Color(0xFF4285F4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "SIGN IN WITH GOOGLE",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
