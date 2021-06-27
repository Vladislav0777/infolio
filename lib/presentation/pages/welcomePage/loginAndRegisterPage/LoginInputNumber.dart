import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infolio/presentation/pages/welcomePage/LoginButton.dart';

class LoginInputNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageLogoInfolio = AssetImage('images/infolioGreen.png');
    const Color mainColor = Color(0xff4cb062);
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: imageLogoInfolio),
            SizedBox(
              height: 54,
            ),
            Text('LOGIN',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 18,
            ),
            Container(
              width: 350.0,
              height: 50,
              padding: new EdgeInsets.only(top: 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Username",
                  border: InputBorder.none,
                ),
                obscureText: false,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              width: 350.0,
              height: 50,
              padding: new EdgeInsets.only(top: 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: InputBorder.none,
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            LoginButton(),
            SizedBox(
              height: 5,
            ),
            Text('Forgot password ?',
                style: TextStyle(
                    fontSize: 14,
                    color: mainColor)),
          ],
        )),
      ),
    );
  }
}
