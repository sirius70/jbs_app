import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jbs_app/api/access.dart';
import 'package:jbs_app/employee_screens/my_scan_qr.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import '../models/manager_request_leave_model.dart';
import '../storage.dart';
import 'home.dart';
import 'manager_scanQr.dart';
import 'more.dart';
import 'viewusers.dart';
import 'package:http/http.dart'  as http;

class Approve_req extends StatefulWidget {
  const Approve_req({Key? key}) : super(key: key);

  @override
  State<Approve_req> createState() => _Approve_reqState();
}

class _Approve_reqState extends State<Approve_req> {
  bool _myBool = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = true;

  @override
  void initState(){
    super.initState();
    getLeaveReqList();
    access().managerReqLeave();
    loading=false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
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
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return UsersLists();
                            // }));
                            Get.to(Users());
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
                          onPressed: () {
                            print("stats");
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return stats();
                            // }));
                            // Get.to(stats());
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
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: Builder(
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.only(left:3.0),
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.pop(context);
                            Navigator.pop(context, "managerHome");
                          },
                          child: Row(
                            children: const[
                              Icon(Icons.arrow_back_ios,
                                  color: Color(0xff005993), size: 12),
                              Text("back",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff005993)
                                ),)
                            ],
                          ),
                        ),
                      );
                    }
                ),
                title: Text(
                  'Approve requests',
                  style: TextStyle(color: Colors.blue.shade900),
                ),
                centerTitle: true,
                // flexibleSpace: Center(
                //   child: Row(
                //     children: [
                //       SizedBox(
                //         width: 260,
                //       ),
                //       TextButton(
                //           onPressed: () {
                //             setState(() => _myBool = !_myBool);
                //             showMaterialModalBottomSheet(
                //                 expand: false,
                //                 context: context,
                //                 backgroundColor: Colors.transparent,
                //                 builder: (context) => Container(
                //                       height: 150,
                //                       width: MediaQuery.of(context).size.width,
                //                       decoration: BoxDecoration(
                //                           color: Colors.white,
                //                           borderRadius: BorderRadius.only(
                //                               topLeft: Radius.circular(18),
                //                               topRight: Radius.circular(18))),
                //                       child: Column(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.center,
                //                         children: [
                //                           TextButton(
                //                               onPressed: () {},
                //                               child: Text(
                //                                 'Approve all',
                //                                 style: TextStyle(
                //                                     color: Colors.blue,
                //                                     fontSize: 15),
                //                               )),
                //                           SizedBox(
                //                             height: 5,
                //                           ),
                //                           TextButton(
                //                               onPressed: () {},
                //                               child: Text(
                //                                 'Deny all',
                //                                 style: TextStyle(
                //                                     color: Colors.blue),
                //                               ))
                //                         ],
                //                       ),
                //                     ));
                //           },
                //           child: Row(
                //               mainAxisAlignment: MainAxisAlignment.end,
                //               children: [
                //                 SizedBox(
                //                     height: 20.0,
                //                     width: 20.0,
                //                     child: GestureDetector(
                //                       onTap: () {
                //                         showMaterialModalBottomSheet(
                //                             expand: false,
                //                             context: context,
                //                             backgroundColor: Colors.transparent,
                //                             builder: (context) => Container(
                //                                   height: 150,
                //                                   width: MediaQuery.of(context)
                //                                       .size
                //                                       .width,
                //                                   decoration: BoxDecoration(
                //                                       color: Colors.white,
                //                                       borderRadius:
                //                                           BorderRadius.only(
                //                                               topLeft: Radius
                //                                                   .circular(18),
                //                                               topRight: Radius
                //                                                   .circular(
                //                                                       18))),
                //                                   child: Column(
                //                                     mainAxisAlignment:
                //                                         MainAxisAlignment
                //                                             .center,
                //                                     children: [
                //                                       TextButton(
                //                                           onPressed: () {},
                //                                           child: Text(
                //                                             'Approve all',
                //                                             style: TextStyle(
                //                                                 color:
                //                                                     Colors.blue,
                //                                                 fontSize: 15),
                //                                           )),
                //                                       Divider(
                //                                         thickness: 0.5,
                //                                         color: Colors.grey,
                //                                       ),
                //                                       TextButton(
                //                                           onPressed: () {},
                //                                           child: Text(
                //                                             'Deny all',
                //                                             style: TextStyle(
                //                                                 color: Colors
                //                                                     .blue),
                //                                           ))
                //                                     ],
                //                                   ),
                //                                 ));
                //                       },
                //                       child: Checkbox(
                //                           value: _myBool,
                //                           onChanged: (value) {
                //                             setState(() => _myBool = value!);
                //                           }),
                //                     )),
                //                 SizedBox(width: 5.0),
                //                 Text(
                //                   "Select all",
                //                   style: TextStyle(color: Colors.lightBlue),
                //                 )
                //               ])),
                //     ],
                //)   ),
                ),
            body: loading?  Center(child: CircularProgressIndicator()):

            Column(
              children: [

                Expanded(
                  child: FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot != null){
                        ManagerRequestLeave reqLeaveListss = snapshot.data as ManagerRequestLeave ;
                        if (reqLeaveListss == null){
                          return Center(child: Text("No requests"),);
                        }
                        else{
                          return ListView.separated(
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount: reqLeaveListss.data.length,
                              itemBuilder: (context, index){
                                return Dismissible(
                                    key: Key(reqLeaveListss.data[index].toString()),
                                    //direction: DismissDirection.endToStart,
                                    background: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade300,
                                        //borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children:const [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Approve",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                    secondaryBackground: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade300,
                                        //borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: const [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(
                                            Icons.delete_outlined,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Deny",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                    confirmDismiss: (direction) async {
                                      if (direction  == DismissDirection.endToStart){
                                        //status = true;
                                        return await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Center(
                                              child: Container(
                                                padding: EdgeInsets.all(20),
                                                height: MediaQuery.of(context).size.width * 0.5,
                                                width: MediaQuery.of(context).size.width * 0.75,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(20),
                                                    boxShadow: [new BoxShadow(
                                                      color: Colors.grey.withOpacity(0.4),
                                                      blurRadius: 5.0,
                                                    ),]
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("Are you sure you want to deny this request?", textAlign: TextAlign.center,
                                                      style: TextStyle( fontSize: MediaQuery.of(context).size.width*0.05,
                                                          color: Color(0xff005993)
                                                      ),),

                                                    SizedBox(height: 20,),

                                                    Divider(),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [

                                                        TextButton(
                                                          onPressed: () => Navigator.of(context).pop(false),
                                                          child: const Text("Dismiss"),
                                                        ),

                                                        VerticalDividerWidget(),

                                                        TextButton(
                                                            onPressed: () {
                                                              bool status = false;
                                                              final requestId = reqLeaveListss.data[index].id;
                                                              Storage.set_reqId(requestId.toString());
                                                              final reqId = Storage.get_reqId();
                                                              print("reqId: $reqId");
                                                              access().managerApproveLeave(status, reqId).then((value){
                                                                if (value["success"]){
                                                                  Navigator.of(context).pop(true);
                                                                  Fluttertoast.showToast(
                                                                      msg: "The request has been addressed",
                                                                      toastLength: Toast.LENGTH_SHORT,
                                                                      gravity: ToastGravity.BOTTOM,
                                                                      timeInSecForIosWeb: 1,
                                                                      backgroundColor: Colors.green.shade400,
                                                                      textColor: Colors.white,
                                                                      fontSize: 16.0);
                                                                }
                                                              });

                                                            },
                                                            child: const Text("Deny")
                                                        ),

                                                      ],
                                                    ),


                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } else{
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            bool status = true;
                                            final requestId = reqLeaveListss.data[index].id;
                                            Storage.set_reqId(requestId.toString());
                                            final reqId = Storage.get_reqId();
                                            print("reqId: $reqId");
                                            access().managerApproveLeave(status, reqId).then((value){
                                              if (value["success"]){

                                                setState((){
                                                  reqLeaveListss.data.removeAt(index);
                                                });
                                                //Navigator.of(context).pop(true);
                                                //
                                                // Fluttertoast.showToast(
                                                //     msg: "The request has been addressed",
                                                //     toastLength: Toast.LENGTH_SHORT,
                                                //     gravity: ToastGravity.BOTTOM,
                                                //     timeInSecForIosWeb: 1,
                                                //     backgroundColor: Colors.green.shade400,
                                                //     textColor: Colors.white,
                                                //     fontSize: 16.0);
                                              } else{
                                                Fluttertoast.showToast(
                                                    msg: "Request not approved",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red.shade400,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0
                                                );
                                              }
                                            });


                                            Future.delayed(Duration(seconds: 3), () {
                                              Navigator.of(context).pop(true);
                                            });
                                            return Center(
                                              child: Container(
                                                padding: EdgeInsets.all(20),
                                                height: 65,
                                                width: MediaQuery.of(context).size.width * 0.9,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(20),
                                                    boxShadow: [new BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius: 5.0,
                                                    ),]
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Approved the request", textAlign: TextAlign.center,
                                                      style: TextStyle( fontSize: 15,
                                                      ),),

                                                    // Row(
                                                    //   children: [
                                                    //     VerticalDividerWidget(),
                                                    //
                                                    //     TextButton(
                                                    //       onPressed: () {
                                                    //         Navigator.pop(context);
                                                    //       },
                                                    //       child: const Text("Undo"),
                                                    //     ),
                                                    //   ],
                                                    // )

                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }

                                    },


                                    child: ListTile(
                                      leading: Image(
                                        image: AssetImage('lib/images/face3.png'),
                                        height: MediaQuery.of(context).size.width*0.16,
                                      ),
                                      title: Text(reqLeaveListss.data[index].reqType.toString(), style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.width*0.0375,
                                          backgroundColor: Colors.grey.shade300
                                      ),),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("${"empId: ${reqLeaveListss.data[index].employeeId}".toString()}",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width*0.0375,
                                                color: Colors.black,
                                                backgroundColor: Colors.grey.shade300
                                            ),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("reason: ${reqLeaveListss.data[index].reason}",
                                            maxLines: 3,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: MediaQuery.of(context).size.width*0.0375,
                                                backgroundColor: Colors.grey.shade300
                                            ),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("date of req: ${reqLeaveListss.data[index].dateOfReq}",
                                            maxLines: 3,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: MediaQuery.of(context).size.width*0.0375,
                                                backgroundColor: Colors.grey.shade300
                                            ),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("leave date: ${reqLeaveListss.data[index].dateFor}",
                                            maxLines: 3,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: MediaQuery.of(context).size.width*0.0375,
                                                backgroundColor: Colors.grey.shade300
                                            ),),
                                        ],
                                      ),
                                    )


                                  // Container(
                                  //   padding: EdgeInsets.all(10),
                                  //   child: Column(
                                  //     children: [
                                  //       Row(
                                  //           children: [
                                  //             Image(
                                  //               image: AssetImage('lib/images/face3.png'),
                                  //               height: 70,
                                  //             ),
                                  //             SizedBox(
                                  //               width: 10,
                                  //             ),
                                  //             Column(
                                  //               crossAxisAlignment: CrossAxisAlignment.start,
                                  //               children: [
                                  //                 Text(reqLeaveListss.data[index].reqType,
                                  //                   style: TextStyle(
                                  //                       backgroundColor: Colors.grey.shade300,
                                  //                       fontSize: 15, fontWeight: FontWeight.bold
                                  //                   ),),
                                  //                 SizedBox(
                                  //                   height: 5,
                                  //                 ),
                                  //                 Text("empId: ${reqLeaveListss.data[index].employeeId}",
                                  //                   style: TextStyle(
                                  //                     backgroundColor: Colors.grey.shade300,
                                  //                     fontSize: 15,
                                  //                   ),),
                                  //                 SizedBox(
                                  //                   height: 5,
                                  //                 ),
                                  //                 Text("reason: ${reqLeaveListss.data[index].reason}",
                                  //                   style: TextStyle(
                                  //                     backgroundColor: Colors.grey.shade300,
                                  //                     fontSize: 15,
                                  //                   ),),
                                  //                 SizedBox(
                                  //                   height: 5,
                                  //                 ),
                                  //                 Text("date of req: ${reqLeaveListss.data[index].dateOfReq}",
                                  //                   style: TextStyle(
                                  //                     backgroundColor: Colors.grey.shade300,
                                  //                     fontSize: 15,
                                  //                   ),),
                                  //                 SizedBox(
                                  //                   height: 5,
                                  //                 ),
                                  //                 Text("leave date: ${reqLeaveListss.data[index].dateFor}",
                                  //                   style: TextStyle(
                                  //                     backgroundColor: Colors.grey.shade300,
                                  //                     fontSize: 15,
                                  //                   ),),
                                  //               ],
                                  //             ),
                                  //           ]),
                                  //
                                  //     ],
                                  //   ),
                                  // ),

                                );




                              }
                          );
                        }}
                      else{
                        return CircularProgressIndicator();
                      }
                    },

                    future: getLeaveReqList(),
                  ),
                ),


              ],
            ))
    );
  }
}


