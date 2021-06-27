import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infolio/presentation/pages/helloAndAvtorization/inputNumberPage/pin.dart';
import 'package:infolio/presentation/pages/welcomePage/loginAndRegisterPage/LoginInputNumber.dart';

import '../../../../main.dart';


class ButtonSendToEmail extends StatelessWidget {
  const ButtonSendToEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color greenColor = Color(0xff4cb062);
    Color greenLightColor = Color(0xffE6F5EC);
    return InkWell(
      onTap: () {{Navigator.push<MaterialPageRoute>(context,
          MaterialPageRoute(builder: (context)=>MyApp2(isMaterial: true,)));
      }
      },
      child: Container(
        width: 70.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: greenLightColor,
          border: Border.all(color: greenLightColor, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(child: Text('Email', style: TextStyle(fontSize: 11.0, color: greenColor),),),
      ),
    );
  }
}