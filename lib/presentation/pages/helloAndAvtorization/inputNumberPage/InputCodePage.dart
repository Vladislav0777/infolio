import 'package:flutter/material.dart';
import 'package:infolio/presentation/pages/helloAndAvtorization/inputNumberPage/ButtonSendToEmail.dart';
import 'package:infolio/presentation/pages/helloAndAvtorization/inputNumberPage/ButtonSendToNumber.dart';
import 'package:infolio/presentation/pages/helloAndAvtorization/inputNumberPage/PhoneNumberInput.dart';
import 'package:infolio/presentation/pages/welcomePage/LoginButton.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// ignore: use_key_in_widget_constructors
class InputCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var darkTheme = ThemeData.dark().copyWith(primaryColor: Colors.blue);
    final imageLogoInfolio = AssetImage('images/infolioGreen.png');
    const mainColor = Color(0xffF5F6FA);
    const greenColor = Color(0xff4cb062);
    return MaterialApp(
      title: 'Demo',
      color: mainColor,
      darkTheme: darkTheme,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: mainColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: imageLogoInfolio),
              SizedBox(
                height: 54,
              ),
              Text('Input Verification Code                               ',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 9,
              ),
              Text('Verification code already sent via SMS                                    ',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black)),
              SizedBox(
                height: 18,
              ),
              PhoneNumberInput(),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                height: 15,
              ),
              _TimerCode(),
              SizedBox(
                height: 15,
              ),
              LoginButton(),
              SizedBox(
                height: 18,
              ),
              Text('Send it again?', style: TextStyle(color: greenColor),),
            ],
          ),
        )
      ),
    );
  }
}

class _TimerCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: 360,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('03:55',
                  style: TextStyle(fontSize: 14),)
              ],
            )));
  }
}
