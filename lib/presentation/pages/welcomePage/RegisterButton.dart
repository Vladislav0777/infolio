import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infolio/presentation/pages/helloAndAvtorization/inputNumberPage/InputNumberPage.dart';
import 'package:infolio/presentation/pages/welcomePage/WelcomePage.dart';


class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff4cb062);
    return InkWell(
      onTap: () {{Navigator.push<MaterialPageRoute>(context,
          MaterialPageRoute(builder: (context)=>WelcomePage()));
      }
      },
      child: Container(
        width: 360.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: mainColor, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(child: Text('Register', style: TextStyle(fontSize: 18.0, color: mainColor),),),
      ),
    );
  }
}