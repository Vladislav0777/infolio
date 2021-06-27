import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infolio/presentation/pages/welcomePage/loginAndRegisterPage/LoginInputNumber.dart';

import 'InputCodePage.dart';


class ButtonSendToNumber extends StatelessWidget {
  const ButtonSendToNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff4cb062);
    return InkWell(
      onTap: () {{Navigator.push<MaterialPageRoute>(context,
          MaterialPageRoute(builder: (context)=>InputCodePage()));
      }
      },
      child: Container(
        width: 70.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: mainColor,
          border: Border.all(color: mainColor, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(child: Text('Message', style: TextStyle(fontSize: 11, color: Colors.white),),),
      ),
    );
  }
}