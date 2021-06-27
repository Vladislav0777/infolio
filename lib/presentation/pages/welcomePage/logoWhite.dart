import 'package:flutter/cupertino.dart';

class LogoWhite extends StatelessWidget {
  const LogoWhite({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logoWhite = AssetImage('images/infolioWhite.png');
    return Image(image: logoWhite);
  }
}