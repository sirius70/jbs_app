import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jbs_app/manager/more.dart';
import 'dart:math' as math;
import '../admin/admin_profile.dart';
import '../api/access.dart';
import '../employee_screens/employee_welcome_1.dart';
import '../manager/home.dart';
import '../models/login_model.dart';
import '../storage.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  var emailController = TextEditingController();
  var passController = TextEditingController();
  Dio dio = new Dio();
  SharedPreferencesInit() async {
    await Storage.init();
  }

  @override
  void initState(){
    super.initState();
    SharedPreferencesInit();
  }

  Future loginData(String email, String password) async {
   if(email.isNotEmpty && password.isNotEmpty){
     final String url = "https://stg.visitormanager.net/v1/login/email";
     var data = {
       "email": email,
       "password": password
     };

     var response = await dio.post(url, data: data);

     if (response.statusCode == 200) {
       //print(LoginApi.fromJson(response.data));
       print("Login response: ${response.data}");
       print(response.data['data']);
       Navigator.push(context,
           MaterialPageRoute(builder: (context) =>
               Scaffold(
                 backgroundColor: Colors.white,
                 body: Center(
                   child:
                   Column(
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

                   if(response.data['data']['is_Manager'] == 1)...[
                     GestureDetector(
                       onTap: () {
                         Navigator.push(context,
                             MaterialPageRoute(builder:
                                 (context) => More()
                                   //   Home2(empId: Storage.get_adminEmpID().toString(),
                                   // location: Storage.get_location().toString(),)
                             ));

                       },
                       child: Text("Manager", style: TextStyle(
                           color: Color(0xff005993), letterSpacing: 1,
                           fontSize: 50,
                           fontWeight: FontWeight.bold
                       ),),
                     ),
                   ],

                       SizedBox(height: 30,),

                       if(response.data['data']['is_Admin'] == 1)...[
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
                     ],
                   ),
                 )
               )
           ));
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("Login successful")));
     } else {
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("Invalid credentials")));
     }
   } else{
     ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text("Blank fields not allowed")));
   }
  }

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
                    children: [

                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff005993)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff005993)),
                            ),
                            focusColor: Color(0xff005993),
                            label: Text("Email/phone", style: TextStyle(
                              color: Color(0xff005993),)
                            )
                        ),
                        style: TextStyle(color: Color(0xff005993)),
                        cursorColor: Color(0xff005993),
                      ),

                      SizedBox(height: 20,),
                      TextFormField(
                        obscureText: true,
                        controller: passController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff005993)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff005993)),
                            ),
                            focusColor: Color(0xff005993),
                            label: Text("Password", style: TextStyle(
                              color: Color(0xff005993),)
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
                    height: MediaQuery
                        .of(context)
                        .size
                        .width * 0.12,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.55,
                    child: ElevatedButton(
                      onPressed: () async {
                        if(emailController.text.isNotEmpty && passController.text.isNotEmpty ){
                          access().login(emailController.text,
                              passController.text).then((value) async {
                            if (value["success"]) {
                              LoginApi loginApiRes = await LoginApi.fromJson(value);
                              final empId = loginApiRes.data!.employeeId;
                              final location = loginApiRes.data!.locations[0].name;
                              final comp_name = loginApiRes.data!.companyName;
                              final token = loginApiRes.tokens!.accessToken;
                              final isAdmin = loginApiRes.data!.isAdmin;
                              final isManager = loginApiRes.data!.isManager;
                              final locationID = loginApiRes.data!.locations![0].locationId;
                              Storage.set_locationID(locationID.toString());

                              Storage.set_accessToken(token.toString());

                              Storage.set_adminEmpID(empId.toString());

                              Storage.set_location(location.toString());


                              Fluttertoast.showToast(
                                  msg: "${"Logged in successfully"}",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green.shade400,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              setState(() {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return Scaffold(
                                    backgroundColor: Colors.white,
                                    body: Center(
                                      child:
                                      Column(
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

                                          if(isManager == 1)...[
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder:
                                                        (context) =>
                                                            More()
                                                          //   Home2(empId: Storage.get_adminEmpID().toString(),
                                                          // location: Storage.get_location().toString(),)
                                                    ));

                                              },
                                              child: Text("Manager", style: TextStyle(
                                                  color: Color(0xff005993), letterSpacing: 1,
                                                  fontSize: 50,
                                                  fontWeight: FontWeight.bold
                                              ),),
                                            ),
                                          ],

                                          SizedBox(height: 30,),

                                          if(isAdmin == 1)...[
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
                                        ],
                                      ),
                                    )
                                );
                              }));
                              });
                            } else{
                              Fluttertoast.showToast(
                                  msg: "${"Invalid credentials"}",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red.shade400,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          });
                        } else{
                          Fluttertoast.showToast(
                              msg: "${"Fields cannot be empty"}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
    },

    child: Text("Login", style: TextStyle(
    color: Colors.white,
    fontSize: 16
    ),),
    style: ButtonStyle(
    shape: MaterialStateProperty.all<
    RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),
    side: BorderSide(color: Color(0xff005993))
    )
    ),
    backgroundColor: MaterialStateProperty.all(
    Color(0xff005993),)
    ),
    ),
    )
 ]),

          ],
        ),
      ),
    );
  }

}


