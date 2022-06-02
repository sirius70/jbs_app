import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:jbs_app/screens/otp_verify_3.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Positioned(
                top: -250,
                left: -100,
                child: Transform.rotate(
                  angle: -math.pi / 10.0,
                  child: Container(
                    width: 390,
                    height: 370,
                    decoration: BoxDecoration(
                     // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(300),
                        color: Color(0xff005993)
                    ),
                  ),
                )
            ),

            Positioned(
                top: -300,
                left: -130,
                child: Transform.rotate(
                  angle: -math.pi / 10.0,
                  child: Container(
                    width: 370,
                    height: 370,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(300),
                    ),
                  ),
                )
            ),

            Positioned(
                bottom: -320,
               left: -20,
                child: Transform.rotate(
                  angle: -math.pi / 10.0,
                  child: Container(
                    width: 380,
                    height: 370,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(300),
                        color: Color(0xff005993)
                    ),
                  ),
                )
            ),

            Positioned(
                bottom: -340,
               // left: -130,
                child: Transform.rotate(
                  angle: -math.pi / 10.0,
                  child: Container(
                    width: 360,
                    height: 370,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(300),
                    ),
                  ),
                )
            ),



            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Padding(padding: EdgeInsets.all(40),
                  child: Column(
                children: const [
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff005993)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff005993)),
                        ),
                        focusColor: Color(0xff005993),
                        label: Text("Name", style: TextStyle(
                          color: Color(0xff005993),)
                        )
                    ),
                    style: TextStyle(color: Color(0xff005993)),
                    cursorColor: Color(0xff005993),
                  ),

                  SizedBox(height: 20,),

                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff005993)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff005993)),
                        ),
                        focusColor: Color(0xff005993),
                        label: Text("Email/phone", style: TextStyle(
                          color:Color(0xff005993),)
                        )
                    ),
                    style: TextStyle(color: Color(0xff005993)),
                    cursorColor: Color(0xff005993),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            Container(
              // decoration: BoxDecoration(
              //   color: Color(0xffFF0000)
              // ),
              height: MediaQuery.of(context).size.width*0.12,
              width: MediaQuery.of(context).size.width*0.55,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>otpVerify()));
                },
                child: Text("Generate OTP", style: TextStyle(
                    color: Colors.white,
                  fontSize: 16
                ),),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(color: Color(0xff005993))
                        )
                    ),
                    backgroundColor: MaterialStateProperty.all(Color(0xff005993),)
                ),
              ),
            ),

]),

          ],
        ),
      ),
    );
  }

  void paint(Canvas canvas, Size size) {
    final angle = -math.pi / 4;
    Color paintColor = Color.fromRGBO(250, 154, 210, 1);
    Paint circlePaint = Paint()
      ..color = paintColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.save();
    canvas.translate(size.width * 0.5, size.height * 0.5);
    canvas.rotate(angle);
    canvas.drawOval(Rect.fromCenter(center: Offset.zero, width: 50, height: 100), circlePaint);
    canvas.restore();
  }
}


class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),

        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
          "title",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18
          ),
        ),
      ),
    );
  }
}