import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infolio/presentation/pages/welcomePage/WelcomePage.dart';

Future<void> main() async {
  runApp(MyApp());
  Timer(Duration(seconds: 3), () {
    runApp(WelcomePage());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff4cb062);
    final imageLogoInfolio = AssetImage('images/infolioWhite.png');
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: mainColor,
        body: Center(
          child: Image(image: imageLogoInfolio),
        ),
      ),
    );
  }
}

