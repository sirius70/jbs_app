import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jbs_app/api/access.dart';
import 'package:jbs_app/employee_screens/request_success.dart';
import 'package:jbs_app/models/empAttendance_summary_model.dart';

import '../../models/emp_leave_applica_model.dart';
import '../employee_welcome_1.dart';
import '../guest_register_2.dart';
import '../my_attendance.dart';
import '../profile_page_3.dart';
import '../scan_qr.dart';

class leaveApplication extends StatefulWidget {
  const leaveApplication({Key? key}) : super(key: key);

  @override
  State<leaveApplication> createState() => _leaveApplicationState();
}
enum SingingCharacter { Morning, Afternoon }
class _leaveApplicationState extends State<leaveApplication> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  SingingCharacter? _character = SingingCharacter.Morning;

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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Leave \nApplication",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff005993)
                            ),),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Name"),
                                        Flexible(
                                          child: Container(
                                            height: 35,
                                            width: 200,
                                            child: TextField(
                                              cursorColor: Color(0xff031627),
                                              decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(10.0),
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
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 18,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Department"),
                                        Flexible(
                                          child: Container(
                                            height: 35,
                                            width: 200,
                                            child: TextField(
                                              cursorColor: Color(0xff031627),
                                              decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(10.0),
                                                suffixIcon: Container(
                                                  //margin: EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                        left: BorderSide(color: Colors.grey),
                                                      )
                                                  ),
                                                  child: IconButton(
                                                      onPressed: (){},
                                                      icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey,)),
                                                ),
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
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),


                                    SizedBox(height: 18,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Date"),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.19,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
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
                                            Icon(Icons.calendar_today, size: 15,),
                                          ],
                                        ),
                                      ],
                                    ),


                                    // Container(
                                    //     alignment: Alignment.centerLeft,
                                    //     child: Text("Time")),
                                    //
                                    // SizedBox(height: 20),
                                    //
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Column(
                                    //       crossAxisAlignment: CrossAxisAlignment.start,
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
                                    //                 Text("09 SEPT 22", style: TextStyle(
                                    //                     fontSize: 22,
                                    //                     fontWeight: FontWeight.bold
                                    //                 ),),
                                    //
                                    //                 SizedBox(height: 3,),
                                    //               ],
                                    //             ),
                                    //
                                    //           ],
                                    //         ),
                                    //         SizedBox(height: 10),
                                    //
                                    //         Row(
                                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //           children: [
                                    //             Row(
                                    //               children: [
                                    //                 Container(
                                    //                   height:12,
                                    //                   width: 15,
                                    //                   decoration: BoxDecoration(
                                    //                     border: Border.all(color: Color(0xff00A3FF), width: 1),
                                    //                     shape: BoxShape.circle,
                                    //                     boxShadow: [new BoxShadow(
                                    //                       color: Color(0xff00A3FF).withOpacity(0.4),
                                    //                       blurRadius: 5.0,
                                    //                     ),]
                                    //         ),
                                    //
                                    //                 ),
                                    //
                                    //                 Text("Morning", style: TextStyle(
                                    //                   color:Color(0xff00A3FF),
                                    //                     fontSize: 12
                                    //                 ),),
                                    //               ],
                                    //             ),
                                    //             SizedBox(width: 5),
                                    //
                                    //             Row(
                                    //               children: [
                                    //                 Container(
                                    //                   height:12,
                                    //                   width: 15,
                                    //                   decoration: BoxDecoration(
                                    //                       border: Border.all(color: Colors.grey),
                                    //                       shape: BoxShape.circle,
                                    //
                                    //                   ),
                                    //
                                    //                 ),
                                    //
                                    //                 Text("Afternoon", style: TextStyle(
                                    //                   fontSize: 12
                                    //                 ),),
                                    //               ],
                                    //             ),
                                    //           ],
                                    //         ),
                                    //         // Row(
                                    //         //   mainAxisAlignment: MainAxisAlignment.start,
                                    //         //   //crossAxisAlignment: CrossAxisAlignment.start,
                                    //         //   children: [
                                    //         //     Radio(
                                    //         //         value: SingingCharacter.Morning,
                                    //         //         groupValue: _character,
                                    //         //         onChanged: (value) {
                                    //         //           setState(() {
                                    //         //             _character = value as SingingCharacter?;
                                    //         //           });
                                    //         //         },),
                                    //         //     Text('Morning'),
                                    //         //
                                    //         //     Radio(
                                    //         //       value: SingingCharacter.Afternoon,
                                    //         //       groupValue: _character,
                                    //         //       onChanged: (value) {
                                    //         //       setState(() {
                                    //         //         _character = value as SingingCharacter?;
                                    //         //       });
                                    //         //     },),
                                    //         //     Text('Afternoon')
                                    //         //   ],
                                    //         // ),
                                    //
                                    //
                                    //       ],
                                    //     ),
                                    //
                                    //     Text("to", style: TextStyle(
                                    //         color: Color(0xff2980B9),
                                    //         fontSize: 18
                                    //     ),),
                                    //
                                    //     Column(
                                    //       crossAxisAlignment: CrossAxisAlignment.start,
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
                                    //                 Text("09 SEPT 22", style: TextStyle(
                                    //                     fontSize: 22,
                                    //                     fontWeight: FontWeight.bold
                                    //                 ),),
                                    //
                                    //                 SizedBox(height: 3,),
                                    //               ],
                                    //             ),
                                    //
                                    //           ],
                                    //         ),
                                    //         SizedBox(height: 10),
                                    //
                                    //         Row(
                                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //           children: [
                                    //
                                    //
                                    //             Row(
                                    //               children: [
                                    //                 Container(
                                    //                   height:12,
                                    //                   width: 15,
                                    //                   decoration: BoxDecoration(
                                    //                     border: Border.all(color: Colors.grey),
                                    //                     shape: BoxShape.circle,
                                    //
                                    //                   ),
                                    //
                                    //                 ),
                                    //
                                    //                 Text("Morning", style: TextStyle(
                                    //                     fontSize: 12
                                    //                 ),),
                                    //               ],
                                    //             ),
                                    //
                                    //             SizedBox(width: 5),
                                    //
                                    //             Row(
                                    //               children: [
                                    //                 Container(
                                    //                   height:12,
                                    //                   width: 15,
                                    //                   decoration: BoxDecoration(
                                    //                       border: Border.all(color: Color(0xff00A3FF), width: 1),
                                    //                       shape: BoxShape.circle,
                                    //                       boxShadow: [new BoxShadow(
                                    //                         color: Color(0xff00A3FF).withOpacity(0.4),
                                    //                         blurRadius: 5.0,
                                    //                       ),]
                                    //                   ),
                                    //
                                    //                 ),
                                    //
                                    //                 Text("Afternoon", style: TextStyle(
                                    //                     color:Color(0xff00A3FF),
                                    //                     fontSize: 12
                                    //                 ),),
                                    //               ],
                                    //             ),
                                    //
                                    //           ],
                                    //         ),
                                    //       ],
                                    //     ),
                                    //
                                    //   ],
                                    // ),

                                  ],
                                ),


                                SizedBox(height: 50,),

                                Padding(
                                  padding: const EdgeInsets.only(top: 10, left: 10),
                                  child: Text("State valid reason",
                                    style: TextStyle(
                                        fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: TextFormField(
                                      controller: reasonController,
                                      textInputAction: TextInputAction.newline,
                                      keyboardType: TextInputType.multiline,
                                      minLines: null,
                                      maxLines: 8,
                                      cursorColor: Color(0xff031627),
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(10.0),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        focusColor: Color(0xff031627),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 30,),
                                Container(
                                  height: MediaQuery.of(context).size.width*0.14,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: (){
                                      if (dateinput.text.isNotEmpty && reasonController.text.isNotEmpty){
                                        access().empAttendanceLeave(dateinput.text, reasonController.text).then((value) async{
                                         EmpAttendanceLeave empAttLeave = await EmpAttendanceLeave.fromJson(value);
                                         print(empAttLeave.data);
                                          print("sucees: ${value}");
                                          if (value["success"]){
                                            EmpAttendanceLeave empAttLeave = EmpAttendanceLeave.fromJson(value);
                                            print(empAttLeave.data.reqId);
                                            setState(() {

                                          Navigator.push(context,MaterialPageRoute(builder: (context)=>requestSuccess()));
                                            });
                                            dateinput.clear();
                                            reasonController.clear();
                                          }else{
                                            Fluttertoast.showToast(
                                                msg: "${"Error submitting leave application. Try after sometime"}",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red.shade300,
                                                textColor: Colors.white,
                                                fontSize: 16.0);

                                            dateinput.clear();
                                            reasonController.clear();
                                          }
                                        });

                                      } else{
                                        Fluttertoast.showToast(
                                            msg: "${"Fields cannot be empty"}",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.grey,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }

                                    },
                                    child: Text("Submit Application"),
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
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),


                  ],
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}

