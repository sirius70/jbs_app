import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart'  as http;
import 'package:jbs_app/employee_screens/employee_welcome_1.dart';
import 'package:jbs_app/employee_screens/my_attendance.dart';
import 'package:jbs_app/manager/reqManagerRegularization.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import '../admin/admin2.dart';
import '../api/access.dart';
import '../employee_screens/my_scan_qr.dart';
import '../models/pending_req-count_model.dart';
import '../models/profile_model.dart';
import '../models/total_visitors_model.dart';
import '../storage.dart';
import 'approvereq.dart';
import 'manager_profile.dart';
import 'manager_scanQr.dart';
import 'viewusers.dart';
import 'package:marquee/marquee.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'more.dart';

class Home2 extends StatefulWidget {
   Home2({Key? key, required this.empId,
     required this.location,}) : super(key: key);
   String empId;
   String location;

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = true;
  PendingReqCount? pending;
  TotalVisitors? visitorsCount;
  ProfileApi? getProfile;

  @override
  void initState() {
    super.initState();
    loading = false;
    pendingReqCount();
    access().profile().then((value) {
      if(value["success"]){
        setState((){
          getProfile = ProfileApi.fromJson(value);
        });
        loading=false;

      }
    });

    access().pendingReqCount().then((value) {
      if(value["success"]){
        setState((){
          pending = PendingReqCount.fromJson(value);
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
      onWillPop: showExitPopup,
      child: SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            bottomNavigationBar: Container(
              color: Colors.white,
              child: BottomAppBar(
                  shape: CircularNotchedRectangle(),
                  color: Colors.transparent,
                  elevation: 0,
                  child: SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //     context, MaterialPageRoute(builder: (BuildContext context) =>
                            //     Admin2(empID: widget.empID, location: widget.location, name: widget.name)));
                            Get.off(()=>Home2(empId: Storage.get_adminEmpID().toString(),
                              location: Storage.get_location().toString(),));
                          },
                          child: Column(
                            children: [
                              LineIcon(
                                LineIcons.home,
                                size: 30,
                                color: HexColor('#005993'),
                              ),
                              Text(
                                'Home',
                                style: TextStyle(color: HexColor('#005993'), fontSize: 15),
                              )
                            ],
                          ),
                        ),

                        TextButton(
                          onPressed: () async{
                           final managerHome = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Users();
                            }));
                           if(managerHome == "managerHome"){
                             setState((){
                               access().profile().then((value) {
                                 if(value["success"]){
                                   setState((){
                                     getProfile = ProfileApi.fromJson(value);
                                   });
                                   loading=false;

                                 }
                               });

                               access().pendingReqCount().then((value) {
                                 if(value["success"]){
                                   setState((){
                                     pending = PendingReqCount.fromJson(value);
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
                             });
                           }
                            // Get.to(Users());
                          },
                          child: Column(
                            children: [
                              LineIcon(
                                LineIcons.bookOpen,
                                size: 30,
                                color: HexColor('#818081'),
                              ),
                              Text(
                                'User',
                                style: TextStyle(color: HexColor('#818081'), fontSize: 15),
                              )
                            ],
                          ),
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
                                // Navigator
                                //     .of(context)
                                //     .push(MaterialPageRoute(builder:
                                //     (BuildContext context) => adminScanQr()));
                                Get.to(profileQr());
                              },
                              icon: Icon(CupertinoIcons.qrcode_viewfinder,  size: 40,
                                  color: Color(0xff717171))),
                        ),

                        TextButton(
                          onPressed: () async{
                            print("stats");
                            final managerHome = await Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>myAttendance()));
                            if(managerHome == "managerHome"){
                              setState((){
                                access().profile().then((value) {
                                  if(value["success"]){
                                    setState((){
                                      getProfile = ProfileApi.fromJson(value);
                                    });
                                    loading=false;

                                  }
                                });

                                access().pendingReqCount().then((value) {
                                  if(value["success"]){
                                    setState((){
                                      pending = PendingReqCount.fromJson(value);
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
                              });
                            }
                          },
                          child: Column(
                            children: [
                              LineIcon(
                                LineIcons.barChart,
                                size: 30,
                                color: HexColor('#818081'),
                              ),
                              Text(
                                'Stats',
                                style: TextStyle(color: HexColor('#818081'), fontSize: 15),
                              )
                            ],
                          ),
                        ),


                        TextButton(
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return adminProfile();
                            // }));
                            Get.to(More());
                          },
                          child: Column(
                            children: [
                              LineIcon(
                                LineIcons.boxes,
                                size: 30,
                                color: HexColor('#818081'),
                              ),
                              Text(
                                'More',
                                style: TextStyle(color: HexColor('#818081'), fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            body:
            loading? Center(child: CircularProgressIndicator(),):

            Container(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello,',
                                  style: TextStyle(color: Colors.lightBlue,
                                      fontSize: MediaQuery.of(context).size.width*0.04),
                                ),
                                SizedBox(height: 3,),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.275,
                                          child: Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  //"${widget.name}",
                                                  getProfile==null? "": getProfile!.data[0].name,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 5,
                                                  textAlign: TextAlign.justify,
                                                  //"${widget.name}",
                                                  style: TextStyle(
                                                      color: Colors.blue.shade900,
                                                      fontSize: MediaQuery.of(context).size.width*0.05),
                                                ),
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
                                                                      location: Storage.get_location().toString(),
                                                                    )), (route) => false);
                                                              },
                                                              child: ListTile(
                                                                leading: Image(
                                                                    image: AssetImage(
                                                                        'lib/images/face.png')),
                                                                title: Text('Manager',
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        color: Colors.blue.shade900)),
                                                              ),)
                                                          ],
                                                          SizedBox(
                                                            height: 25,
                                                          ),

                                                          if(Storage.get_isAdmin()=="1")...[
                                                            GestureDetector(
                                                              onTap: (){
                                                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                                                    builder: (BuildContext context) => Admin2(
                                                                      location: Storage.get_location().toString(),
                                                                      empID: Storage.get_adminEmpID().toString(),)),
                                                                        (route) => false);
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
                                                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                                                    builder: (BuildContext context) => employeeWelcome()),
                                                                        (route) => false);

                                                              },
                                                              child: ListTile(
                                                                leading: Image(
                                                                    image: AssetImage(
                                                                        'lib/images/face.png')),
                                                                title: Text('Employee',
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.normal,
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
                                                color: Colors.lightBlue)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (BuildContext context) =>
                                  //       _buildPopupDialog(context),
                                  // );
                                  Get.to(More());
                                },
                                child: Image(
                                    image: AssetImage('lib/images/face.png'),
                                    height: 50),
                              ),
                              Text(
                                'Manager',
                                style: TextStyle(color: Colors.amber,
                                    fontSize: MediaQuery.of(context).size.width*0.03),
                              ),
                              Text(
                                widget.location.toString(),
                                style: TextStyle(color: Colors.blue,
                                fontSize: MediaQuery.of(context).size.width*0.04),
                              ),
                              Text(
                                "Emp ID: ${widget.empId}",
                                style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04),
                              )
                            ],
                          )
                        ],
                      ),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('You Have :',
                            style:
                                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.055,
                                    fontWeight: FontWeight.normal)),

                        // FutureBuilder(
                        //   future: pendingReqCount(),
                        //   builder: (BuildContext context,  snapshot) {
                        //     if (snapshot != null){
                        //       PendingReqCount pending = snapshot.data as PendingReqCount ;
                        //       if (pending == null){
                        //         return Column(
                        //           children: [
                        //             Text('0', style: TextStyle(
                        //                 color: Color(0xffFF3E01),
                        //                 fontSize: MediaQuery.of(context).size.width*0.08)),
                        //             Text(
                        //               'Pending requests',
                        //               style: TextStyle(color: Colors.red, fontSize: MediaQuery.of(context).size.width*0.03),
                        //             )
                        //           ],
                        //         );
                        //       }
                        //       else{
                        //         return Column(
                        //           children: [
                        //             Text('${pending.pendingRequests[0].COUNT}', style: TextStyle(
                        //                 color: Color(0xffFF3E01),
                        //                 fontSize: MediaQuery.of(context).size.width*0.08)),
                        //             Text(
                        //               'Pending requests',
                        //               style: TextStyle(color: Colors.red, fontSize: MediaQuery.of(context).size.width*0.03),
                        //             )
                        //           ],
                        //         );
                        //       }}
                        //   },
                        // ),


                        Column(
                          children: [
                            Text(pending==null?"0":"${pending!.pendingRequests[0].COUNT}", style: TextStyle(
                              color: Color(0xffFF3E01),
                                fontSize: MediaQuery.of(context).size.width*0.08)),
                            Text(
                              'Pending requests',
                              style: TextStyle(color: Colors.red, fontSize: MediaQuery.of(context).size.width*0.03),
                              )
                          ],
                        ),
                        Column(
                          children: [
                            Text(visitorsCount==null?'0':"${visitorsCount!.totalGuestsVisitedWithYou[0].count}",
                                style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.08,
                                color: Color(0xff0EAF00))),
                            Text( visitorsCount==null?'No visitor schedules':
                            visitorsCount!.totalGuestsVisitedWithYou[0].count == 0?
                            'No visitor schedules': "Visitor schedules",
                              style: TextStyle(color: Color(0xff0EAF00), fontSize: MediaQuery.of(context).size.width*0.03),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue,
                      child: Marquee(
                        text: 'sample text ',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        blankSpace: 20.0,
                        velocity: 60.0,
                        pauseAfterRound: Duration.zero,
                        startPadding: 10.0,
                        accelerationDuration: Duration.zero,
                        accelerationCurve: Curves.linear,
                        decelerationDuration: Duration.zero,
                        decelerationCurve: Curves.easeOut,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () async{
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>myAttendance()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [ BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                blurRadius: 5.0,
                              ),]
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const[
                                    Text('View attendance stats',
                                        style: TextStyle(
                                            color: Color(0xff092F52), fontSize: 20)),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff2980B9),
                                      ),
                                      child: Center(
                                        child: GestureDetector(
                                          child: const Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          onTap: (){

                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(child: Divider()),
                          Text("Approve Request's",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          Expanded(child: Divider()),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      GestureDetector(
                        // onTap: (){
                        //   access().managerReqLeave().then((value) {
                        //
                        //   });
                        // },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width*0.4,
                            height: MediaQuery.of(context).size.width*0.35,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [ BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  blurRadius: 5.0,
                                ),]
                            ),
                            child: Center(
                              child: Text(
                                'Request For \nLeave', textAlign: TextAlign.center,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                    color: Colors.blue.shade900,
                                    fontSize: MediaQuery.of(context).size.width*0.06,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          onTap: () async{
                            final managerHome = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Approve_req();
                            }));
                            if(managerHome == "managerHome"){
                              setState((){
                                access().profile().then((value) {
                                  if(value["success"]){
                                    setState((){
                                      getProfile = ProfileApi.fromJson(value);
                                    });
                                    loading=false;

                                  }
                                });

                                access().pendingReqCount().then((value) {
                                  if(value["success"]){
                                    setState((){
                                      pending = PendingReqCount.fromJson(value);
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
                              });
                            }
                          }
                          ),
                      GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.4,
                            height: MediaQuery.of(context).size.width*0.35,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [ BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  blurRadius: 5.0,
                                ),]
                            ),
                            child: Center(
                              child: Text(
                                'Request to \nregularize',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontSize: MediaQuery.of(context).size.width*0.06,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          onTap: () async{
                            final managerHome = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return reqRegularization();
                                }));
                            if(managerHome == "managerHome"){
                              setState((){
                                access().profile().then((value) {
                                  if(value["success"]){
                                    setState((){
                                      getProfile = ProfileApi.fromJson(value);
                                    });
                                    loading=false;

                                  }
                                });

                                access().pendingReqCount().then((value) {
                                  if(value["success"]){
                                    setState((){
                                      pending = PendingReqCount.fromJson(value);
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
                              });
                            }
                          })
                    ]),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: GestureDetector(
                            onTap: () async{
                              final managerHome = await Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>Users()));
                              if(managerHome == "managerHome"){
                                setState((){
                                  access().profile().then((value) {
                                    if(value["success"]){
                                      setState((){
                                        getProfile = ProfileApi.fromJson(value);
                                      });
                                      loading=false;

                                    }
                                  });

                                  access().pendingReqCount().then((value) {
                                    if(value["success"]){
                                      setState((){
                                        pending = PendingReqCount.fromJson(value);
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
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [ BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 5.0,
                                  ),]
                              ),
                              child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                         Text('View User Details',
                                            style: TextStyle(
                                                color: Color(0xff092F52), fontSize: 20)),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff2980B9),
                                          ),
                                          child: Center(
                                            child: GestureDetector(
                                              child: const Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              onTap: (){
                                                Get.to(Users());
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        ),
                  ]),
                ),
              ),
            )
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0))),
      content: Container(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Icon(
                  Icons.person_outline_rounded,
                  color: Colors.blue,
                ),
                Text(
                  'My profile',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: Colors.blue,
                ),
                Text(
                  'notifications',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future pendingReqCount() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};

  var url = Uri.parse('https://stg.visitormanager.net/v1/manager/count/pendingRequest', );

  final response = await http.get(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return PendingReqCount.fromJson(jsonDecode(response.body));
  } else {
    print("Failed to fetch data");
  }

}

