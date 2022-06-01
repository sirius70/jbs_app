import 'package:flutter/material.dart';
import 'package:jbs_app/employee_screens/employee_welcome_1.dart';
import 'package:jbs_app/manager/home.dart';

import '../admin/admin1.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({Key? key,}) : super(key: key);

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFECE2F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Text("Select Mode", style: TextStyle(
                  color: Colors.white, letterSpacing: 1,
                  fontSize: 18
              ),),
            ),

            SizedBox(height: 40,),

            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context)=>employeeWelcome()));
              },
              child: Text("Employee", style: TextStyle(
                  color: Colors.white, letterSpacing: 1,
                  fontSize: 40
              ),),
            ),

            SizedBox(height: 30,),

            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context) => Home2()));
              },
              child: Text("Manager", style: TextStyle(
                  color: Colors.white, letterSpacing: 1,
                  fontSize: 50,
                  fontWeight: FontWeight.bold
              ),),
            ),

            SizedBox(height: 35,),

            GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) => Admin1()));
        },
              child: Text("Admin", style: TextStyle(
                  color: Colors.white, letterSpacing: 1,
                  fontSize: 40
              ),),
            ),


            // TextButton(
            //     onPressed: () {
            //       // Navigator.push(context,
            //       //     MaterialPageRoute(builder: (context) {
            //       //       return DeliveryFrom();
            //       //     }));
            //     },
            //     style: ButtonStyle(
            //         padding: MaterialStateProperty.all(
            //             EdgeInsets.only(left: 50, right: 50)),
            //         foregroundColor: MaterialStateProperty.all(Colors.transparent),
            //         backgroundColor: MaterialStateProperty.all(Colors.transparent)),
            //     child: Text("Admin", style: TextStyle(
            //         color: Colors.white, letterSpacing: 1,
            //         fontSize: 25
            //     ),),)

          ],
        ),
      ),
    );
  }
}
