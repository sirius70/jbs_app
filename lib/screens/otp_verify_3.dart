import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jbs_app/screens/onboarding_4.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class otpVerify extends StatefulWidget {
  const otpVerify({Key? key}) : super(key: key);

  @override
  State<otpVerify> createState() => _otpVerifyState();
}

class _otpVerifyState extends State<otpVerify> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 130,),
            GradientText(
              'JBS', textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 75.0,
                fontWeight: FontWeight.bold
              ),
              colors: [
                Color(0xffFFC700),
                Color(0xffFF0000),
              ],
            ),
           // Image.asset("assets/images/jbs.jpg"),

            SizedBox(height: MediaQuery.of(context).size.height*0.08,),
            Padding(padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("OTP VERIFICATION",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15, letterSpacing: 1
                    ),),

                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter the OTP sent to - ",
                        style: TextStyle(
                            fontSize: 12.5,
                        ),),
                      Text("+91-12345 67890",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.5,
                        ),),
                    ],
                  ),
                ],
              ),
            ),


            Padding(padding: EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _textFieldOTP(first: true, last: false),
                  _textFieldOTP(first: false, last: false),
                  _textFieldOTP(first: false, last: false),
                  _textFieldOTP(first: false, last: true),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text("00:20 Sec", style: TextStyle(
                color: Color(0xff464646),
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't receive code? ", style: TextStyle(
                    color: Color(0xff5A5A5A)
                ),),
                GestureDetector(
                  onTap: (){},
                  child: Text("Re-send",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2980B9)
                    ),),
                )
              ],
            ),

            SizedBox(height: 50,),

            Container(
              // decoration: BoxDecoration(
              //   color: Color(0xffFF0000)
              // ),
              height: MediaQuery.of(context).size.width*0.14,
              width: MediaQuery.of(context).size.width*0.8,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>onBoarding()));
                },
                child: Text("Submit"),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(color: Color(0xffFF0000))
                        )
                    ),
                    backgroundColor: MaterialStateProperty.all(Color(0xffFF0000),)
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: Color(0xffEFEFEF),
          borderRadius: BorderRadius.circular(12)
      ),
      width: 55,
      child: TextField(
        // autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: true,
        readOnly: false,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          fillColor: Color(0xffEFEFEF),
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Color(0xffEFEFEF)),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Color(0xffEFEFEF)),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}




