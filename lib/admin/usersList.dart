import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:jbs_app/admin/profile_update.dart';
import 'package:jbs_app/models/employee_attendance_list_model.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../api/access.dart';
import '../models/admin_users_list_model.dart';
import '../storage.dart';
import 'package:http/http.dart'  as http;

import 'admin2.dart';

class UsersLists extends StatefulWidget {
  const UsersLists({Key? key}) : super(key: key);

  @override
  State<UsersLists> createState() => _UsersListsState();
}

class _UsersListsState extends State<UsersLists> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = true;
  UserListApi? usersList;
  UserListAttendanceApi? attendanceList;

  @override
  void initState(){
    super.initState();
    loading = false;

    access().usersList().then((value) {
      print("value: $value");
      setState(() {
        usersList = UserListApi.fromJson(value);
      });
      loading = false;
    });

    access().getAttendanceinAdmin().then((value) {
      print("value: $value");
      setState(() {
        attendanceList = UserListAttendanceApi.fromJson(value);
      });
      loading = false;
    });

  }

  SharedPreferencesInit() async {
    await Storage.init();
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.only(left:3.0),
                    child: GestureDetector(
                      onTap: (){
                        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>
                        //     Admin2(location: Storage.get_location().toString(),
                        //       empID: Storage.get_adminEmpID().toString(),
                        //       name: Storage.get_name().toString(),)), (route) => false);
                        Get.back();
                        // Get.off(Admin2(location: Storage.get_location().toString(),
                        //       empID: Storage.get_adminEmpID().toString(),
                        //       name: Storage.get_name().toString(),));
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
            title: const Text(
              'Users',
              style: TextStyle(color: Color(0xff005993)),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: loading?
          Center(child: CircularProgressIndicator(),):
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    usersList==null?
                    Center(child: Text("No employees present"),): usersList!.employee.length==0?
                    Center(child: Text("No employees Below Admin post in this organization")):

                    Expanded(
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: usersList!.employee.length,
                          itemBuilder: (context, index){
                            return Container(
                              child: Column(
                                children: [
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image(
                                              image: AssetImage('lib/images/face3.png'),
                                              height: MediaQuery.of(context).size.width*0.16,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(usersList!.employee[index].name.toString(), style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: MediaQuery.of(context).size.width*0.0375,
                                                    backgroundColor: Colors.grey.shade300
                                                ),),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("${usersList!.employee[index].phoneNumber.toString()}", style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width*0.0375,
                                                    backgroundColor: Colors.grey.shade300
                                                ),),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("${usersList!.employee[index].email.toString()}", style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width*0.0375,
                                                    backgroundColor: Colors.grey.shade300
                                                ),),

                                              ],
                                            ),
                                          ],
                                        ),

                                        TextButton(
                                            onPressed: () {
                                              access().getAttendanceinAdmin().then((value) {
                                                print("value: $value");
                                                setState(() {
                                                  attendanceList = UserListAttendanceApi.fromJson(value);
                                                });
                                                loading = false;
                                              });

                                              final empId = usersList!.employee[index].employeeId.toString();
                                              Storage.set_empID(empId.toString());
                                              print(Storage.get_empID());
                                              showMaterialModalBottomSheet(
                                                expand: false,
                                                context: context,
                                                backgroundColor: Colors.transparent,
                                                builder: (context) => Container(
                                                  padding: EdgeInsets.all(10),
                                                  height: MediaQuery.of(context).size.height*0.5,
                                                  width: MediaQuery.of(context).size.width,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.only(
                                                          topRight: Radius.circular(40),
                                                          topLeft: Radius.circular(40))),
                                                  child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 50,
                                                              child: Image(
                                                                image: AssetImage('lib/images/face.png'),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  usersList!.employee[index].name,
                                                                  style:
                                                                  TextStyle(color: Color(0xff005993),
                                                                      fontSize: MediaQuery.of(context).size.width*0.0375),
                                                                ),
                                                                SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Text(
                                                                  usersList!.employee[index].phoneNumber.toString(),
                                                                  style:
                                                                  TextStyle(color: Color(0xff005993),
                                                                      fontSize: MediaQuery.of(context).size.width*0.0375 ),
                                                                ),
                                                                SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Text(usersList!.employee[index].email.toString(),
                                                                    style: TextStyle(
                                                                      color: Color(0xff005993),
                                                                      fontSize: MediaQuery.of(context).size.width*0.0375, )),
                                                                SizedBox(
                                                                  height: 8,
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(height: 20),

                                                        attendanceList == null?
                                                            Center(child: Text("No records"),):
                                                        // attendanceList!.present.length==0 ?
                                                        // Center(child: Text("no records found")):

                                                        Container(
                                                          decoration: BoxDecoration(
                                                            border: Border.all(color: Color(0xffECECEC)),
                                                            borderRadius: BorderRadius.circular(20),
                                                            color: Colors.white,
                                                          ),
                                                          height: MediaQuery.of(context).size.height *0.1,
                                                          width:  MediaQuery.of(context).size.width *0.8,

                                                          child: Column(
                                                            children: [
                                                              Text("Present no of days: ${attendanceList!.present[0].COUNT.toString()}"),
                                                              SizedBox(height: 20,),
                                                              Text("Absent no of days: ${attendanceList!.present[0].COUNT.toString()}"),
                                                            ],
                                                          ),

                                                        ),





                                                        SizedBox(height: 20,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {
                                                                print(usersList!.employee[index].employeeId);
                                                               // Navigator.pushReplacement(context,
                                                               //     MaterialPageRoute(builder: (context)=>
                                                               //         updateProfileAdmin(id: usersList!.employee[index].employeeId)));
                                                                Get.off(updateProfileAdmin(id: usersList!.employee[index].employeeId));
                                                              },
                                                              child: Text('Edit',
                                                                  style: TextStyle(color: Colors.white,
                                                                  fontSize: MediaQuery.of(context).size.width*0.0375)),
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                  MaterialStateProperty.all(
                                                                      Color(0xff005993))),
                                                            ),
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                print("locId: ${Storage.get_locationID().toString()}");
                                                                print("empId: ${Storage.get_empID().toString()}");
                                                                access().disableEmployee(Storage.get_locationID().toString(),
                                                                    Storage.get_empID().toString()).then((value){
                                                                  if(value["success"]){
                                                                    setState((){
                                                                      usersList!.employee.removeAt(index);
                                                                    });
                                                                    Fluttertoast.showToast(
                                                                        msg: "${"Disabled employee with id: ${Storage.get_empID().toString()}"}",
                                                                        toastLength: Toast.LENGTH_SHORT,
                                                                        gravity: ToastGravity.BOTTOM,
                                                                        timeInSecForIosWeb: 1,
                                                                        backgroundColor: Colors.green.shade400,
                                                                        textColor: Colors.white,
                                                                        fontSize: 16.0);
                                                                    setState(() {
                                                                      Get.back();
                                                                    });

                                                                  } else{
                                                                    Fluttertoast.showToast(
                                                                        msg: "Error disabling employee with id: ${Storage.get_empID().toString()}",
                                                                        toastLength: Toast.LENGTH_SHORT,
                                                                        gravity: ToastGravity.BOTTOM,
                                                                        timeInSecForIosWeb: 1,
                                                                        backgroundColor: Colors.red.shade400,
                                                                        textColor: Colors.white,
                                                                        fontSize: 16.0);
                                                                  }

                                                                });

                                                              },
                                                              child: Text('Disable',
                                                                  style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width*0.0375),),
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                  MaterialStateProperty.all(
                                                                      Color(0xff005993))),
                                                            )
                                                          ],
                                                        )
                                                      ]),
                                                ),
                                              );
                                            },
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color(0xff525252),
                                              size: MediaQuery.of(context).size.width*0.05,
                                            ))
                                      ]),

                                ],
                              ),
                            );
                          }
                      )
                    ),


                  ],
                ),
              ),
            ),
          ),
        ));
  }


}
Future getEmployeeList() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};

  var url = Uri.parse('https://stg.visitormanager.net/v1/listEmployee?locationId=${Storage.get_locationID()}', );

  final response = await http.get(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return UserListApi.fromJson(jsonDecode(response.body));
  } else {
    print("Failed to fetch data");
  }

}

Future getEmployeeAttendanceList() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};


  var url = Uri.parse('https://stg.visitormanager.net/v1/attendance/show?EmployeeId=00${Storage.get_empID()}&startDate=1-6-2022&endDate=30-6-2022&location_Id=${Storage.get_locationID()}', );

  final response = await http.get(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return UserListAttendanceApi.fromJson(jsonDecode(response.body));
  } else {
    print("Failed to fetch data");
  }

}