// Widget weatherBox(BuildContext context, ManagerRequestLeave reqLeaveListss){
//   return ListView.separated(
//       separatorBuilder: (BuildContext context, int index) {
//         return SizedBox(
//           height: 20,
//         );
//       },
//       itemCount: reqLeaveListss.data.length,
//       itemBuilder: (context, index){
//         return Dismissible(
//           key: Key(reqLeaveListss.data[index].toString()),
//           //direction: DismissDirection.endToStart,
//           background: Container(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             decoration: BoxDecoration(
//               color: Colors.green.shade300,
//               //borderRadius: BorderRadius.circular(15),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children:const [
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Icon(
//                   Icons.check,
//                   color: Colors.white,
//                 ),
//                 Text(
//                   "Approve",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700,
//                   ),
//                   textAlign: TextAlign.left,
//                 ),
//               ],
//             ),
//           ),
//           secondaryBackground: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             decoration: BoxDecoration(
//               color: Colors.red.shade300,
//               //borderRadius: BorderRadius.circular(15),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: const [
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Icon(
//                   Icons.delete_outlined,
//                   color: Colors.white,
//                 ),
//                 Text(
//                   "Deny",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700,
//                   ),
//                   textAlign: TextAlign.left,
//                 ),
//               ],
//             ),
//           ),
//           confirmDismiss: (direction) async {
//             if (direction  == DismissDirection.endToStart){
//               //status = true;
//               return await showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return Center(
//                     child: Container(
//                       padding: EdgeInsets.all(20),
//                       height: MediaQuery.of(context).size.width * 0.5,
//                       width: MediaQuery.of(context).size.width * 0.75,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [new BoxShadow(
//                             color: Colors.grey.withOpacity(0.4),
//                             blurRadius: 5.0,
//                           ),]
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Are you sure you want this \nrequest?", textAlign: TextAlign.center,
//                             style: TextStyle( fontSize: 20,
//                                 color: Color(0xff005993)
//                             ),),
//
//                           SizedBox(height: 20,),
//
//                           Divider(),
//
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//
//                               TextButton(
//                                 onPressed: () => Navigator.of(context).pop(false),
//                                 child: const Text("Dismiss"),
//                               ),
//
//                               VerticalDividerWidget(),
//
//                               TextButton(
//                                   onPressed: () {
//                                     bool status = false;
//                                     final requestId = reqLeaveListss.data[index].id;
//                                     Storage.set_reqId(requestId.toString());
//                                     final reqId = Storage.get_reqId();
//                                     print("reqId: $reqId");
//                                     access().managerApproveLeave(status, reqId).then((value){
//                                       if (value["success"]){
//                                         Navigator.of(context).pop(true);
//                                         Fluttertoast.showToast(
//                                             msg: "The request has been addressed",
//                                             toastLength: Toast.LENGTH_SHORT,
//                                             gravity: ToastGravity.BOTTOM,
//                                             timeInSecForIosWeb: 1,
//                                             backgroundColor: Colors.green.shade400,
//                                             textColor: Colors.white,
//                                             fontSize: 16.0);
//                                       }
//                                     });
//
//                                   },
//                                   child: const Text("Deny")
//                               ),
//
//                             ],
//                           ),
//
//
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             } else{
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   bool status = true;
//                   final requestId = reqLeaveListss.data[index].id;
//                   Storage.set_reqId(requestId.toString());
//                   final reqId = Storage.get_reqId();
//                   print("reqId: $reqId");
//                   access().managerApproveLeave(status, reqId).then((value){
//                     if (value["success"]){
//
//
//                       //Navigator.of(context).pop(true);
//                       //
//                       // Fluttertoast.showToast(
//                       //     msg: "The request has been addressed",
//                       //     toastLength: Toast.LENGTH_SHORT,
//                       //     gravity: ToastGravity.BOTTOM,
//                       //     timeInSecForIosWeb: 1,
//                       //     backgroundColor: Colors.green.shade400,
//                       //     textColor: Colors.white,
//                       //     fontSize: 16.0);
//                     }
//                   });
//                   setState((){
//                     reqLeaveListss.data.removeAt(index);
//                   });
//
//                   Future.delayed(Duration(seconds: 3), () {
//                     Navigator.of(context).pop(true);
//                   });
//                   return Center(
//                     child: Container(
//                       padding: EdgeInsets.all(20),
//                       height: 65,
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [new BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 5.0,
//                           ),]
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("Approved the request", textAlign: TextAlign.center,
//                             style: TextStyle( fontSize: 15,
//                             ),),
//
//                           // Row(
//                           //   children: [
//                           //     VerticalDividerWidget(),
//                           //
//                           //     TextButton(
//                           //       onPressed: () {
//                           //         Navigator.pop(context);
//                           //       },
//                           //       child: const Text("Undo"),
//                           //     ),
//                           //   ],
//                           // )
//
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//
//           },
//
//
//           child: ListTile(
//             leading: Image(
//               image: AssetImage('lib/images/face3.png'),
//               height: MediaQuery.of(context).size.width*0.16,
//             ),
//             title: Text(reqLeaveListss.data[index].reqType.toString(), style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: MediaQuery.of(context).size.width*0.0375,
//                 backgroundColor: Colors.grey.shade300
//             ),),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text("${"empId: ${reqLeaveListss.data[index].employeeId}".toString()}",
//                   style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.width*0.0375,
//                     color: Colors.black,
//                     backgroundColor: Colors.grey.shade300
//                 ),),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text("reason: ${reqLeaveListss.data[index].reason}",
//                   maxLines: 3,
//                   overflow: TextOverflow.clip,
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: MediaQuery.of(context).size.width*0.0375,
//                       backgroundColor: Colors.grey.shade300
//                   ),),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text("date of req: ${reqLeaveListss.data[index].dateOfReq}",
//                   maxLines: 3,
//                   overflow: TextOverflow.clip,
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: MediaQuery.of(context).size.width*0.0375,
//                       backgroundColor: Colors.grey.shade300
//                   ),),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text("leave date: ${reqLeaveListss.data[index].dateFor}",
//                   maxLines: 3,
//                   overflow: TextOverflow.clip,
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: MediaQuery.of(context).size.width*0.0375,
//                       backgroundColor: Colors.grey.shade300
//                   ),),
//               ],
//             ),
//           )
//
//
//           // Container(
//           //   padding: EdgeInsets.all(10),
//           //   child: Column(
//           //     children: [
//           //       Row(
//           //           children: [
//           //             Image(
//           //               image: AssetImage('lib/images/face3.png'),
//           //               height: 70,
//           //             ),
//           //             SizedBox(
//           //               width: 10,
//           //             ),
//           //             Column(
//           //               crossAxisAlignment: CrossAxisAlignment.start,
//           //               children: [
//           //                 Text(reqLeaveListss.data[index].reqType,
//           //                   style: TextStyle(
//           //                       backgroundColor: Colors.grey.shade300,
//           //                       fontSize: 15, fontWeight: FontWeight.bold
//           //                   ),),
//           //                 SizedBox(
//           //                   height: 5,
//           //                 ),
//           //                 Text("empId: ${reqLeaveListss.data[index].employeeId}",
//           //                   style: TextStyle(
//           //                     backgroundColor: Colors.grey.shade300,
//           //                     fontSize: 15,
//           //                   ),),
//           //                 SizedBox(
//           //                   height: 5,
//           //                 ),
//           //                 Text("reason: ${reqLeaveListss.data[index].reason}",
//           //                   style: TextStyle(
//           //                     backgroundColor: Colors.grey.shade300,
//           //                     fontSize: 15,
//           //                   ),),
//           //                 SizedBox(
//           //                   height: 5,
//           //                 ),
//           //                 Text("date of req: ${reqLeaveListss.data[index].dateOfReq}",
//           //                   style: TextStyle(
//           //                     backgroundColor: Colors.grey.shade300,
//           //                     fontSize: 15,
//           //                   ),),
//           //                 SizedBox(
//           //                   height: 5,
//           //                 ),
//           //                 Text("leave date: ${reqLeaveListss.data[index].dateFor}",
//           //                   style: TextStyle(
//           //                     backgroundColor: Colors.grey.shade300,
//           //                     fontSize: 15,
//           //                   ),),
//           //               ],
//           //             ),
//           //           ]),
//           //
//           //     ],
//           //   ),
//           // ),
//
//         );
//
//
//
//
//       }
//   );
// }

class VerticalDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 1,
      color: Color(0xffEBEBEB),
    );
  }
}



Future getLeaveReqList() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};

  var url = Uri.parse('https://stg.visitormanager.net/v1/manager/request/leave', );

  final response = await http.get(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return ManagerRequestLeave.fromJson(jsonDecode(response.body));
  } else {
    print("Failed to fetch data");
  }

}



