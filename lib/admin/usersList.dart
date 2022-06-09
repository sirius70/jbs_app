import 'package:flutter/material.dart';
import 'package:jbs_app/models/employee_attendance_list_model.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../api/access.dart';
import '../models/admin_users_list_model.dart';
import '../storage.dart';
import 'package:http/http.dart'  as http;

class UsersLists extends StatefulWidget {
  const UsersLists({Key? key}) : super(key: key);

  @override
  State<UsersLists> createState() => _UsersListsState();
}

class _UsersListsState extends State<UsersLists> {

  @override
  void initState(){
    super.initState();
access().usersList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.arrow_back_ios, size: 15,
                              color: Colors.black),
                          Text(
                            'back',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),

                      SizedBox(width: MediaQuery.of(context).size.width*0.3,),

                      Text("Users",
                          style: TextStyle(
                            fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ],
                  ),

                  SizedBox(height: 20,),

                  Expanded(
                    child: FutureBuilder(
                      builder: (context, snapshot) {
                        if (snapshot != null){
                          UserListApi _weather = snapshot.data as UserListApi ;
                          if (_weather == null){
                            return Center(child: CircularProgressIndicator(),);
                          }
                          else{
                            return weatherBox(context, _weather);
                          }}
                        else{
                          return CircularProgressIndicator();
                        }
                      },

                      future: getEmployeeList(),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ));
  }

  Widget attendanceBox(BuildContext context, UserListAttendanceApi attendanceListss){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffECECEC)),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height *0.1,
      width:  MediaQuery.of(context).size.width *0.8,

      child: Column(
        children: [
          Text("Present no of days: ${attendanceListss.present[0].countMarked.toString()}"),
          SizedBox(height: 20,),
          Text("Absent no of days: ${attendanceListss.present[0].countMarked.toString()}"),
        ],
      ),

    );
  }

  Widget weatherBox(BuildContext context, UserListApi empListss){
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20,
              );
            },
          itemCount: empListss.employee.length,
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
                            height: 60,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(empListss.employee[index].name.toString(), style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  backgroundColor: Colors.grey.shade300
                              ),),
                              SizedBox(
                                height: 5,
                              ),
                              Text("${empListss.employee[index].phoneNumber.toString()}", style: TextStyle(
                                  fontSize: 15,
                                  backgroundColor: Colors.grey.shade300
                              ),),
                              SizedBox(
                                height: 5,
                              ),
                              Text("${empListss.employee[index].email.toString()}", style: TextStyle(
                                  fontSize: 15,
                                  backgroundColor: Colors.grey.shade300
                              ),),

                            ],
                          ),
                        ],
                      ),

                      TextButton(
                          onPressed: () {
                            final empId = empListss.employee[index].employeeId.toString();
                            Storage.set_empID(empId.toString());
                            print(Storage.get_empID());
                            showMaterialModalBottomSheet(
                              expand: false,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Container(
                                padding: EdgeInsets.all(10),
                                height: 300,
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
                                              Container(
                                                height: 15,
                                                width: 70,
                                                child: Text(
                                                  empListss.employee[index].name[0].toUpperCase()
                                                      + empListss.employee[index].name.substring(1).toLowerCase().toString(),
                                                  style:
                                                  TextStyle(color: Color(0xff005993), fontSize: 15),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                height: 15,
                                                width: 120,
                                                child: Text(
                                                  empListss.employee[index].phoneNumber.toString(),
                                                  style:
                                                  TextStyle(color: Color(0xff005993), fontSize: 15 ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                height: 15,
                                                width: 150,
                                                child: Text(empListss.employee[index].email.toString(),
                                                    style: TextStyle(
                                                        color: Color(0xff005993), fontSize: 15, )),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20),



                                      //widget here
                                      Expanded(
                                        child: FutureBuilder(
                                          builder: (context, snapshot) {
                                            if (snapshot != null){
                                              UserListAttendanceApi attendance = snapshot.data as UserListAttendanceApi ;
                                              if (attendance == null){
                                                return Center(child: CircularProgressIndicator(),);
                                              }
                                              else{
                                                return attendanceBox(context, attendance);
                                              }}
                                            else{
                                              return CircularProgressIndicator();
                                            }
                                          },

                                          future: getEmployeeAttendanceList(),
                                        ),
                                      ),





                                      SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                            onPressed: () {

                                            },
                                            child: Text('Delete',
                                                style: TextStyle(color: Colors.white)),
                                            style: ButtonStyle(
                                                backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xff005993))),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                            },
                                            child: Text('Disable',
                                                style: TextStyle(color: Colors.white)),
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
                            size: 20,
                          ))
                    ]),

                  ],
                ),
              );
            }
        )
    );
  }

}
Future getEmployeeList() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};

  var url = Uri.parse('https://stg.visitormanager.net/v1/listEmployee?pageNo=2&locationId=${Storage.get_locationID()}', );

  final response = await http.get(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return userListApiFromJson(response.body);
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
    return userListAttendanceApiFromJson(response.body);
  } else {
    print("Failed to fetch data");
  }

}