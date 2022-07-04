import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jbs_app/employee_screens/guest_register_2.dart';
import 'package:jbs_app/employee_screens/my_attendance.dart';
import 'package:jbs_app/employee_screens/my_scan_qr.dart';
import 'package:jbs_app/employee_screens/my_service_request.dart';
import 'package:jbs_app/employee_screens/profile_page_3.dart';
import 'package:jbs_app/employee_screens/scan_qr.dart';
import 'package:jbs_app/employee_screens/view_my_calendar.dart';
import 'package:jbs_app/employee_screens/widgets/bottom_navigation.dart';
import 'package:jbs_app/employee_screens/widgets/my_leave_application.dart';
import 'package:marquee/marquee.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../admin/admin2.dart';
import '../api/access.dart';
import '../manager/home.dart';
import '../models/attendance_mark_model.dart';
import '../models/current_month_attendance.dart';
import '../models/empAttendance_summary_model.dart';
import '../models/profile_model.dart';
import '../models/total_visitors_model.dart';
import '../storage.dart';
import 'package:http/http.dart'  as http;

import 'my_regulaization_request.dart';
import 'widgets/attendance_calendar.dart';

enum Options { person_crop_circle, notifications, switch_account_outlined, }
class employeeWelcome extends StatefulWidget {
  const employeeWelcome({Key? key}) : super(key: key);


  @override
  State<employeeWelcome> createState() => _employeeWelcomeState();
}

