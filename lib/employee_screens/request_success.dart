import 'package:flutter/material.dart';

class requestSuccess extends StatelessWidget {
  const requestSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Request successful :)", textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff005993)
              ),),

            SizedBox(height: 30,),

            Image.asset("assets/images/tick.jpg"),

            SizedBox(height: 30,),

            Text("you will receive response from your manager \nshortly",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16)),

          ],
        ),
      ),
    );
  }
}

class requestSuccess1 extends StatelessWidget {
  const requestSuccess1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Request successful", textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff005993)
              ),),

            SizedBox(height: 30,),

            Image.asset("assets/images/tick.jpg"),

            SizedBox(height: 30,),

            Text("you will be contacted by the admin \nshortly",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16)),

          ],
        ),
      ),
    );
  }
}