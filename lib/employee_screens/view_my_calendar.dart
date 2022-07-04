import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jbs_app/employee_screens/profile_page_3.dart';
import 'package:jbs_app/employee_screens/scan_qr.dart';
import 'package:jbs_app/employee_screens/widgets/attendance_calendar.dart';
import 'package:http/http.dart'  as http;
import 'package:jbs_app/models/current_month_attendance.dart';

import '../api/access.dart';
import '../models/attendance_mark_model.dart';
import '../models/emp_abs_pres_model.dart';
import '../storage.dart';
import 'employee_welcome_1.dart';
import 'guest_register_2.dart';
import 'my_attendance.dart';
import 'my_scan_qr.dart';

class myCalendar extends StatefulWidget {
  const myCalendar({Key? key}) : super(key: key);

  @override
  State<myCalendar> createState() => _myCalendarState();
}

class _myCalendarState extends State<myCalendar> {
  TextEditingController dateinput = TextEditingController();
  CurrentMonthAttendance? currMonth;


  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
    empAbsPresent();
    access().currMonthAttendance().then((value) {
      if(value["success"]){
        setState((){
          currMonth = CurrentMonthAttendance.fromJson(value);
        });
      }
    });

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
                              onPressed: () async{
                                // Icon(Icons.ac_unit, color :Colors.teal);
                               String refresh = await Navigator
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
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context)=>myAttendance()));
                              },
                              icon: Icon(CupertinoIcons.chart_bar, size: 30,
                                  color: Color(0xff0093CB))),
                          Text("Attendance",
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 13,),
                        onPressed: (){
                          Get.back();
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context)=>otpVerify()));
                        },
                        label: Text("Cancel", style: TextStyle(
                            color: Colors.white,
                            fontSize: 13
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

                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>myCalendar()));
                        print("d");
                      },
                      child: Icon(CupertinoIcons.arrow_2_circlepath,
                      size: 30, color: Color(0xff59B2EC),),
                    )
                  ],
                ),
                //SizedBox(height: 30,),

                CalendarPage2(),

              ],
            ),
          ),
        ),
      ),

    );
  }
}


Future empAbsPresent() async {

  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}',
  };

  var url = Uri.parse('https://stg.visitormanager.net/v1/employee/attendance/date');
  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200 || response.statusCode == 201) {

    final  presentList=jsonDecode(response.body)["data"]["Present_Dates"];
    presentLog = presentList;
    print("presebnrLogss : $presentLog");
    print("PresentList: $presentList") ;

    final presLen = presentList.length;
    print("presLen: ${presLen}");

    for (int i = 0; i < presLen; i++) {
      final year = DateTime
          .parse(presentList[i]["DateTime"])
          .year;
      print("years: $year");
      final month = DateTime
          .parse(presentList[i]["DateTime"])
          .month;
      print("months: $month");

      final day = DateTime
          .parse(presentList[i]["DateTime"])
          .day;
      print("days: $day");

      presentDates.add(
        DateTime(year, month, day),
      );
    }
    print("print present days: ${presentDates}");

    ///absent dates
    final  absentList=jsonDecode(response.body)["data"]["Absent_Dates"];
    print("AbsentList: $presentList") ;
    absentLog = absentList;
    final absLen = absentList.length;
    print("absLen: ${absLen}");

    for (int i = 0; i < absLen; i++) {
      final year = DateTime
          .parse(absentList[i]["DateTime"])
          .year;
      print("years: $year");
      final month = DateTime
          .parse(absentList[i]["DateTime"])
          .month;
      print("months: $month");

      final day = DateTime
          .parse(absentList[i]["DateTime"])
          .day;
      print("days: $day");

      absentDates.add(
        DateTime(year, month, day),
      );
    }
    print("print absent days: ${absentDates}");

    return presentList.map(((e)=>PresentDates.fromJson(e))).toList();

  } else {
    throw Exception('Failed to load album');
  }

}