class _employeeWelcomeState extends State<employeeWelcome> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController _time1 = TextEditingController();
  TextEditingController _time2 = TextEditingController();

  ProfileApi? getProfile;

  bool valuefirst = false;

  bool isChecked = false;
  String? _selectedTime;
  int? _selectedValueIndex;

  List<String> buttonText = ["AM", "PM"];



  bool loading = true;
  bool value = false;
  TotalVisitors? visitorsCount;
  AttendanceMark? checkMark;
  CurrentMonthAttendance? currAttendance;

  SharedPreferencesInit() async {
    await Storage.init();
  }

  void changeData(){
    value = true;
  }

  @override
  void initState(){
    super.initState();
    _selectedValueIndex = 0;

    markAttendance();

    // currentMonthAttendance();
    _time1.text = "6";
    _time2.text = "30";
    SharedPreferencesInit();
    loading=false;

    access().profile().then((value) {
      if(value["success"]){
        setState((){
          getProfile = ProfileApi.fromJson(value);
        });
        loading=false;

      }
    });

    access().visitorCount().then((value) {
      if(value["success"]){
        setState((){
          visitorsCount = TotalVisitors.fromJson(value);
        });
        loading=false;

      }
    });

    access().attendanceMark().then((value) {
      if(value["success"]){
        setState((){
          checkMark = AttendanceMark.fromJson(value);
        });
        loading=false;
      }
    });

    access().currMonthAttendance().then((value) {
      if(value["success"]){
        setState((){
          currAttendance = CurrentMonthAttendance.fromJson(value);
        });
        loading=false;
      }
    });

    empAbsPresent();
  }

  var _popupMenuItemIndex = 0;

  Color _changeColorAccordingToMenuItem = Colors.red;

  PopupMenuItem _buildPopupMenuItem(
      String title, IconData iconData, int position) {
    return PopupMenuItem(
      value: position, 
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  iconData,
                  color: Color(0xff0075FF),
                ),
                Text(title),

              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }

  _onMenuItemSelected(int value) {
    setState(() {
      _popupMenuItemIndex = value;
    });

    if (value == Options.person_crop_circle.index) {
      _changeColorAccordingToMenuItem = Colors.red;
      Navigator.push(context, MaterialPageRoute(builder: (context)=>employeeProfile()));
    } else if (value == Options.notifications.index) {
      _changeColorAccordingToMenuItem = Colors.green;
    } else if (value == Options.switch_account_outlined.index) {
      _changeColorAccordingToMenuItem = Colors.blue;
    } else {
      _changeColorAccordingToMenuItem = Colors.purple;
    }
  }


  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog( //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit an App?'),
          actions:[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child:Text('No'),
            ),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              //return true when click on "Yes"
              child:Text('Yes'),
            ),

          ],
        ),
      )??false; //if showDialouge had returned null, then return false
    }



    return WillPopScope(
        onWillPop: showExitPopup, //call function on back button press
        child:SafeArea(
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
                                      .pushReplacement(MaterialPageRoute(builder:
                                      (BuildContext context) => employeeWelcome()));
                                },
                                icon: Icon(CupertinoIcons.home, size: 30,
                                    color: Color(0xff0093CB))),

                            Text("Home",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff0093CB)
                              ),)
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              //padding: EdgeInsets.only(left:10),
                                onPressed: () async{
                                  final refresh = Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=> guestRegister()));
                                  if(refresh == "refresh"){

                                  }
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
                                      .push(MaterialPageRoute(builder:
                                      (BuildContext context) => employeeProfile()));
                                },
                                icon: Icon(Icons.more_horiz_rounded, size: 30,
                                    color: Color(0xff717171))),
                            Text("Menu",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff717171)
                              ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ),
          backgroundColor: Colors.grey.shade200,
          body: loading? Center(child: CircularProgressIndicator(),):
          SingleChildScrollView(
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Welcome,",
                          style: TextStyle(
                              color: Color(0xff0075FF),
                              fontSize: 16
                          ),),

                        Row(
                          children: [
                            IconButton(
                              onPressed:(){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)
                                    => profileQr()));
                              },
                              icon: Icon(Icons.qr_code_sharp),
                              iconSize: 42, color: Color(0xff0075FF),
                            ),
                            SizedBox(width: 20,),



                            GestureDetector(
                              onTap: (){
                                Get.to(employeeProfile());
                              },
                              child: Stack(
                                children: [

                                  //     PopupMenuButton(
                                  //       constraints: BoxConstraints(
                                  //     maxWidth: MediaQuery.of(context).size.width,
                                  //         minWidth: MediaQuery.of(context).size.width*0.5
                                  // ),
                                  //       child: Container(
                                  //         height: 55,
                                  //         width: 55,
                                  //         decoration: BoxDecoration(
                                  //             border: Border.all(color: Colors.blue, width: 2),
                                  //             shape: BoxShape.circle,
                                  //             image: DecorationImage(
                                  //                 image: AssetImage("assets/images/loki.jpg"),
                                  //                 fit: BoxFit.fill
                                  //             )
                                  //         ),
                                  //       ),
                                  //
                                  //     onSelected: (value) {
                                  //         _onMenuItemSelected(value as int);
                                  //         },
                                  //       offset: Offset(0.0, 55),
                                  //
                                  //       shape: RoundedRectangleBorder(
                                  //         borderRadius: BorderRadius.circular(15),),
                                  //       itemBuilder: (ctx) => [
                                  //
                                  //         _buildPopupMenuItem('My profile', CupertinoIcons.person_crop_circle, Options.person_crop_circle.index),
                                  //         _buildPopupMenuItem('Notifications', Icons.upload, Options.notifications.index),
                                  //         _buildPopupMenuItem('Switch User', Icons.copy, Options.switch_account_outlined.index),
                                  //       ],
                                  //     ),

                                  Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue, width: 2),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/loki.jpg"),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  ),

                                  Positioned(
                                    right: 10,
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffFF2E00),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.275,
                                        child: Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                //"${Storage.get_name()}",
                                                getProfile==null? "": getProfile!.data[0].name,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 5,
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: MediaQuery.of(context).size.width*0.05,
                                                    color: Color(0xff005993)
                                                ),),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            print("admin: ${Storage.get_isAdmin()}");
                                            print("manager: ${Storage.get_isManager()}");

                                            showMaterialModalBottomSheet(
                                              context: context,
                                              builder: (context) => SingleChildScrollView(
                                                controller:
                                                ModalScrollController.of(context),
                                                child: Container(
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

                                                        if (Storage.get_isManager() == "1")...[
                                                          GestureDetector(
                                                            onTap: (){
                                                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                                                  builder: (BuildContext context) => Home2(empId: Storage.get_adminEmpID().toString(),
                                                                    location: Storage.get_location().toString(),)), (route) => false);
                                                              // Navigator.pushReplacement(
                                                              //     (context as Element),
                                                              //     MaterialPageRoute(
                                                              //         builder: (BuildContext context) => Home2(empId: Storage.get_adminEmpID().toString(),
                                                              //           location: Storage.get_location().toString(),)));
                                                            },
                                                            child: ListTile(
                                                              leading: Image(
                                                                  image: AssetImage(
                                                                      'lib/images/face.png')),
                                                              title: Text('Manager',
                                                                  style: TextStyle(

                                                                      color: Colors.blue.shade900)),
                                                            ),)
                                                        ],
                                                        SizedBox(
                                                          height: 25,
                                                        ),

                                                        if(Storage.get_isAdmin()=="1")...[
                                                          GestureDetector(
                                                            onTap: (){
                                                              Navigator.pushAndRemoveUntil(
                                                                  (context as Element),
                                                                  MaterialPageRoute(
                                                                      builder: (BuildContext context) => Admin2(
                                                                        location: Storage.get_location().toString(),
                                                                        empID: Storage.get_adminEmpID().toString(),)), (route)=>false);

                                                            },
                                                            child: ListTile(
                                                              leading: Image(
                                                                  image: AssetImage(
                                                                      'lib/images/face.png')),
                                                              title: Text('Admin',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.normal,
                                                                      color: Colors.blue.shade900)),
                                                            ),
                                                          ),
                                                        ],

                                                        SizedBox(
                                                          height: 25,
                                                        ),
                                                        GestureDetector(
                                                            onTap: (){
                                                              Navigator.pushAndRemoveUntil(
                                                                  (context as Element),
                                                                  MaterialPageRoute(
                                                                      builder: (BuildContext context) => employeeWelcome()), (route)=>false);
                                                            },
                                                            child: ListTile(
                                                              leading: Image(
                                                                  image: AssetImage(
                                                                      'lib/images/face.png')),
                                                              title: Text('Employee',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.blue.shade900)),
                                                            )),
                                                        SizedBox(
                                                          height: 25,
                                                        )
                                                      ],
                                                    )),
                                              ),
                                            );
                                          },
                                          child: Icon(Icons.arrow_drop_down,
                                              color: Colors.lightBlue))
                                    ],
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Employee",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width*0.03,
                                  color: Colors.amber
                              ),),
                            Text(Storage.get_location().toString(),
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width*0.04,
                                  color: Color(0xff0060B9)
                              ),),
                            SizedBox(height: 5,),
                            Text("Emp ID: ${Storage.get_adminEmpID().toString()}",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width*0.04
                              ),)
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30,),

                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 30,),
                            Text("You have,", style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.055,
                            ),),
                          ],
                        ),

                        Column(
                          children: [
                            Icon(checkMark==null?Icons.close:Icons.check,
                              size: MediaQuery.of(context).size.width*0.1,
                              color:checkMark==null?Color(0xffFF2E00) :Color(0xff0EAF00),),
                            SizedBox(height: 0,),
                            Text(checkMark==null?"Attendance not\nmarked":"Attendance marked",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: checkMark==null?Color(0xffFF2E00) :Color(0xff0EAF00),
                                  fontSize: MediaQuery.of(context).size.width*0.03
                              ),)
                          ],
                        ),


                        Column(
                          children: [
                            Text(visitorsCount==null?'0':"${visitorsCount!.totalGuestsVisitedWithYou[0].count}",
                                style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.09,
                                    color: Color(0xff0EAF00))),
                            Text( visitorsCount==null?'No visitor schedules':
                            visitorsCount!.totalGuestsVisitedWithYou[0].count == 0?
                            'No visitor schedules': "Visitor schedules",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xff0EAF00), fontSize: MediaQuery.of(context).size.width*0.03),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  Container(
                      padding: EdgeInsets.only(top: 7, bottom: 7),
                      height: 30,
                      color: Color(0xff00A3FF),
                      child: Center(
                        child: Marquee(
                          text: 'Meet with Sundar of Expo at 2pm  |  Satya has checked in at front desk  |  Kabir was....',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          scrollAxis: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          blankSpace: 20.0,
                          velocity: 100.0,
                          pauseAfterRound: Duration(seconds: 2),
                          startPadding: 10.0,
                          accelerationDuration: Duration(seconds: 2),
                          accelerationCurve: Curves.linear,
                          decelerationDuration: Duration(milliseconds: 3000),
                          decelerationCurve: Curves.easeOut,
                        ),
                      )
                  ),

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 30),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [new BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  blurRadius: 5.0,
                                ),]
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Attendance summary",
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.06,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff092F52)
                                  ),),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(height: 10,),
                                        Text("for the month of",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width*0.04)),
                                        SizedBox(height: 2,),
                                        Text(DateFormat.MMMM().format(DateTime.now()).toString(), style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width*0.07,
                                            color: Color(0xff2989BF)
                                        ),)
                                      ],
                                    ),

                                    Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Text("Present Days - ", style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width*0.04,)),
                                            Text(currAttendance==null?"0 days":"${currAttendance!.present[0].COUNT} days", style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width*0.04,
                                              color: Color(0xff0EAF00),
                                            ),)
                                          ],
                                        ),
                                        SizedBox(height: 7,),
                                        Row(
                                          children: [
                                            Text("Absent Days - ", style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width*0.04,)),
                                            Text(currAttendance==null?"0 days":"${currAttendance!.absent[0].COUNT} days", style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width*0.04,
                                              color: Color(0xffFF2E00),
                                            ),)
                                          ],
                                        ),

                                      ],
                                    )




                                  ],
                                )
                              ],
                            )


                        ),
                      ],
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>myCalendar()));
                      },
                      child: Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [ BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                blurRadius: 5.0,
                              ),]
                          ),
                          child: Center(child: Text("Request for regularization",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width*0.06,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff092F52)
                            ),))
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>leaveApplication()));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              height: MediaQuery.of(context).size.width*0.35,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [new BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 5.0,
                                  ),]
                              ),
                              child: Center(
                                  child: Text("Apply for \nleave", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width*0.06,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff092F52)
                                    ),))
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>serviceRequest()));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              height: MediaQuery.of(context).size.width*0.35,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [new BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 5.0,
                                  ),]
                              ),
                              child: Center(child: Text("Raise support request",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width*0.06,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff092F52)
                                ),))
                          ),
                        ),
                      ],
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 30, left: 20, right: 20),
                    child: Container(
                        padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [ BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              blurRadius: 5.0,
                            ),]
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Register guest",textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.06,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff092F52)
                                  ),),

                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff2980B9),
                                  ),
                                  child: Icon(Icons.arrow_forward_outlined,
                                    color: Colors.white,),
                                ),
                              ],
                            ),

                            SizedBox(height: 20,),

                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Container(
                                      // height: 42,
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        controller: nameController,
                                        keyboardType: TextInputType.name,
                                        cursorColor: Color(0xff031627),
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusColor: Color(0xff031627),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintStyle: TextStyle(color: Color(0xff031627), fontSize: MediaQuery.of(context).size.width*0.04),
                                          hintText: "Name",
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,),

                                  Flexible(
                                    child: Container(
                                      // height: 42,
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        controller: companyController,
                                        keyboardType: TextInputType.name,
                                        cursorColor: Color(0xff031627),
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusColor: Color(0xff031627),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintStyle: TextStyle(color: Color(0xff031627), fontSize: MediaQuery.of(context).size.width*0.04),
                                          hintText: "Company",
                                        ),
                                      ),
                                    ),
                                  ),
                                  //TextField()
                                ],
                              ),
                            ),


                            SizedBox(height: 10,),

                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Container(
                                      // height: 42,
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        controller: phoneController,
                                        keyboardType: TextInputType.number,
                                        maxLength: 10,
                                        cursorColor: Color(0xff031627),
                                        decoration: InputDecoration(
                                          counterText:"",
                                          counterStyle: TextStyle(
                                              fontSize: 0
                                          ),
                                          // counter: Offstage(),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusColor: Color(0xff031627),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintStyle: TextStyle(color: Color(0xff031627), fontSize: MediaQuery.of(context).size.width*0.04),
                                          hintText: "Phone No.",
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,),

                                  Flexible(
                                    child: Container(
                                      // height: 42,
                                      child: TextFormField(
                                        textInputAction: TextInputAction.done,
                                        controller: emailController,
                                        keyboardType: TextInputType.emailAddress,
                                        cursorColor: Color(0xff031627),
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusColor: Color(0xff031627),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintStyle: TextStyle(color: Color(0xff031627), fontSize: MediaQuery.of(context).size.width*0.04),
                                          hintText: "E-mail ID",
                                        ),
                                      ),
                                    ),
                                  ),
                                  //TextField()
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Divider(thickness: 1.25,),
                            SizedBox(height: 10,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                        onTap:() async{
                                          DateTime? pickedDate = await showDatePicker(
                                              context: context, initialDate: DateTime.now(),
                                              firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                              lastDate: DateTime(2101)
                                          );

                                          if(pickedDate != null ){
                                            print(pickedDate);
                                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                            print(formattedDate);
                                            setState(() {
                                              dateinput.text = formattedDate; //set output date to TextField value.
                                            });
                                          }else{
                                            print("Date is not selected");
                                          }
                                        },
                                        child: Icon(Icons.calendar_today, size: 16,)),
                                    SizedBox(width:5),
                                    Container(
                                        width: 100,
                                        child:Center(
                                            child:TextField(
                                              controller: dateinput,
                                              decoration: InputDecoration(
                                                hintText: 'Enter date',
                                                border: InputBorder.none,
                                                focusColor: Color(0xff031627),
                                              ),
                                              readOnly: true,
                                              onTap: () async {
                                                DateTime? pickedDate = await showDatePicker(
                                                    context: context, initialDate: DateTime.now(),
                                                    firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                                    lastDate: DateTime(2101)
                                                );

                                                if(pickedDate != null ){
                                                  print(pickedDate);
                                                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                                  print(formattedDate);
                                                  setState(() {
                                                    dateinput.text = formattedDate; //set output date to TextField value.
                                                  });
                                                }else{
                                                  print("Date is not selected");
                                                }
                                              },
                                            )
                                        )
                                    ),

                                  ],
                                ),

                                Row(
                                  children: [
                                    const Text("at"),

                                    Row(
                                      children: [
                                        Column(
                                          children:  [
                                            GestureDetector(
                                                onTap:(){
                                                  int currentValue = int.parse(_time1.text);
                                                  setState(() {
                                                    currentValue++;
                                                    _time1.text = (currentValue < 12? currentValue : 12)
                                                        .toString(); // incrementing value
                                                  });
                                                },
                                                child: Icon(Icons.keyboard_arrow_up,
                                                  color: Color(0xff2980B9),)),


                                            Text(_time1.text,
                                              style: TextStyle(
                                                  fontSize: 16
                                              ),),

                                            GestureDetector(
                                                onTap:(){
                                                  int currentValue = int.parse(_time1.text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _time1.text =
                                                        (currentValue > 1 ? currentValue : 1)
                                                            .toString(); // decrementing value
                                                  });
                                                },
                                                child: Icon(Icons.keyboard_arrow_down, color: Color(0xff2980B9),))
                                          ],
                                        ),

                                        Text(":"),
                                        Column(
                                          children: [
                                            GestureDetector(
                                                onTap:(){
                                                  int currentValue = int.parse(_time2.text);
                                                  setState(() {
                                                    currentValue++;
                                                    _time2.text = (currentValue < 59? currentValue : 59)
                                                        .toString(); // incrementing value
                                                  });
                                                },
                                                child: Icon(Icons.keyboard_arrow_up,
                                                  color: Color(0xff2980B9),)),

                                            Text(_time2.text,
                                              style: TextStyle(
                                                  fontSize: 16
                                              ),),

                                            GestureDetector(
                                                onTap:(){
                                                  int currentValue = int.parse(_time2.text);
                                                  setState(() {
                                                    print("Setting state");
                                                    currentValue--;
                                                    _time2.text =
                                                        (currentValue >  00? currentValue : 00)
                                                            .toString(); // decrementing value
                                                  });
                                                },
                                                child: Icon(Icons.keyboard_arrow_down,
                                                  color: Color(0xff2980B9),))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    ...List.generate(
                                      buttonText.length,
                                          (index) => button(
                                        index: index,
                                        text: buttonText[index],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Nda Sign?"),
                                Checkbox(
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.red,
                                  value: this.valuefirst,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.valuefirst = value!;
                                      print(valuefirst);
                                    });
                                  },
                                ),
                              ],
                            ),

                            SizedBox(height: 10,),
                            Container(
                              // decoration: BoxDecoration(
                              //   color: Color(0xffFF0000)
                              // ),
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width*0.5,
                              child: ElevatedButton(
                                onPressed: (){
                                  if(nameController.text.isNotEmpty &&
                                      phoneController.text.isNotEmpty && emailController.text.isNotEmpty &&
                                      companyController.text.isNotEmpty &&
                                      dateinput.text.isNotEmpty ){
                                    var df =  DateFormat("h:mma");
                                    var dt = df.parse("${_time1.text}:${_time2.text}${_selectedValueIndex==0?"AM":"PM"}");
                                    print(DateFormat('H:m:s').format(dt));
                                    //  print(DateTime(Storage.get_date().year.toString()))
                                    access().guestRegister(nameController.text,
                                        ("+91"+phoneController.text), emailController.text,
                                        companyController.text, valuefirst==true?"1":"0", dateinput.text,
                                        "${DateFormat('H:m:s').format(dt)}").then((value) {
                                      if(value["success"]){
                                        Fluttertoast.showToast(
                                            msg: "${"Register done"}",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.green.shade300,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        setState((){
                                          nameController.clear();
                                          phoneController.clear();
                                          emailController.clear();
                                          companyController.clear();
                                          _selectedTime = '';
                                          valuefirst = false;
                                          _time1.text = "6";
                                          _time2.text = "30";
                                          dateinput.clear();
                                        });
                                      } else{
                                        Fluttertoast.showToast(
                                            msg: "${"Error registering"}",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red.shade300,
                                            textColor: Colors.white,
                                            fontSize: 16.0);

                                        setState((){
                                          nameController.clear();
                                          phoneController.clear();
                                          emailController.clear();
                                          companyController.clear();
                                          _selectedTime = '';
                                          valuefirst = false;
                                          _time1.text = "6";
                                          _time2.text = "30";
                                          dateinput.clear();
                                        });
                                      }
                                    });
                                  } else{
                                    Fluttertoast.showToast(
                                        msg: "${"Fields cannot be empty"}",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }


                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context)=>scanQr()));
                                },
                                child: Text("Confirm"),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12.0),
                                            side: BorderSide(color: Color(0xff2980B9))
                                        )
                                    ),
                                    backgroundColor: MaterialStateProperty.all(Color(0xff2980B9),)
                                ),
                              ),
                            )

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //     Column(
                            //       children: [
                            //         Row(
                            //           mainAxisAlignment: MainAxisAlignment.start,
                            //           crossAxisAlignment: CrossAxisAlignment.start,
                            //           children: [
                            //             Icon(Icons.calendar_month, color: Color(0xff2980B9),),
                            //
                            //             Column(
                            //               crossAxisAlignment: CrossAxisAlignment.start,
                            //               children: [
                            //                 Text("09 SEPT", style: TextStyle(
                            //                     fontSize: 22,
                            //                     fontWeight: FontWeight.bold
                            //                 ),),
                            //
                            //                 SizedBox(height: 3,),
                            //                 Text("Monday",style: TextStyle(
                            //                     color: Color(0xff2980B9)
                            //                 ), ),
                            //
                            //                 SizedBox(height: 3,),
                            //                 Row(
                            //                   children: [
                            //                     Text("03:00",style: TextStyle(
                            //                         fontSize: 22,
                            //                         fontWeight: FontWeight.bold,
                            //                     ), ),
                            //                     Text(" am",style: TextStyle(
                            //                       fontWeight: FontWeight.bold,
                            //                     ), ),
                            //                   ],
                            //                 ),
                            //               ],
                            //             )
                            //           ],
                            //         ),
                            //
                            //
                            //       ],
                            //     ),
                            //
                            //     Text("to", style: TextStyle(
                            //       color: Color(0xff2980B9),
                            //       fontSize: 18
                            //     ),),
                            //
                            //     Column(
                            //       children: [
                            //         Row(
                            //           mainAxisAlignment: MainAxisAlignment.start,
                            //           crossAxisAlignment: CrossAxisAlignment.start,
                            //           children: [
                            //             Icon(Icons.calendar_month, color: Color(0xff2980B9),),
                            //
                            //             Column(
                            //               crossAxisAlignment: CrossAxisAlignment.start,
                            //               children: [
                            //                 Text("09 SEPT", style: TextStyle(
                            //                     fontSize: 22,
                            //                     fontWeight: FontWeight.bold
                            //                 ),),
                            //
                            //                 SizedBox(height: 3,),
                            //                 Text("Monday",style: TextStyle(
                            //                     color: Color(0xff2980B9)
                            //                 ), ),
                            //
                            //                 SizedBox(height: 3,),
                            //                 Row(
                            //                   children: [
                            //                     Text("03:00",style: TextStyle(
                            //                       fontSize: 22,
                            //                       fontWeight: FontWeight.bold,
                            //                     ), ),
                            //                     Text(" pm",style: TextStyle(
                            //                       fontWeight: FontWeight.bold,
                            //                     ), ),
                            //                   ],
                            //                 ),
                            //               ],
                            //             )
                            //           ],
                            //         ),
                            //
                            //
                            //       ],
                            //     ),
                            //
                            //   ],
                            // ),


                          ],
                        )
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
    ));
  }



  Widget button({required String text, required int index}) {
    return InkWell(
      splashColor: Colors.cyanAccent,
      onTap: () {
        setState(() {
          _selectedValueIndex = index;
          print(_selectedValueIndex);
          print(_selectedValueIndex==0?"AM":"PM");
        });
      },
      child: Container(

        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: index == _selectedValueIndex ? Color(0xff9FE6FF) : Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        //color: index == _selectedValueIndex ? Colors.blue : Colors.white,
        child: Text(
          text,
          style: TextStyle( fontSize:16,
            color: index == _selectedValueIndex ? Colors.black : Colors.black,
          ),
        ),
      ),
    );
  }

}


