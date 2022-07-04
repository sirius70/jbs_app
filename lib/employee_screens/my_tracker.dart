import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbs_app/employee_screens/profile_page_3.dart';
import 'package:jbs_app/employee_screens/scan_qr.dart';

import 'admin_alert.dart';
import 'employee_welcome_1.dart';
import 'guest_register_2.dart';
import 'my_attendance.dart';
import 'my_scan_qr.dart';

class myTracking extends StatefulWidget {
  const myTracking({Key? key}) : super(key: key);

  @override
  State<myTracking> createState() => _myTrackingState();
}

class _myTrackingState extends State<myTracking> {
  bool loading = true;

  @override
  void initState(){
    super.initState();
    loading = false;
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
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Text("Tracking", textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff005993)
                    ),),

                  SizedBox(height: 20,),

              Container(
                width: MediaQuery.of(context).size.width*0.7,
                padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(20),

                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(CupertinoIcons.exclamationmark,
                      color: Color(0xffF4A100),),
                      Text("High",
                      style: TextStyle(
                        color: Color(0xff005993)
                      ),)
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.circle_outlined, size: 15,
                        color: Color(0xff1AA7EC),),
                      SizedBox(width: 2,),
                      Text("Moderate",
                        style: TextStyle(
                            color: Color(0xff005993)
                        ),)
                    ],
                  ),

                  Row(
                    children: [
                      Icon(CupertinoIcons.checkmark,
                        color: Color(0xff0EAF00),),
                      Text("Low",
                        style: TextStyle(
                            color: Color(0xff005993)
                        ),)
                    ],
                  )
                ],
              ),
              ),

              SizedBox(height: 50,),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
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
                      children: [
                        Icon(CupertinoIcons.exclamationmark, size: 15,
                          color: Color(0xffF4A100),),
                        SizedBox(width: 10,),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "David ",
                                style: TextStyle(
                                    color: Color(0xff154F85),
                                )),

                            TextSpan(
                                text: "has",
                                style: TextStyle(
                                    color: Colors.black,)),

                            TextSpan(
                                text: " checked in ",
                                style: TextStyle(
                                    color: Color(0xffF4A100),
                                )),

                            TextSpan(
                                text: "at the front desk",
                                style: TextStyle(
                                    color: Colors.black,)),
                          ]),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),

                    Row(
                      children: [
                        Icon(Icons.circle_outlined, size: 15,
                          color: Color(0xff1AA7EC),),
                        SizedBox(width: 10,),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "Project ",
                                style: TextStyle(
                                  color: Color(0xff154F85),
                                )),

                            TextSpan(
                                text: "meeting at",
                                style: TextStyle(
                                  color: Colors.black,)),

                            TextSpan(
                                text: " 4:30PM",
                                style: TextStyle(
                                  color: Color(0xff1AA7EC),
                                )),

                          ]),
                        ),
                      ],
                    )
                  ],
                ),
                ),
              ),


                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child: Container(
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
                      children: [
                      Icon(CupertinoIcons.exclamationmark, size: 20,
                        color: Color(0xffF4A100),),
                      SizedBox(width: 10,),
                        Text("Regularization Request", style: TextStyle(
                          color: Color(0xff005993),
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),)

                      ]),
                          SizedBox(height: 20,),

                          Padding(
                            padding: const EdgeInsets.only(left: 40.0, right: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: const TextSpan(children: <TextSpan>[
                                        TextSpan(
                                            text: "Rejected",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffF4A100),
                                            )),

                                        TextSpan(
                                            text: " - Not valid reason",
                                            style: TextStyle(
                                              color: Colors.black,)),

                                      ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 25,),


                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child: Container(
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
                              children: [
                                Icon(CupertinoIcons.checkmark, size: 20,
                                  color: Color(0xff0EAF00),),
                                SizedBox(width: 10,),
                                Text("Leave Request", style: TextStyle(
                                    color: Color(0xff005993),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),)

                              ]),
                          SizedBox(height: 20,),

                          Padding(
                            padding: const EdgeInsets.only(left: 40.0, ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text: "Accepted - Leave application sanctioned",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff005993),
                                              )),

                                        ]),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  SizedBox(height:25),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child: Container(
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
                              children: [
                                Icon(CupertinoIcons.checkmark, size: 20,
                                  color: Color(0xff0EAF00),),
                                SizedBox(width: 10,),
                                Text("Support Request", style: TextStyle(
                                    color: Color(0xff005993),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),)

                              ]),
                          SizedBox(height: 20,),

                          Padding(
                            padding: const EdgeInsets.only(left: 40.0, ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: <TextSpan>[
                                        TextSpan(
                                            text: "Resolved - Profile Reset by Admin",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            )),

                                      ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey,)),

                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> adminAlert()));
                          },
                          child: Text("That's all", style: TextStyle(
                            color: Color(0xff005993),
                          ),),
                        ),

                        Expanded(child: Divider(color: Colors.grey,)),

                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
