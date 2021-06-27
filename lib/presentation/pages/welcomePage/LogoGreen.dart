import 'package:flutter/cupertino.dart';

class LogoGreen extends StatelessWidget {
  const LogoGreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logoGreen = AssetImage('images/infolioGreen.png');
    return Image(image: logoGreen);
  }
}