Future getEmpAttenSummary() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};


  var url = Uri.parse('https://stg.visitormanager.net/v1/employee/attedance/summary');
  var body = jsonEncode(
      {
        "startDate": "2022-06-01",
        "endDate": "2022-06-30"
      }
  );

  final response = await http.post(url, headers: headers, body: body);
  print(response.body);

  if (response.statusCode == 200) {
    final absentLogs = jsonDecode(response.body)["data"]["Absent_logs"];
    absentLog = absentLogs;
    print("absent_logs: $absentLogs");
    final presentLogs = jsonDecode(response.body)["data"]["Present_logs"];
    presentLog = presentLogs;
    print("present_logs: $presentLogs");
    return EmpAttendanceSummary.fromJson(jsonDecode(response.body));
  } else {
    print("Failed to fetch data");
  }

}

Future currentMonthAttendance() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};


  var url = Uri.parse('https://stg.visitormanager.net/v1/employee/attedance/summary');

  final response = await http.post(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return CurrentMonthAttendance.fromJson(jsonDecode(response.body));
  } else {
    print("Failed to fetch data");
  }

}

Future markAttendance() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};


  var url = Uri.parse('https://stg.visitormanager.net/v1/checkAttendance/today');

  final response = await http.get(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return AttendanceMark.fromJson(jsonDecode(response.body));
  } else {
    print("Failed to fetch data");
  }

}

