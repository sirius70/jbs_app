import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jbs_app/employee_screens/my_attendance.dart';
import 'package:jbs_app/employee_screens/my_service_request.dart';
import 'package:jbs_app/employee_screens/my_tracker.dart';
import 'package:jbs_app/employee_screens/scan_qr.dart';
import 'package:jbs_app/employee_screens/view_my_calendar.dart';
import 'package:jbs_app/employee_screens/widgets/my_leave_application.dart';

import '../api/access.dart';
import '../models/profile_model.dart';
import '../screens/login_2.dart';
import '../storage.dart';
import 'edit_profile.dart';
import 'employee_welcome_1.dart';
import 'guest_register_2.dart';
import 'my_regulaization_request.dart';
import 'my_scan_qr.dart';

class employeeProfile extends StatefulWidget {
  const employeeProfile({Key? key}) : super(key: key);

  @override
  State<employeeProfile> createState() => _employeeProfileState();
}

class _employeeProfileState extends State<employeeProfile> {

  ProfileApi? getProfile;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loading = false;
    access().profile().then((value) {
      if (value["success"]) {
        setState(() {
          getProfile = ProfileApi.fromJson(value);
        });
        loading = false;
      }
    });

    empAbsPresent();
  }



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
                                  (BuildContext context) => profileQr()));
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
        body: loading? Center(child: CircularProgressIndicator(),):
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [ BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 5.0,
                        ),]
                    ),
                    child: Container(
                      child: ListTile(
                        leading: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/loki.jpg"),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                        subtitle: GestureDetector(
                          onTap: (){
                            access().profile().then((value) async{
                              if(value["success"]) {
                                ProfileApi profile = await ProfileApi.fromJson(value);
                                final name = profile.data[0].name;
                                Storage.set_name(name);
                                return _showEditProfileDialogue(context, profile);
                              }else{
                                return Center(child: CircularProgressIndicator(),);
                              }
                            });
                          },
                          child: Text(
                            'View profile ',
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width*0.035,
                                color: Colors.lightBlue),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getProfile==null? "": getProfile!.data[0].name,
                              style: TextStyle(
                                  color: Colors.lightBlue.shade700,
                                  fontSize: MediaQuery.of(context).size.width*0.05),
                            ),
                            SizedBox(height: 5,),

                          ],
                        ),
                        horizontalTitleGap: 15,
                        minLeadingWidth: 0,
                      ),
                    )


                    // Row(
                    //   children: [
                    //     Container(
                    //       height: 80,
                    //       width: 80,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           image: DecorationImage(
                    //               image: AssetImage("assets/images/loki.jpg"),
                    //               fit: BoxFit.fill
                    //           )
                    //       ),
                    //     ),
                    //
                    //     SizedBox(width: 20,),
                    //
                    //     Expanded(
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           Text(Storage.get_name().toString(),
                    //             style: TextStyle(
                    //               color: Color(0xff005993),
                    //                 fontSize: 20
                    //             ),),
                    //
                    //           SizedBox(height: 5,),
                    //           GestureDetector(
                    //             onTap: (){
                    //               access().profile().then((value) async{
                    //                 if(value["success"]) {
                    //                   ProfileApi profile = await ProfileApi.fromJson(value);
                    //                   // final name = profile.data.name;
                    //                   // Storage.set_name(name);
                    //                   return _showEditProfileDialogue(context, profile);
                    //                 }else{
                    //                   return Center(child: CircularProgressIndicator(),);
                    //                 }
                    //               });
                    //             },
                    //             child: Text("View Profile",
                    //             style: TextStyle(
                    //               color: Color(0xff009AFF)
                    //             ),),
                    //
                    //           )
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // )
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
              // Padding(
              //   padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Row(
              //         children: [
              //           Icon(Icons.qr_code_sharp, size: 30,color: Color(0xff009AFF),),
              //           SizedBox(width: 10,),
              //           Text("Mark Attendance")
              //         ],
              //       ),
              //
              //       IconButton(onPressed: (){},
              //           icon: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
              //     ],
              //   ),
              // ),
              // Divider(),

              ListTile(
                  trailing: IconButton(onPressed: (){
                    Get.to(myCalendar());
                  },
                      icon: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: MediaQuery.of(context).size.width*0.05,)),
                  title:  Text("Regularization",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.0375
                    ),),
                  onTap: (){
                    Get.to(myCalendar());
                  },
                  leading: Icon(Icons.timelapse,
                    size: MediaQuery.of(context).size.width*0.06,
                      color: Color(0xff009AFF))
              ),

              Divider(),

              ListTile(
                  trailing: IconButton(onPressed: (){
                    Get.to(leaveApplication());
                  },
                      icon: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: MediaQuery.of(context).size.width*0.05,)),
                  title:  Text("Apply for leave",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.0375
                    ),),
                  onTap: (){

                    Get.to(leaveApplication());
                  },
                  leading: Icon(Icons.home_work_rounded,
                      size: MediaQuery.of(context).size.width*0.06,
                      color: Color(0xff009AFF))
              ),

              Divider(),

              ListTile(
                  trailing: IconButton(onPressed: (){
                    Get.to(serviceRequest());
                  },
                      icon: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: MediaQuery.of(context).size.width*0.05,)),
                  title:  Text("Support Request",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.0375
                    ),),
                  onTap: (){

                    Get.to(serviceRequest());
                  },
                  leading: Icon(Icons.support,
                      size: MediaQuery.of(context).size.width*0.06,
                      color: Color(0xff009AFF))
              ),

              Divider(),

              ListTile(
                  trailing: IconButton(onPressed: (){
                    Get.to(guestRegister());
                  },
                      icon: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: MediaQuery.of(context).size.width*0.05,)),
                  title:  Text("Add a guest",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.0375
                    ),),
                  onTap: (){

                    Get.to(guestRegister());
                  },
                  leading: Icon(Icons.person_add_alt_1_rounded,
                      size: MediaQuery.of(context).size.width*0.06,
                      color: Color(0xff009AFF))
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

              ListTile(
                  trailing: IconButton(onPressed: (){
                    Get.to(myTracking());
                  },
                      icon: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: MediaQuery.of(context).size.width*0.05,)),
                  title:  Text("Tracking",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.0375
                    ),),
                  onTap: (){

                    Get.to(myTracking());
                  },
                  leading: Icon(Icons.my_location_rounded,
                      size: MediaQuery.of(context).size.width*0.06,
                      color: Color(0xff009AFF))
              ),

              Divider(),

              ListTile(
                  trailing: IconButton(onPressed: (){
                    Get.to(myAttendance());
                  },
                      icon: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: MediaQuery.of(context).size.width*0.05,)),
                  title:  Text("Attendance Stats",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.0375
                    ),),
                  onTap: (){

                    Get.to(myAttendance());
                  },
                  leading: Icon(Icons.timer,
                      size: MediaQuery.of(context).size.width*0.06,
                      color: Color(0xff009AFF))
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content:  Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Are you sure you want to logout?",
                                  textAlign: TextAlign.center,),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel', style: TextStyle(
                                    color: Colors.black
                                )),
                              ),

                              TextButton(
                                onPressed: () {
                                  access().logout().then((value) async{
                                    if(value["success"]) {
                                      await Storage.sharedPreferences!.remove("accessToken");
                                      // await Storage.sharedPreferences!.remove("locationID");
                                      // await Storage.sharedPreferences!.remove("employeeId");
                                      // await Storage.sharedPreferences!.remove("adminEmpId");
                                      // await Storage.sharedPreferences!.remove("location");
                                      // await Storage.sharedPreferences!.remove("managerEmpId");

                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  loginScreen()
                                          ));
                                      Fluttertoast.showToast(
                                          msg: "${"Logout successful"}",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green.shade300,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }else{
                                      Fluttertoast.showToast(
                                          msg: "${"Logout unsuccessful"}",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  });
                                },
                                child: const Text('Logout', style: TextStyle(
                                    color: Colors.red
                                ),),
                              ),
                            ],
                          ),
                        );
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

  _showEditProfileDialogue(BuildContext context, ProfileApi profilee) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Container(
                //padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 400.0,
                decoration:const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color:  Color(0xFFFFFF),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/loki.jpg"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),

                      SizedBox(height: 20),
                      Text("${profilee.data[0].name}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20
                        ),),

                      SizedBox(height: 30),
                      Container(
                        child: Column(
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.call, color: Color(0xff009AFF),),
                                  Text(" ${profilee.data[0].phoneNumber}"),
                                ],
                              ),
                            ),

                            SizedBox(height: 10),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Icon(Icons.call, color: Color(0xff009AFF),),
                            //     Text(" bhshbchsbcuhicunciscn@scbscjn"),
                            //   ],
                            // ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                const Center(child: Icon(Icons.mail, color: Color(0xff009AFF),)),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.02,
                                ),
                                Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.4,
                                    child: Expanded(
                                      child: Text(" ${profilee.data[0].email}",
                                        overflow: TextOverflow.clip,
                                        maxLines: 3,
                                        style:  TextStyle(
                                          fontSize: MediaQuery.of(context).size.width*0.0375,
                                        ),),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 20,),
                            Container(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: ElevatedButton.icon(
                                  icon: Icon(Icons.edit, color: Colors.white,
                                    size: MediaQuery.of(context).size.width*0.05,),
                                  onPressed: (){
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context)=>otpVerify()));
                                    Get.to(editEmpProfile());
                                  },
                                  label: Text("   Edit", style: TextStyle(
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
                      )

                    ],
                  ),
                ),
              ));
        });
  }
}
