import 'package:flutter/material.dart';
import 'package:jbs_app/admin/admin2.dart';
import 'package:jbs_app/admin/admin_profile.dart';
import 'package:jbs_app/employee_screens/employee_welcome_1.dart';
import 'package:jbs_app/manager/home.dart';

import '../admin/admin1.dart';
import '../storage.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({Key? key,}) : super(key: key);

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select Mode", style: TextStyle(
                color: Color(0xff005993), letterSpacing: 1,
                fontSize: 18
            ),),

            SizedBox(height: 40,),



            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context)=>employeeWelcome()));
              },
              child: Text("Employee", style: TextStyle(
                  color: Color(0xff005993), letterSpacing: 1,
                  fontSize: 40
              ),),
            ),

            SizedBox(height: 30,),

            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context) => Home2(empId: Storage.get_adminEmpID().toString(),
                          location: Storage.get_location().toString(),
                        name: Storage.get_name().toString(),)));
              },
              child: Text("Manager", style: TextStyle(
                  color: Color(0xff005993), letterSpacing: 1,
                  fontSize: 50,
                  fontWeight: FontWeight.bold
              ),),
            ),

            SizedBox(height: 35,),

            GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) => adminProfile()));
        },
              child: Text("Admin", style: TextStyle(
                  color: Color(0xff005993), letterSpacing: 1,
                  fontSize: 40
              ),),
            ),


          ],
        ),
      ),
    );
  }
}
