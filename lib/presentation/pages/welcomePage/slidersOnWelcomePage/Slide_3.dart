import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Slide_3 extends StatelessWidget {
  const Slide_3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome5',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'This is your personal assistant to support your finance, ',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
        Text(
          'enjoy the services!',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),

      ],
    );
  }
}