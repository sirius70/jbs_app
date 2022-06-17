import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbs_app/employee_screens/profile_page_3.dart';
import 'package:jbs_app/employee_screens/scan_qr.dart';
import 'package:jbs_app/employee_screens/widgets/attendance_calendar.dart';
import 'dart:ui' as ui;

import 'employee_welcome_1.dart';
import 'guest_register_2.dart';
import 'my_attendance.dart';
import 'widgets/bar_graph.dart';

class myCalendar extends StatefulWidget {
  const myCalendar({Key? key}) : super(key: key);

  @override
  State<myCalendar> createState() => _myCalendarState();
}

class _myCalendarState extends State<myCalendar> {
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
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

                    Icon(CupertinoIcons.arrow_2_circlepath,
                    size: 30, color: Color(0xff59B2EC),)
                  ],
                ),
                //SizedBox(height: 30,),

                CalendarPage2(),

                // SizedBox(height: 10,),
                //
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: Column(
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Column(
                //             children: [
                //               Text("09/16*",  style: TextStyle(
                //                   fontSize: 28,
                //                   fontWeight: FontWeight.bold,
                //                   color: Color(0xff005993)
                //               ),),
                //
                //               Text("Present",),
                //
                //             ],
                //           ),
                //
                //           Container(
                //             width: MediaQuery.of(context).size.width*0.6,
                //             padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                //             decoration: BoxDecoration(
                //               color: Colors.grey.shade200,
                //               border: Border.all(color: Colors.grey.shade200),
                //               borderRadius: BorderRadius.circular(20),
                //
                //             ),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Row(
                //                   children: [
                //                     Container(
                //                       height:8,
                //                       width: 8,
                //                       decoration: BoxDecoration(
                //                         shape: BoxShape.circle,
                //                         color: Color(0xff0EAF00)
                //                       ),
                //                     ),
                //                     Text(" Present",
                //                       style: TextStyle(
                //                           color: Color(0xff005993)
                //                       ),)
                //                   ],
                //                 ),
                //
                //                 Row(
                //                   children: [
                //                     Container(
                //                       height:8,
                //                       width: 8,
                //                       decoration: BoxDecoration(
                //                           shape: BoxShape.circle,
                //                           color: Color(0xffFF3821)
                //                       ),
                //                     ),
                //                     Text(" Absent",
                //                       style: TextStyle(
                //                           color: Color(0xff005993)
                //                       ),)
                //                   ],
                //                 ),
                //
                //                 Row(
                //                   children: [
                //                     Container(
                //                       height:8,
                //                       width: 8,
                //                       decoration: BoxDecoration(
                //                           shape: BoxShape.circle,
                //                           color: Color(0xff59B2EC)
                //                       ),
                //                     ),
                //                     Text(" Today",
                //                       style: TextStyle(
                //                           color: Color(0xff005993)
                //                       ),)
                //                   ],
                //                 )
                //               ],
                //             ),
                //           ),
                //
                //         ],
                //       ),
                //
                //       SizedBox(height: 20,),
                //       Divider(),
                //       SizedBox(height: 20,),
                //
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text("19 October, Today",
                //                   style: TextStyle(
                //                     color: Color(0xff288EE3),
                //                     fontSize: 22
                //                   ),),
                //                   Text("ABSENT",
                //                     style: TextStyle(
                //                         color: Color(0xffFF2E00),
                //                         fontSize: 22
                //                     ),)
                //                 ],
                //               ),
                //               Container(
                //                 padding: EdgeInsets.only(top: 8,
                //                 bottom: 8, left: 30, right: 30),
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(25),
                //
                //                   color: Colors.white,
                //                   border: Border.all(color: Color(0xff288EE3) )
                //                 ),
                //                 child: Text("Regularize",  style: TextStyle(
                //                     fontSize: 15,
                //                     fontWeight: FontWeight.bold,
                //                     color: Color(0xff005993)
                //                 ),),
                //               )
                //             ],
                //           ),
                //
                //           Padding(
                //               padding: EdgeInsets.all(20),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text("Check-in at 8:59 AM via QR",
                //             style: TextStyle(
                //               fontSize: 15
                //             ),),
                //             SizedBox(height: 10,),
                //             Text("Exit detected at 12:15PM",
                //               style: TextStyle(
                //                   fontSize: 15
                //               ),),
                //             SizedBox(height: 10,),
                //             Text("Entry book detected at 12:45PM",
                //               style: TextStyle(
                //                   fontSize: 15
                //               ),),
                //             SizedBox(height: 10,),
                //             Text("Check-out at 6:59 AM via ID",
                //               style: TextStyle(
                //                   fontSize: 15
                //               ),),
                //             SizedBox(height: 10,),
                //           ],
                //           ),
                //           ),
                //
                //         ],
                //       )
                //
                //
                //     ],
                //   ),
                // )

              ],
            ),
          ),
        ),
      ),

    );
  }
}
