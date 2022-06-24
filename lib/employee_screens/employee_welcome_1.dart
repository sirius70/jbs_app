import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import '../models/empAttendance_summary_model.dart';
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

  SharedPreferencesInit() async {
    await Storage.init();
  }

  @override
  void initState(){
    super.initState();
    SharedPreferencesInit();
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
                              onPressed: (){
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
        body: SingleChildScrollView(
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

                          Stack(
                            children: [

                              PopupMenuButton(
                                constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width,
                                  minWidth: MediaQuery.of(context).size.width*0.5
                          ),
                                child: Container(
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

                              onSelected: (value) {
                                  _onMenuItemSelected(value as int);
                                  },
                                offset: Offset(0.0, 55),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),),
                                itemBuilder: (ctx) => [

                                  _buildPopupMenuItem('My profile', CupertinoIcons.person_crop_circle, Options.person_crop_circle.index),
                                  _buildPopupMenuItem('Notifications', Icons.upload, Options.notifications.index),
                                  _buildPopupMenuItem('Switch User', Icons.copy, Options.switch_account_outlined.index),
                                ],
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
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(Storage.get_name().toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Color(0xff005993)
                              ),),
                              IconButton(
                                  onPressed: () {
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
                                                      Navigator.pushReplacement(
                                                          (context as Element),
                                                          MaterialPageRoute(
                                                              builder: (BuildContext context) => Home2(empId: Storage.get_adminEmpID().toString(),
                                                                location: Storage.get_location().toString(),
                                                                name: Storage.get_name().toString(),)));
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
                                                      Navigator.pushReplacement(
                                                          (context as Element),
                                                          MaterialPageRoute(
                                                              builder: (BuildContext context) => Admin2(
                                                                location: Storage.get_location().toString(),
                                                                empID: Storage.get_adminEmpID().toString(),
                                                                name: Storage.get_name().toString(),)));
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
                                                      Navigator.pushReplacement(
                                                          (context as Element),
                                                          MaterialPageRoute(
                                                              builder: (BuildContext context) => employeeWelcome()));
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
                                  icon: Icon(Icons.arrow_drop_down,
                                      color: Colors.lightBlue))
                            ],
                          ),

                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Employee",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.amber
                            ),),
                          Text(Storage.get_location().toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff0060B9)
                          ),),
                          SizedBox(height: 5,),
                          Text("Emp ID: ${Storage.get_adminEmpID().toString()}")
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
                            fontSize: 22
                          ),),
                        ],
                      ),

                      Column(
                        children: [
                          Icon(Icons.check, size: 35,
                            color: Color(0xff0EAF00),),
                          SizedBox(height: 0,),
                          Text("Attendance marked",
                          style: TextStyle(
                              color: Color(0xff0EAF00),
                            fontSize: 13
                          ),)
                        ],
                      ),

                      Column(
                        children: [
                          Text("0", style: TextStyle(fontSize: 35,
                            color: Color(0xff0EAF00),),),
                          SizedBox(height: 0,),
                          Text("No visitor schedules",
                            style: TextStyle(
                                fontSize: 13,
                              color: Color(0xff0EAF00),
                            ),)
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
                                  fontSize: 22,
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
                                            fontSize: 15)),
                                    SizedBox(height: 2,),
                                    Text(DateFormat.MMMM().format(DateTime.now()).toString(), style: TextStyle(
                                        fontSize: 25,
                                        color: Color(0xff2989BF)
                                    ),)
                                  ],
                                ),

                                FutureBuilder(
                                  builder: (context, snapshot) {
                                    if (snapshot != null){
                                      EmpAttendanceSummary empAttSummary = snapshot.data as EmpAttendanceSummary ;
                                      if (empAttSummary == null){
                                        return Center(child: CircularProgressIndicator());
                                      }
                                      else{
                                        return Column(
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                Text("Present Days - ", style: TextStyle(
                                                  fontSize: 15,)),
                                                Text("${empAttSummary.data.Present} days", style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff0EAF00),
                                                ),)
                                              ],
                                            ),
                                            SizedBox(height: 7,),
                                            Row(
                                              children: [
                                                Text("Absent Days - ", style: TextStyle(
                                                  fontSize: 15,)),
                                                Text("${empAttSummary.data.Absent} days", style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xffFF2E00),
                                                ),)
                                              ],
                                            ),

                                          ],
                                        );
                                      }}
                                    else{
                                      return CircularProgressIndicator();
                                    }
                                  },
                                  future: getEmpAttenSummary()
                                ),


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
                            boxShadow: [new BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              blurRadius: 5.0,
                            ),]
                        ),
                        child: Center(child: Text("Request for regularization",textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22,
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
                                fontSize: 22,
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
                            child: Center(child: Text("Raise support request",textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
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
                        boxShadow: [new BoxShadow(
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
                                  fontSize: 22,
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
                                  height: 42,
                                  child: TextField(
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
                                        hintStyle: TextStyle(color: Color(0xff031627), fontSize: 15),
                                        hintText: "Name",
                                        ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5,),

                              Flexible(
                                child: Container(
                                  height: 42,
                                  child: TextField(
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
                                      hintStyle: TextStyle(color: Color(0xff031627), fontSize: 15),
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
                                  height: 42,
                                  child: TextField(
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
                                      hintStyle: TextStyle(color: Color(0xff031627), fontSize: 15),
                                      hintText: "Phone No.",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5,),

                              Flexible(
                                child: Container(
                                  height: 42,
                                  child: TextField(
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
                                      hintStyle: TextStyle(color: Color(0xff031627), fontSize: 15),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.calendar_month, color: Color(0xff2980B9),),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("09 SEPT", style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold
                                        ),),

                                        SizedBox(height: 3,),
                                        Text("Monday",style: TextStyle(
                                            color: Color(0xff2980B9)
                                        ), ),

                                        SizedBox(height: 3,),
                                        Row(
                                          children: [
                                            Text("03:00",style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                            ), ),
                                            Text(" am",style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ), ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),


                              ],
                            ),

                            Text("to", style: TextStyle(
                              color: Color(0xff2980B9),
                              fontSize: 18
                            ),),

                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.calendar_month, color: Color(0xff2980B9),),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("09 SEPT", style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold
                                        ),),

                                        SizedBox(height: 3,),
                                        Text("Monday",style: TextStyle(
                                            color: Color(0xff2980B9)
                                        ), ),

                                        SizedBox(height: 3,),
                                        Row(
                                          children: [
                                            Text("03:00",style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ), ),
                                            Text(" pm",style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ), ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),


                              ],
                            ),

                          ],
                        ),
                        
                        
                      ],
                    )
                ),
                ),

              ],
            ),
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

