import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbs_app/employee_screens/profile_page_3.dart';
import 'package:jbs_app/employee_screens/scan_qr.dart';
import 'package:jbs_app/employee_screens/view_my_calendar.dart';
import 'dart:ui' as ui;

import '../models/empAttendance_summary_model.dart';
import 'employee_welcome_1.dart';
import 'guest_register_2.dart';
import 'widgets/bar_graph.dart';

class myAttendance extends StatefulWidget {
  const myAttendance({Key? key}) : super(key: key);

  @override
  State<myAttendance> createState() => _myAttendanceState();
}

class _myAttendanceState extends State<myAttendance> {
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
                SizedBox(height: 30,),

                Text("Attendance",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff005993)
                  ),),

                SizedBox(height: 10,),

                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [new BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 5.0,
                          ),]
                      ),
                      child: FutureBuilder(
                          builder: (context, snapshot) {
                            if (snapshot != null){
                              EmpAttendanceSummary empAttSummary = snapshot.data as EmpAttendanceSummary ;
                              if (empAttSummary == null){
                                return Center(child: CircularProgressIndicator());
                              }
                              else{
                                return  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [


                                    Row(
                                      children: [
                                        Text("Today's attendance: "),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.18,),
                                        Text("Marked", style: TextStyle(
                                            color: Color(0xff0EAF00)
                                        ),)
                                      ],
                                    ),

                                    SizedBox(height: 10,),

                                    Row(
                                      children: [
                                        Text("Present days this month: "),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.11,),
                                        Text("${empAttSummary.data.Present}", style: TextStyle(
                                            color: Color(0xff0EAF00)
                                        ),)
                                      ],
                                    ),
                                    SizedBox(height: 10,),

                                    Row(
                                      children: [
                                        Text("Absent days this month: "),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.12,),
                                        Text("${empAttSummary.data.Absent}", style: TextStyle(
                                            color: Color(0xffFF2E00)
                                        ),)
                                      ],
                                    ),
                                    SizedBox(height: 10,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context)=>myCalendar()));
                                          },
                                          child: Text("View in Calendar", style: TextStyle(
                                              color: Color(0xff092F52),
                                              decoration: TextDecoration.underline
                                          ),),
                                        )
                                      ],
                                    )
                                  ],
                                );
                              }}
                            else{
                              return CircularProgressIndicator();
                            }
                          },
                          future: getEmpAttenSummary()
                      ),


                    ),

                    SizedBox(height: 25,),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20),
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("From"),
                              SizedBox(width: 5,),
                              Container(
                                height: 25,
                                child: Directionality(
                                  textDirection: ui.TextDirection.rtl,
                                  child: ElevatedButton.icon(
                                    icon: Icon(Icons.keyboard_arrow_down_outlined,
                                      size:15,color: Colors.white,),
                                    onPressed: (){
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context)=>otpVerify()));
                                    },
                                    label: Text("Jan", style: TextStyle(
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
                                  //textDirection: TextDirection.rtl,
                                ),
                              ),
                              SizedBox(width: 10,),

                              Text("to"),
                              SizedBox(width: 10,),
                              Container(
                                height: 25,
                                child: Directionality(
                                  textDirection: ui.TextDirection.rtl,
                                  child: ElevatedButton.icon(
                                    icon: Icon(Icons.keyboard_arrow_down_outlined,
                                      size:15,color: Colors.white,),
                                    onPressed: (){
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context)=>otpVerify()));
                                    },
                                    label: Text("Jun", style: TextStyle(
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
                                  //textDirection: TextDirection.rtl,
                                ),
                              ),
                            ],
                          ),

                          //SizedBox(height: 20,),
                          Container(
                            child: Chart(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Text("Logs",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff005993)
                  ),),


                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:const [
                      Text("03/04/2022 - Checking at 8:59 AM via QR",
                      style: TextStyle(
                        fontSize: 15
                      ),),
                      SizedBox(height: 10,),
                      Text("03/04/2022 - CheckOut at 4:59 AM via ID",
                        style: TextStyle(
                            fontSize: 15
                        ),),
                      SizedBox(height: 10,),
                      Text("03/04/2022 - Left premises at 5:00 PM via South Gate",
                        style: TextStyle(
                            fontSize: 15
                        ),),
                      SizedBox(height: 10,),
                      Text("03/04/2022 - Checking at 8:59 AM via QR",
                        style: TextStyle(
                            fontSize: 15
                        ),),
                      SizedBox(height: 10,),
                      Text("03/04/2022 - Checking at 8:59 AM via QR",
                        style: TextStyle(
                            fontSize: 15
                        ),),
                      SizedBox(height: 10,),
                      Text("03/04/2022 - Checking at 8:59 AM via QR",
                        style: TextStyle(
                            fontSize: 15
                        ),),
                      SizedBox(height: 10,),


                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),

    );
  }
}
