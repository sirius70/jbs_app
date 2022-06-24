import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jbs_app/api/access.dart';
import 'package:jbs_app/employee_screens/profile_page_3.dart';
import 'package:jbs_app/employee_screens/request_success.dart';
import 'package:jbs_app/employee_screens/scan_qr.dart';

import '../storage.dart';
import 'employee_welcome_1.dart';
import 'guest_register_2.dart';
import 'my_attendance.dart';
import 'widgets/attendance_calendar.dart';

class regularizationRequest extends StatefulWidget {
   regularizationRequest({Key? key,}) : super(key: key);

  @override
  State<regularizationRequest> createState() => _regularizationRequestState();
}

class _regularizationRequestState extends State<regularizationRequest> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  
  TextEditingController _time1 = TextEditingController();
  TextEditingController _time2 = TextEditingController();

  bool isChecked = false;

  int? _selectedValueIndex;
  List<String> buttonText = ["AM", "PM"];


  String default_choice = "Time";
  int default_index = 0;

  List<MyChoice> choices = [
    MyChoice(index:0, choice:"Time", ),
    MyChoice(index:1, choice:"Attendance",),
  ];


  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
    _time1.text = "6";
    _time2.text = "30";
    _selectedValueIndex = 0;

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
                      padding: EdgeInsets.all(15),
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
                          Text("Regularisation \nRequest",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff005993)
                            ),),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 20),
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
                                    SizedBox(height: 18,),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text("Regularize for"),
                                          ],
                                        ),

                                        Column(
                                          children: [
                                            Container(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: choices.map((data) =>
                                                SizedBox(
                                                  width:160,
                                                  child:  RadioListTile(
                                                      title: Text("${data.choice}", style: TextStyle(
                                                        fontSize: 15,
                                                      ),),
                                                      activeColor: Colors.blue,
                                                      contentPadding: EdgeInsets.all(0),
                                                      value: data.index,
                                                      groupValue: default_index,
                                                      onChanged: (value){
                                                        setState((){
                                                          default_choice = data.choice;
                                                          default_index = data.index;

                                                        });
                                                      },
                                                    toggleable: true,
                                                  ),
                                                )
                                                ).toList(),
                                              ),
                                            ),

                                             (default_choice == "Time") ?

                                             Column(
                                               children: [
                                                 SizedBox(height:20),
                                                 Text("Choose the time to regularize"),
                                                 SizedBox(height: 10),
                                                 Container(
                                                     decoration: BoxDecoration(
                                                         borderRadius: BorderRadius.circular(10),
                                                         border: Border.all(color: Color(0xffF3F3F3))
                                                     ),
                                                     height:MediaQuery.of(context).size.height * 0.2,
                                                     child: Scrollbar(
                                                       scrollbarOrientation: ScrollbarOrientation.left,
                                                       radius: Radius.circular(10),
                                                       controller: _scrollController,
                                                       child: ListView.separated(
                                                         controller: _scrollController,
                                                         separatorBuilder: (BuildContext context, int index){
                                                           return Divider();
                                                         },
                                                         itemCount: 10,
                                                         itemBuilder: (BuildContext context, int index){
                                                           return ListTile(
                                                             onTap: (){
                                                               print(index);
                                                             },
                                                             contentPadding: EdgeInsets.only(left: 20, top: 0, bottom: 0),
                                                             selectedTileColor: Colors.blue,
                                                             trailing: IconButton(
                                                               icon: Icon(Icons.arrow_forward_ios),
                                                               iconSize: 15,
                                                               onPressed: (){
                                                                 print(index);
                                                               },
                                                             ),
                                                             title : Text('Item $index', style: TextStyle(
                                                                 fontSize: 15
                                                             ),),

                                                           );
                                                         },
                                                       ),
                                                     )
                                                 ),




                                                 SizedBox(height:30),


                                                 Text("change 08:59 AM"),
                                                 SizedBox(height: 10,),
                                                 Text("to", style: TextStyle(
                                                     fontWeight: FontWeight.bold, fontSize: 15
                                                 ),),
                                                 SizedBox(height:10),



                                                 Column(
                                                   children: [

                                                     Row(
                                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                       children: [
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
                                                                 // Container(
                                                                 //   height:40,
                                                                 //   width: 50,
                                                                 //   child: TextFormField(
                                                                 //     keyboardType: TextInputType.numberWithOptions(
                                                                 //       decimal: false,
                                                                 //       signed: true,
                                                                 //     ),
                                                                 //
                                                                 //     textAlign: TextAlign.center,
                                                                 //     decoration: InputDecoration(
                                                                 //       contentPadding: EdgeInsets.all(4.0),
                                                                 //       enabledBorder: OutlineInputBorder(
                                                                 //         borderSide: BorderSide(color: Colors.white),
                                                                 //       ),
                                                                 //       focusedBorder: OutlineInputBorder(
                                                                 //         borderSide: BorderSide(color: Colors.white),
                                                                 //       ),
                                                                 //       focusColor: Color(0xff031627),
                                                                 //       border: OutlineInputBorder(
                                                                 //         borderRadius: BorderRadius.circular(10.0),
                                                                 //         borderSide: BorderSide(color: Colors.white),
                                                                 //       ),
                                                                 //     ),
                                                                 //     controller: _time1,
                                                                 //     style: TextStyle(
                                                                 //       fontSize: 16
                                                                 //   ),),
                                                                 // ),

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
                                                                 // Container(
                                                                 //   height:40,
                                                                 //   width: 50,
                                                                 //   child: TextFormField(
                                                                 //     keyboardType: TextInputType.numberWithOptions(
                                                                 //       decimal: false,
                                                                 //       signed: true,
                                                                 //     ),
                                                                 //
                                                                 //     textAlign: TextAlign.center,
                                                                 //     decoration: InputDecoration(
                                                                 //       contentPadding: EdgeInsets.all(4.0),
                                                                 //       enabledBorder: OutlineInputBorder(
                                                                 //         borderSide: BorderSide(color: Colors.white),
                                                                 //       ),
                                                                 //       focusedBorder: OutlineInputBorder(
                                                                 //         borderSide: BorderSide(color: Colors.white),
                                                                 //       ),
                                                                 //       focusColor: Color(0xff031627),
                                                                 //       border: OutlineInputBorder(
                                                                 //         borderRadius: BorderRadius.circular(10.0),
                                                                 //         borderSide: BorderSide(color: Colors.white),
                                                                 //       ),
                                                                 //     ),
                                                                 //     controller: _time1,
                                                                 //     style: TextStyle(
                                                                 //       fontSize: 16
                                                                 //   ),),
                                                                 // ),

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
                                                     )
                                                   ],
                                                 ),

                                                 SizedBox(height:20),
                                                 GestureDetector(
                                                   onTap:(){},
                                                   child: Text("Click to confirm "
                                                       "change", style: TextStyle(
                                                     color: Color(0xff00A3FF),
                                                     decoration: TextDecoration.underline,
                                                   ),),
                                                 ),

                                               ],
                                             ):

                                             Column(
                                              children: [
                                                SizedBox(height:20),
                                                Text("${Storage.get_attendanceMark() == "0"?
                                                "You had been marked absent" : 
                                                    "You had been marked present"
                                                }"),
                                                SizedBox(height:10),
                                                GestureDetector(
                                                  onTap:(){},
                                                  child: Text("Click to confirm "
                                                      "change to 'Present'", style: TextStyle(
                                                    color: Color(0xff00A3FF),
                                                    decoration: TextDecoration.underline,
                                                  ),),
                                                ),

                                                SizedBox(height:10),
                                                Image.asset("assets/images/check.jpg")
                                              ],
                                            )

                                          ],
                                        )
                                        // Row(
                                        //   children: [
                                        //
                                        //   ],
                                        // )
                                      ],
                                    )



                                  ],
                                ),


                                SizedBox(height: 50,),

                                Padding(
                                  padding: const EdgeInsets.only(top: 10, left: 10),
                                  child: Text("State your explanation",
                                  style: TextStyle(
                                    fontSize: 15
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
                                  // decoration: BoxDecoration(
                                  //   color: Color(0xffFF0000)
                                  // ),
                                  height: MediaQuery.of(context).size.width*0.14,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: (){
                                      var df =  DateFormat("h:mma");
                                      var dt = df.parse("${_time1.text}:${_time2.text}${_selectedValueIndex==0?"AM":"PM"}");
                                      print(DateFormat('H:m:s').format(dt));
                                      print(default_choice);
                                      print(Storage.get_attendanceId());
                                      print(reasonController.text);
                                     if(reasonController.text.isNotEmpty){
                                       if(default_choice=="Attendance") {
                                         access().empRegularizationAttend(
                                             Storage.get_attendanceId().toString(), reasonController.text)
                                             .then((value){
                                           if(value["success"]){
                                             setState((){
                                               Navigator.push(context,MaterialPageRoute(builder: (context)=>requestSuccess()));
                                               reasonController.clear();
                                             });
                                           } else{
                                             Fluttertoast.showToast(
                                                 msg: "${"Error submitting request. Try after sometime"}",
                                                 toastLength: Toast.LENGTH_SHORT,
                                                 gravity: ToastGravity.BOTTOM,
                                                 timeInSecForIosWeb: 1,
                                                 backgroundColor: Colors.red.shade300,
                                                 textColor: Colors.white,
                                                 fontSize: 16.0);
                                             setState((){
                                               reasonController.clear();
                                             });
                                           }
                                         });
                                       }

                                       if(default_choice == "Time") {
                                         access().empRegularizationTime(
                                             Storage.get_attendanceId().toString(),
                                             "${DateFormat('H:m:s').format(dt)}",
                                             reasonController.text).then((value){
                                               print(value);
                                           if(value["success"]){
                                             setState((){
                                               reasonController.clear();
                                               Navigator.push(context,MaterialPageRoute(builder: (context)=>requestSuccess()));
                                             });
                                           } else{
                                             Fluttertoast.showToast(
                                                 msg: "${"Error submitting request. Try after sometime"}",
                                                 toastLength: Toast.LENGTH_SHORT,
                                                 gravity: ToastGravity.BOTTOM,
                                                 timeInSecForIosWeb: 1,
                                                 backgroundColor: Colors.red.shade300,
                                                 textColor: Colors.white,
                                                 fontSize: 16.0);
                                             setState((){
                                               reasonController.clear();
                                             });
                                           }
                                         });
                                       }
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
                                    child: Text("Submit Request"),
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

  Widget button({required String text, required int index}) {
    return InkWell(
      splashColor: Colors.cyanAccent,
      onTap: () {
        setState(() {
          _selectedValueIndex = index;
          print(_selectedValueIndex);
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

class MyChoice{
  String choice;
  int index;
  MyChoice({required this.choice, required this.index});
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}