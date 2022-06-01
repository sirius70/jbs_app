import 'package:flutter/material.dart';

class contractor6 extends StatelessWidget {
  const contractor6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('lib/images/tick.png')),
          SizedBox(
            height: 10,
          ),
          Text(
            'Please wait for a moment, \nyou will be excorted shortly',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text('Screen will be redirected\n to homescreen shortly'),
          )
        ],
      ),
    ));
  }
}