// Expanded(
//     child: ListView.builder(
//       itemCount: denyItems.length,
//         itemBuilder: (context, idx){
//         return Dismissible(
//           key: Key(denyItems[idx].index.toString()),
//           //direction: DismissDirection.endToStart,
//             secondaryBackground: Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                 color: Color(0xFFFFE6E6),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Row(
//                 children: [
//                   Spacer(),
//                   Container(
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: NetworkImage("https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/afbdefed9ed20c76cbb6a4fbe3bf0ba25d3e246c/assets/icons/Trash.svg"),
//                             fit: BoxFit.fill
//                         )
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             onDismissed: (direction) {
//               setState(() {
//                 denyItems.removeAt(idx);
//               });
//             },
//             confirmDismiss: (direction) async {
//             if (direction  == DismissDirection.endToStart){
//               return await showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return Center(
//                     child: Container(
//                       padding: EdgeInsets.all(20),
//                       height: MediaQuery.of(context).size.width * 0.5,
//                       width: MediaQuery.of(context).size.width * 0.75,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [new BoxShadow(
//                             color: Colors.grey.withOpacity(0.4),
//                             blurRadius: 5.0,
//                           ),]
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Are you sure you want this \nrequest?", textAlign: TextAlign.center,
//                             style: TextStyle( fontSize: 20,
//                                 color: Color(0xff005993)
//                             ),),
//
//                           SizedBox(height: 20,),
//
//                           Divider(),
//
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//
//                               FlatButton(
//                                 onPressed: () => Navigator.of(context).pop(false),
//                                 child: const Text("Dismiss"),
//                               ),
//
//                               VerticalDividerWidget(),
//
//                               FlatButton(
//                                   onPressed: () => Navigator.of(context).pop(true),
//                                   child: const Text("Deny")
//                               ),
//
//                             ],
//                           ),
//
//
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             } else{
//               setState(() {
//                 // added this block
//                 approve deletedItem = approveItems.removeAt(idx);
//
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     Future.delayed(Duration(seconds: 3), () {
//                       Navigator.of(context).pop(true);
//                     });
//                     return Center(
//                       child: Container(
//                         padding: EdgeInsets.all(20),
//                         height: 65,
//                         width: MediaQuery.of(context).size.width * 0.9,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [new BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 5.0,
//                             ),]
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Approve the request", textAlign: TextAlign.center,
//                               style: TextStyle( fontSize: 15,
//                               ),),
//
//                             Row(
//                               children: [
//                                 VerticalDividerWidget(),
//
//                                 FlatButton(
//                                   onPressed: () {
//
//                                     setState(() => approveItems.insert(idx, deletedItem));
//                                     Navigator.pop(context);
//                                   },
//                                   child: const Text("Undo"),
//                                 ),
//                               ],
//                             )
//
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//
//               });
//             }
//
//             },
//           background: Container(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             decoration: BoxDecoration(
//               color: Color(0xFFFFE6E6),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Row(
//               children: [
//                 Spacer(),
//                 Container(
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage("https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/afbdefed9ed20c76cbb6a4fbe3bf0ba25d3e246c/assets/icons/Trash.svg"),
//                       fit: BoxFit.fill
//                     )
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           child: Expanded(
//             child: FutureBuilder(
//               builder: (context, snapshot) {
//                 if (snapshot != null){
//                   ManagerRequestLeave _weather = snapshot.data as ManagerRequestLeave ;
//                   if (_weather == null){
//                     return Center(child: CircularProgressIndicator(),);
//                   }
//                   else{
//                     return weatherBox(context, _weather);
//                   }}
//                 else{
//                   return CircularProgressIndicator();
//                 }
//               },
//
//               future: getLeaveReqList(),
//             ),
//           ),
//
//           // Container(
//           //   padding: EdgeInsets.all(10),
//           //   width: MediaQuery.of(context).size.width,
//           //   color: Color(0xffFF3E01),
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //     children: [
//           //       Row(
//           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //         children: [
//           //           CircleAvatar(
//           //             backgroundImage: AssetImage("lib/images/face.png"),
//           //           ),
//           //           SizedBox(width: 8,),
//           //
//           //           Column(
//           //             crossAxisAlignment: CrossAxisAlignment.start,
//           //             children: [
//           //               Container(
//           //                 height: 10,
//           //                 width: 100,
//           //                 color: Colors.white,
//           //               ),
//           //               SizedBox(
//           //                 height: 5,
//           //               ),
//           //
//           //               Container(
//           //                 height: 10,
//           //                 width: 150,
//           //                 color: Colors.white,
//           //               ),
//           //               SizedBox(
//           //                 height: 5,
//           //               ),
//           //
//           //               Container(
//           //                 height: 10,
//           //                 width: 150,
//           //                 color: Colors.white,
//           //               ),
//           //             ],
//           //           )
//           //         ],
//           //       ),
//           //
//           //
//           //       Padding(
//           //         padding: const EdgeInsets.only(left:20, right: 20),
//           //         child: Container(
//           //             child: Text("Denied", style: TextStyle(
//           //               color: Colors.white
//           //             ),)
//           //         ),
//           //       )
//           //     ],
//           //   ),
//           // )
//         );
//         }
//
//     ),
//
// ),


// Expanded(
//   child: ListView.builder(
//       itemCount: approveItems.length,
//       itemBuilder: (context, idx){
//         return Container(
//           child: Dismissible(
//               key: Key(approveItems[idx].index.toString()),
//               direction: DismissDirection.startToEnd,
//               onDismissed: (direction) {
//                 setState(() {
//                   // added this block
//                   approve deletedItem = approveItems.removeAt(idx);
//
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       Future.delayed(Duration(seconds: 3), () {
//                         Navigator.of(context).pop(true);
//                       });
//                       return Center(
//                         child: Container(
//                           padding: EdgeInsets.all(20),
//                           height: 65,
//                           width: MediaQuery.of(context).size.width * 0.9,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [new BoxShadow(
//                                 color: Colors.grey,
//                                 blurRadius: 5.0,
//                               ),]
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Approve the request", textAlign: TextAlign.center,
//                                 style: TextStyle( fontSize: 15,
//                                 ),),
//
//                               Row(
//                                 children: [
//                                   VerticalDividerWidget(),
//
//                                   FlatButton(
//                                       onPressed: () {
//
//                                         setState(() => approveItems.insert(idx, deletedItem));
//                                         Navigator.pop(context);
//                                       },
//                                     child: const Text("Undo"),
//                                   ),
//                                 ],
//                               )
//
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//
//                 });
//               },
//
//               background: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 decoration: BoxDecoration(
//                   color: Color(0xFFFFE6E6),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Row(
//                   children: [
//                     Spacer(),
//                     Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: NetworkImage("https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/afbdefed9ed20c76cbb6a4fbe3bf0ba25d3e246c/assets/icons/Trash.svg"),
//                               fit: BoxFit.fill
//                           )
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 width: MediaQuery.of(context).size.width,
//                 color: Color(0xff0EAF00),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//
//                     Padding(
//                       padding: const EdgeInsets.only(left:20, right: 20),
//                       child: Container(
//                           child: Text("Approve", style: TextStyle(
//                               color: Colors.white
//                           ),)
//                       ),
//                     ),
//
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: AssetImage("lib/images/face.png"),
//                         ),
//                         SizedBox(width: 8,),
//
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: 10,
//                               width: 100,
//                               color: Colors.white,
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//
//                             Container(
//                               height: 10,
//                               width: 150,
//                               color: Colors.white,
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//
//                             Container(
//                               height: 10,
//                               width: 150,
//                               color: Colors.white,
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//
//
//
//
//                   ],
//                 ),
//               )
//           ),
//         );
//       }
//
//   ),
//
// ),

// FutureBuilder(
//   builder: (context, snapshot) {
//     if (snapshot != null){
//       ManagerRequestLeave _weather = snapshot.data as ManagerRequestLeave ;
//       if (_weather == null){
//         return Center(child: CircularProgressIndicator(),);
//       }
//       else{
//         return weatherBox(context, _weather);
//       }}
//     else{
//       return CircularProgressIndicator();
//     }
//   },
//
//   future: getLeaveReqList(),
// ),