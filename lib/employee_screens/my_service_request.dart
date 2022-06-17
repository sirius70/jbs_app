import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'  as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbs_app/api/access.dart';
import 'package:jbs_app/employee_screens/profile_page_3.dart';
import 'package:jbs_app/employee_screens/request_success.dart';
import 'package:jbs_app/employee_screens/scan_qr.dart';

import '../models/emp_get_admins_model.dart';
import '../models/emp_sendServiceReq_model.dart';
import '../storage.dart';
import 'employee_welcome_1.dart';
import 'guest_register_2.dart';
import 'my_attendance.dart';

class serviceRequest extends StatefulWidget {
  const serviceRequest({Key? key}) : super(key: key);

  @override
  State<serviceRequest> createState() => _serviceRequestState();
}
class _serviceRequestState extends State<serviceRequest> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController issueController = TextEditingController();

  Set<String> items = {};
  String? selectedValue;
  String? selectedValue2;
  List categoryItemList = [];
  List issueList = ['Very high', 'High', 'Low'];
  var issues;
  final bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getAdmins();
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
                          Text("Service \nRequest",
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
                                            height: 38,
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
                                          child:Container(
                                            height: 38,
                                            width: 200,
                                            child: InputDecorator(
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
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey,),
                                                    value: selectedValue,
                                                    items: categoryItemList.map((category){
                                                      return DropdownMenuItem(
                                                          value: category["employee_Id"].toString(),
                                                          child: Row(
                                                            children: [
                                                              Text(category["name"]),
                                                             // Text(category["employee_Id"].toString())
                                                            ],
                                                          )
                                                      );
                                                    }).toList(),
                                                    onChanged: (value){
                                                      setState((){
                                                        selectedValue = value as String?;
                                                        print(selectedValue);

                                                        Storage.set_reguAdminId(selectedValue.toString());
                                                        print(Storage.get_reguAdminId());

                                                      });
                                                    }
                                                ),
                                              ),
                                            ),
                                          )
                                        ),
                                      ],
                                    ),


                                    SizedBox(height: 18,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Issue Section"),
                                        Flexible(
                                            child:Container(
                                              height: 38,
                                              width: 200,
                                              child: InputDecorator(
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
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                      icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey,),
                                                      value: selectedValue2,
                                                      items: issueList.map((issue){
                                                        return DropdownMenuItem(
                                                            value: issue.toString(),
                                                            child: Row(
                                                              children: [
                                                                Text(issue, style: TextStyle(
                                                                  fontSize: 15
                                                                ),),
                                                                // Text(category["employee_Id"].toString())
                                                              ],
                                                            )
                                                        );
                                                      }).toList(),
                                                      onChanged: (value){
                                                        setState((){
                                                          selectedValue2 = value as String?;
                                                          print(selectedValue2);

                                                        });
                                                      }
                                                  ),
                                                ),
                                              ),
                                            )
                                        ),
                                      ],
                                    ),

                                    ]),


                                SizedBox(height: 50,),

                                Padding(
                                  padding: const EdgeInsets.only(top: 10, left: 10),
                                  child: Text("Describe the issue you're facing",
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
                                      controller: issueController,
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

                                     if(issueController.text.isNotEmpty){
                                       access().empSerReq(selectedValue.toString(),
                                           selectedValue2 == "Very high"? 3 :
                                           selectedValue2 == "High"? 2 : 1,
                                           issueController.text).then((value){
                                             if(value["success"]) {
                                               SendServiceReq sendReq = SendServiceReq.fromJson(value);
                                               setState((){
                                                 Fluttertoast.showToast(
                                                     msg: "${sendReq.message}",
                                                     toastLength: Toast.LENGTH_SHORT,
                                                     gravity: ToastGravity.BOTTOM,
                                                     timeInSecForIosWeb: 1,
                                                     backgroundColor: Colors.green.shade300,
                                                     textColor: Colors.white,
                                                     fontSize: 16.0);
                                                 Navigator.push(context,
                                                     MaterialPageRoute(builder: (context)=>requestSuccess1()));
                                               });
                                             } else{
                                               Fluttertoast.showToast(
                                                   msg: "${"Request could'nt be made. Please try after sometime"}",
                                                   toastLength: Toast.LENGTH_SHORT,
                                                   gravity: ToastGravity.BOTTOM,
                                                   timeInSecForIosWeb: 1,
                                                   backgroundColor: Colors.red.shade300,
                                                   textColor: Colors.white,
                                                   fontSize: 16.0);
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

  Future getAdmins() async {

    var headers = {'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Storage.get_accessToken()}'};

    var url = Uri.parse('https://stg.visitormanager.net/v1/get/admin/location?location_Id=0000${Storage.get_locationID()}');

    final response = await http.get(url, headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("jsonData:${jsonData["data"]}");
      categoryItemList = jsonData["data"];
      // setState((){
      //   categoryItemList = jsonData;
      // });
      print("categoryList: ${categoryItemList}");
      //return GetAdmins.fromJson(jsonDecode(response.body));
    } else {
      print("Failed to fetch data");
    }

  }
}

