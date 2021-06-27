import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infolio/presentation/pages/welcomePage/slidersOnWelcomePage/Slide_1.dart';
import 'package:infolio/presentation/pages/welcomePage/slidersOnWelcomePage/Slide_2.dart';
import 'package:infolio/presentation/pages/welcomePage/slidersOnWelcomePage/Slide_3.dart';
import 'package:infolio/presentation/pages/welcomePage/slidersOnWelcomePage/Slide_4.dart';
import 'package:infolio/presentation/pages/welcomePage/slidersOnWelcomePage/Slide_5.dart';
import 'LoginButton.dart';
import 'LogoGreen.dart';
import 'RegisterButton.dart';

class WelcomePage extends StatefulWidget {
  @override
  createState() => new WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                LogoGreen(),
                SizedBox(
                  height: 80,
                ),
                _WelcomePagee(),
                SizedBox(
                  height: 80,
                ),
                LoginButton(),
                SizedBox(
                  height: 20,
                ),
                RegisterButton(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
    );
  }
}

class _WelcomePagee extends StatefulWidget {
  @override
  WelcomePageeState createState() => WelcomePageeState();
}
class WelcomePageeState extends State<_WelcomePagee>{
  @override
  Widget build(BuildContext context) {
    var pageList = <Widget>[Slide_1(), Slide_2(), Slide_3(), Slide_4(), Slide_5()];
    int _currentPageIndex = 0;
    const Color mainColor = Color(0xff4cb062);

    _buildPageViewItem(Widget txt, {Color color = Colors.white}) {
      return Container(
        color: color,
        alignment: Alignment.center,
        child: txt
      );
    }
    final stringInfolio = AssetImage('images/string.png');
    final superStringInfolio = AssetImage('images/superString.png');

    return Expanded(
        child: Container(
          height: 100,
          width: 360,
      color: Colors.white,
          child: Stack(
            children: [
              PageView.builder(
                onPageChanged: (int index) {
                  setState(() {
                    _currentPageIndex = index % (pageList.length);
                  });
                },
                itemCount: 10000,
                itemBuilder: (context, index) {
                  return _buildPageViewItem(pageList[index % (pageList.length)]);
                },
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(pageList.length, (i) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: _currentPageIndex == i ?
                        Image (image: superStringInfolio) : Image (image: stringInfolio),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}


