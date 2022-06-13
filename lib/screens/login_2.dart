import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jbs_app/manager/more.dart';
import 'package:jbs_app/screens/otp_verify_3.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'dart:math' as math;
import '../admin/admin_profile.dart';
import '../api/access.dart';
import '../employee_screens/employee_welcome_1.dart';
import '../manager/home.dart';
import '../models/contractor_count_model.dart';
import '../models/delivery_count_model.dart';
import '../models/login_model.dart';
import '../models/phone_login_model.dart';
import '../models/profile_model.dart';

import '../models/visitor_count_model.dart';
import '../storage.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  var emailController = TextEditingController();
  var passController = TextEditingController();
  var phoneController = TextEditingController();


  SharedPreferencesInit() async {
    await Storage.init();
  }

  @override
  void initState(){
    super.initState();
    SharedPreferencesInit();
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
                            label: Text("Email", style: TextStyle(
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

                  SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: MediaQuery.of(context).size.width * 0.45,
                          height: 1,
                          color: Colors.black,),
                        Text("OR"),
                        Container(width: MediaQuery.of(context).size.width * 0.45,
                          height: 1,
                          color: Colors.black,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  GestureDetector(
                    onTap: (){
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => SingleChildScrollView(
                          controller:
                          ModalScrollController.of(context),
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.4,
                              child: Column(
                                children: [
                                  Divider(
                                    thickness: 3,
                                    color: Colors.blue.shade900,
                                    height: 1,
                                    endIndent: 120,
                                    indent: 120,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),

                                  Padding(padding: EdgeInsets.all(20),
                                  child: Container(
                                    child: TextFormField(
                                      controller: phoneController,
                                      decoration: const InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff005993)),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff005993)),
                                          ),
                                          focusColor: Color(0xff005993),
                                          label: Text("Phone", style: TextStyle(
                                            color: Color(0xff005993),)
                                          )
                                      ),
                                      style: TextStyle(color: Color(0xff005993)),
                                      cursorColor: Color(0xff005993),
                                    ),
                                  ),),

                                  SizedBox(height: 50,),
                                  Container(
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
                                        if(phoneController.text.isNotEmpty ){
                                          access().loginPhone(("+91"+phoneController.text).toString()).then((value) async {
                                            if (value["success"]) {

                                              access().profile().then((value) async{
                                                if(value["success"]) {
                                                  ProfileApi profile = await ProfileApi.fromJson(value);
                                                  final name = profile.data.name;
                                                  Storage.set_name(name);
                                                }
                                              });

                                              setState(() {
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder: (context) {
                                                      return otpVerify(phoneNo: phoneController.text);
                                                    }));
                                              });

                                              access().deliveryTodayCount().then((value) async{
                                                if(value["success"]){
                                                  DeliveryTodaysCount deliveryCount = await DeliveryTodaysCount.fromJson(value);
                                                  final deliCount = deliveryCount.data[0].count;
                                                  print(deliCount);
                                                  Storage.set_deliveryCount(deliCount.toString());
                                                }
                                              });

                                              access().visitorTodayCount().then((value) async{
                                                if(value["success"]){
                                                  VisitorTodaysCount visitorCount = await VisitorTodaysCount.fromJson(value);
                                                  final visitCount = visitorCount.visitorInsideToday[0].count;
                                                  final totalVisitCount = visitorCount.totalVisitorVisitedToday[0].count;
                                                  print("${visitCount}, ${totalVisitCount }");
                                                  Storage.set_visitorCount(visitCount.toString());
                                                  Storage.set_totalVisitorCount(totalVisitCount.toString());
                                                }
                                              });

                                              access().contractorTodayCount().then((value) async{
                                                if(value["success"]){
                                                  ContractorTodaysCount contractorCount = await ContractorTodaysCount.fromJson(value);
                                                  final contracCount = contractorCount.contractorInsideToday[0].count;
                                                  final totalContracCount = contractorCount.totalContractorVisitedToday[0].count;
                                                  print("${contracCount}, ${totalContracCount }");
                                                  Storage.set_contractorCount(contracCount.toString());
                                                  Storage.set_totalContractorCount(totalContracCount.toString());
                                                }
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
                                ],
                              )),
                        ),
                      );
                    },
                    child: Text("Login via OTP", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),),),

                  SizedBox(height: 50,),
                  Container(
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
                              final token = loginApiRes.tokens!.accessToken;
                              final isAdmin = loginApiRes.data!.isAdmin;
                              final isManager = loginApiRes.data!.isManager;
                              final locationID = loginApiRes.data!.locations![0].locationId;
                              Storage.set_locationID(locationID.toString());

                              Storage.set_accessToken(token.toString());

                              Storage.set_adminEmpID(empId.toString());

                              Storage.set_location(location.toString());

                              access().profile().then((value) async{
                                if(value["success"]) {
                                  ProfileApi profile = await ProfileApi.fromJson(value);
                                  final name = profile.data.name;
                                  Storage.set_name(name);
                                }
                              });


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


