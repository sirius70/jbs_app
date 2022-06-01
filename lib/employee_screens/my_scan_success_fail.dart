import 'package:flutter/material.dart';

class myScanSuccess extends StatelessWidget {
  const myScanSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Scan successful :)", textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff005993)
              ),),

            SizedBox(height: 30,),
            
            Image.asset("assets/images/tick.jpg"),

            SizedBox(height: 30,),

            Text("your attendance has been marked",
              style: TextStyle(fontSize: 16)),
            SizedBox(height: 10,),

            Text("Great! You're on time", style: TextStyle(
              color: Color(0xff0EAF00),
                fontSize: 16
            ),)

          ],
        ),
      ),
    );
  }
}



class myScanFail extends StatelessWidget {
  const myScanFail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Scan unsuccessful :(", textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff005993)
              ),),

            SizedBox(height: 30,),

            Image.asset("assets/images/fail.jpg"),

            SizedBox(height: 30,),

            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "your attendance has ",
                    style: TextStyle(
                      color: Colors.black,
                        fontSize: 16)),
                 TextSpan(
                    text: "not been",
                    style: TextStyle(
                        color: Color(0xffFF2E00),
                        fontSize: 16
                    )),

                TextSpan(
                    text: " marked",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16)),
              ]),
            ),
            SizedBox(height: 20,),

            Text("Please contact your manager", )

          ],
        ),
      ),
    );
  }
}
