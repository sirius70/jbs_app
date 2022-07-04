import 'package:flutter/material.dart';
import 'package:jbs_app/admin/admin_profile.dart';
import 'package:jbs_app/employee_screens/employee_welcome_1.dart';
import 'package:jbs_app/manager/home.dart';
import 'package:get/get.dart';

import '../api/access.dart';
import '../models/profile_model.dart';
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
                // Navigator.push(context,
                //     MaterialPageRoute(builder:
                //         (context)=>employeeWelcome()));
                access().profile().then((value) async{
                  if(value["success"]) {
                    ProfileApi profile = await ProfileApi.fromJson(value);
                    final name = profile.data[0].name;
                    Storage.set_name(name);
                  }
                });
                Get.to(employeeWelcome());
              },
              child: Text("Employee", style: TextStyle(
                  color: Color(0xff005993), letterSpacing: 1,
                  fontSize: 40
              ),),
            ),

            SizedBox(height: 30,),

            GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder:
                //         (context) => Home2(empId: Storage.get_adminEmpID().toString(),
                //           location: Storage.get_location().toString(),
                //         name: Storage.get_name().toString(),)));
                access().profile().then((value) async{
                  if(value["success"]) {
                    ProfileApi profile = await ProfileApi.fromJson(value);
                    final name = profile.data[0].name;
                    Storage.set_name(name);
                  }
                });
                Get.to(Home2(empId: Storage.get_adminEmpID().toString(),
                  location: Storage.get_location().toString(),));
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
          // Navigator.push(context,
          //     MaterialPageRoute(builder:
          //         (context) => adminProfile()));
          access().profile().then((value) async{
            if(value["success"]) {
              ProfileApi profile = await ProfileApi.fromJson(value);
              final name = profile.data[0].name;
              Storage.set_name(name);
            }
          });
          Get.to(adminProfile());
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
