import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbs_app/employee_screens/my_attendance.dart';
import 'package:jbs_app/employee_screens/my_service_request.dart';
import 'package:jbs_app/employee_screens/my_tracker.dart';
import 'package:jbs_app/employee_screens/scan_qr.dart';
import 'package:jbs_app/employee_screens/widgets/my_leave_application.dart';

import '../api/access.dart';
import '../models/profile_model.dart';
import '../storage.dart';
import 'employee_welcome_1.dart';
import 'guest_register_2.dart';
import 'my_regulaization_request.dart';

class employeeProfile extends StatefulWidget {
  const employeeProfile({Key? key}) : super(key: key);

  @override
  State<employeeProfile> createState() => _employeeProfileState();
}

class _employeeProfileState extends State<employeeProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
            color: Colors.white,
            child: BottomAppBar(
              shape: CircularNotchedRectangle(),
              color: Colors.transparent,
              elevation: 0,
              child: SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        children: [
                          IconButton(
                              onPressed: (){
                                Navigator
                                    .of(context)
                                    .push(MaterialPageRoute(builder:
                                    (BuildContext context) => employeeWelcome()));
                              },
                              icon: Icon(CupertinoIcons.home, size: 30,
                                  color: Color(0xff717171))),

                          Text("Home",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff717171)
                            ),)
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            //padding: EdgeInsets.only(left:10),
                              onPressed: (){
                                Icon(Icons.ac_unit, color :Colors.teal);
                                Navigator
                                    .of(context)
                                    .push(MaterialPageRoute(builder:
                                    (BuildContext context) => guestRegister()));
                              },
                              icon: Icon(CupertinoIcons.person_crop_circle_fill_badge_plus,
                                  size: 30,
                                  color: Color(0xff717171))),
                          Text("Add guest",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff717171)
                            ),)
                        ],
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffE8F9FF)
                        ),
                        child: IconButton(
                          //padding: EdgeInsets.only(left:10),
                            onPressed: (){
                              Navigator
                                  .of(context)
                                  .push(MaterialPageRoute(builder:
                                  (BuildContext context) => scanQr()));
                            },
                            icon: Icon(CupertinoIcons.qrcode_viewfinder,  size: 40,
                                color: Color(0xff717171))),
                      ),
                      Column(
                        children: [
                          IconButton(
                            //padding: EdgeInsets.only(left:10),
                              onPressed: (){
                                Navigator
                                    .of(context)
                                    .push(MaterialPageRoute(builder:
                                    (BuildContext context) => myAttendance()));
                              },
                              icon: Icon(CupertinoIcons.chart_bar, size: 30,
                                  color: Color(0xff717171))),
                          Text("Attendance",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff717171)
                            ),)
                        ],
                      ),

                      Column(
                        children: [
                          IconButton(
                            //padding: EdgeInsets.only(left:10),
                              onPressed: (){
                                Navigator
                                    .of(context)
                                    .pushReplacement(MaterialPageRoute(builder:
                                    (BuildContext context) => employeeProfile()));
                              },
                              icon: Icon(Icons.more_horiz_rounded, size: 30,
                                  color: Color(0xff0093CB))),
                          Text("Menu",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff0093CB)
                            ),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [new BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 5.0,
                        ),]
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/loki.jpg"),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),

                        SizedBox(width: 20,),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(Storage.get_name().toString(),
                                style: TextStyle(
                                  color: Color(0xff005993),
                                    fontSize: 20
                                ),),

                              SizedBox(height: 5,),
                              GestureDetector(
                                onTap: (){
                                  access().profile().then((value) async{
                                    if(value["success"]) {
                                      ProfileApi profile = await ProfileApi.fromJson(value);
                                      // final name = profile.data.name;
                                      // Storage.set_name(name);
                                      return _showEditProfileDialogue(context, profile);
                                    }else{
                                      return Center(child: CircularProgressIndicator(),);
                                    }
                                  });
                                },
                                child: Text("View Profile",
                                style: TextStyle(
                                  color: Color(0xff009AFF)
                                ),),

                              )
                            ],
                          ),
                        )
                      ],
                    )
                ),
          SizedBox(height: 20,),

          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [new BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 5.0,
                ),]
            ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.qr_code_sharp, size: 30,color: Color(0xff009AFF),),
                        SizedBox(width: 10,),
                        Text("Mark Attendance")
                      ],
                    ),

                    IconButton(onPressed: (){},
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                  ],
                ),
              ),
              Divider(),

              Padding(
                padding: const EdgeInsets.only( left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timelapse, size: 30,color: Color(0xff009AFF),),
                        SizedBox(width: 10,),
                        Text("Regularization")
                      ],
                    ),

                    IconButton(onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder:
                          (context)=>regularizationRequest()));
                    },
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                  ],
                ),
              ),
              Divider(),

              Padding(
                padding: const EdgeInsets.only( left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.home_work_rounded, size: 30,color: Color(0xff009AFF),),
                        SizedBox(width: 10,),
                        Text("Apply for leave")
                      ],
                    ),

                    IconButton(onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder:
                          (context)=>leaveApplication()));
                    },
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                  ],
                ),
              ),
              Divider(),

              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.support, size: 30,color: Color(0xff009AFF),),
                        SizedBox(width: 10,),
                        Text("Support request")
                      ],
                    ),

                    IconButton(onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder:
                          (context)=>serviceRequest()));
                    },
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                  ],
                ),
              ),
              Divider(),

              Padding(
                padding: const EdgeInsets.only( bottom: 10,left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person_add_alt_1_rounded, size: 30,color: Color(0xff009AFF),),
                        SizedBox(width: 10,),
                        Text("Add a guest")
                      ],
                    ),

                    IconButton(onPressed: (){},
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                  ],
                ),
              ),
            ],
          ),
          ),

          SizedBox(height: 20,),

          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [new BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 5.0,
                ),]
            ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.my_location_rounded, size: 30,color: Color(0xff009AFF),),
                        SizedBox(width: 10,),
                        Text("Tracking")
                      ],
                    ),

                    IconButton(onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder:
                          (context)=>myTracking()));
                    },
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                  ],
                ),
              ),
              Divider(),

              Padding(
                padding: const EdgeInsets.only( left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timelapse, size: 30,color: Color(0xff009AFF),),
                        SizedBox(width: 10,),
                        Text("Attendance Stats"),

                      ],
                    ),

                    IconButton(onPressed: (){
                    },
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                  ],
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
          ),

                SizedBox(height: 70,),

                Container(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.logout, color: Colors.white,),
                      onPressed: (){
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context)=>otpVerify()));
                      },
                      label: Text("    Logout", style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(color: Color(0xff005993))
                              )
                          ),
                          backgroundColor: MaterialStateProperty.all(Color(0xff005993),)
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  _showEditProfileDialogue(BuildContext context, ProfileApi _profile) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Container(
                padding: EdgeInsets.all(30),
                width: 425.0,
                height: 425.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color(0xFFFFFF),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/images/loki.jpg"),
                              fit: BoxFit.fill
                          )
                      ),
                    ),

                    SizedBox(height: 20),
                    Text(_profile.data.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20
                      ),),

                    SizedBox(height: 30),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call, color: Color(0xff009AFF),),
                          Text(_profile.data.phoneNumber,),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.mail, color: Color(0xff009AFF),),
                          Text(_profile.data.email),
                        ],
                      ),
                    ),

                  ],
                ),
              ));
        });
  }
}
