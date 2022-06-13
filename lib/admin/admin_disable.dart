import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jbs_app/api/access.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:http/http.dart'  as http;

import '../models/disabled_employees_model.dart';
import '../storage.dart';

class Disabled_users extends StatefulWidget {
  const Disabled_users({Key? key}) : super(key: key);

  @override
  State<Disabled_users> createState() => _Disabled_usersState();
}

class _Disabled_usersState extends State<Disabled_users> {
  @override
  Widget build(BuildContext context) {
    bool _myBool = false;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Row(
            children: [
              Icon(Icons.arrow_left_sharp, color: Colors.black),
              Text(
                'back',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          title: Text(
            'Disabled Users',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          flexibleSpace: Center(
            child: Row(
              children: [
                SizedBox(
                  width: 260,
                ),
                TextButton(
                    onPressed: () => setState(() => _myBool = !_myBool),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: Checkbox(
                                  value: _myBool,
                                  onChanged: (value) {
                                    setState(() => _myBool = value!);
                                  })),
                          SizedBox(width: 5.0),
                          Text(
                            "Select all",
                            style: TextStyle(color: Colors.lightBlue),
                          )
                        ])),
              ],
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot != null){
                DisabledEmployeesList _disabledEmp = snapshot.data as DisabledEmployeesList ;
                if (_disabledEmp == null){
                  return Center(child: Text("No disabled users found"),);
                }
                else{
                  return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: _disabledEmp.employees!.length,
                        itemBuilder: (context, index){
                          return Column(
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
                                        SizedBox(width: 10,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(_disabledEmp.employees![index].name.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  backgroundColor: Colors.grey.shade300
                                              ),),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(_disabledEmp.employees![index].phoneNumber.toString(),
                                              style: TextStyle(
                                                  backgroundColor: Colors.grey.shade300
                                              ),),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(_disabledEmp.employees![index].email.toString(),
                                              style: TextStyle(
                                                  backgroundColor: Colors.grey.shade300
                                              ),),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          getDisabledEmployeesList();
                                          showMaterialModalBottomSheet(
                                            expand: false,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) => Container(
                                              padding: EdgeInsets.all(10),
                                              height: 300,
                                              width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
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
                                                                _disabledEmp.employees![index].name.toString(),
                                                                style:
                                                                TextStyle(color: Colors.lightBlue),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            Container(
                                                              height: 15,
                                                              width: 120,
                                                              child: Text(
                                                                _disabledEmp.employees![index].phoneNumber.toString(),
                                                                style:
                                                                TextStyle(color: Colors.lightBlue),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            Container(
                                                              height: 15,
                                                              width: 150,
                                                              child: Text(_disabledEmp.employees![index].email.toString(),
                                                                  style: TextStyle(
                                                                      color: Colors.lightBlue)),
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 20),
                                                    Container(
                                                      height: 100,
                                                      width: 280,
                                                      color: Colors.grey.shade500,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Storage.set_empID(_disabledEmp.employees![index].employeeId.toString());
                                                            print(Storage.get_empID());
                                                            access().deleteEmployee(Storage.get_locationID().toString(),
                                                                Storage.get_empID().toString()).then((value){
                                                              if(value["success"]){
                                                                Fluttertoast.showToast(
                                                                    msg: "${"Deleted employee with id: ${Storage.get_empID().toString()}"}",
                                                                    toastLength: Toast.LENGTH_SHORT,
                                                                    gravity: ToastGravity.BOTTOM,
                                                                    timeInSecForIosWeb: 1,
                                                                    backgroundColor: Colors.green.shade400,
                                                                    textColor: Colors.white,
                                                                    fontSize: 16.0);
                                                                setState(() {
                                                                  Navigator.pop(context);
                                                                });

                                                              } else{

                                                                Fluttertoast.showToast(
                                                                    msg: "Error deleting employee with id: ${Storage.get_empID().toString()}",
                                                                    toastLength: Toast.LENGTH_SHORT,
                                                                    gravity: ToastGravity.BOTTOM,
                                                                    timeInSecForIosWeb: 1,
                                                                    backgroundColor: Colors.red.shade400,
                                                                    textColor: Colors.white,
                                                                    fontSize: 16.0);
                                                              }

                                                            });
                                                          },
                                                          child: Text('Delete',
                                                              style: TextStyle(color: Colors.white)),
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                              MaterialStateProperty.all(
                                                                  Colors.blue.shade900)),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            print("locId: ${Storage.get_locationID().toString()}");
                                                            print("empId: ${Storage.get_empID().toString()}");
                                                            access().enableEmployee(Storage.get_locationID().toString(),
                                                                Storage.get_empID().toString()).then((value){
                                                              if(value["success"]){
                                                                Fluttertoast.showToast(
                                                                    msg: "${"Enabled employee with id: ${Storage.get_empID().toString()}"}",
                                                                    toastLength: Toast.LENGTH_SHORT,
                                                                    gravity: ToastGravity.BOTTOM,
                                                                    timeInSecForIosWeb: 1,
                                                                    backgroundColor: Colors.green.shade400,
                                                                    textColor: Colors.white,
                                                                    fontSize: 16.0);
                                                                setState(() {
                                                                  Navigator.pop(context);
                                                                });

                                                              } else{
                                                                Fluttertoast.showToast(
                                                                    msg: "Error enabling employee with id: ${Storage.get_empID().toString()}",
                                                                    toastLength: Toast.LENGTH_SHORT,
                                                                    gravity: ToastGravity.BOTTOM,
                                                                    timeInSecForIosWeb: 1,
                                                                    backgroundColor: Colors.red.shade400,
                                                                    textColor: Colors.white,
                                                                    fontSize: 16.0);
                                                              }

                                                            });
                                                          },
                                                          child: Text('Enable',
                                                              style: TextStyle(color: Colors.white)),
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                              MaterialStateProperty.all(
                                                                  Colors.blue.shade900)),
                                                        )
                                                      ],
                                                    )
                                                  ]),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.arrow_right_sharp,
                                          size: 35,
                                        ))
                                  ]),
                              SizedBox(
                                height: 15,
                              ),

                            ],
                          );
                        },


                      )
                  );


                }}
              else{
                return Center(child: Text("No disabled users found"),);
              }
            },

            future: getDisabledEmployeesList(),
          ),
        ],
      ),



    ));
  }
}

Future getDisabledEmployeesList() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};


  var url = Uri.parse('https://stg.visitormanager.net/v1/totalDisaledEmployees?location_Id=${Storage.get_locationID()}');

  final response = await http.get(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return DisabledEmployeesList.fromJson(jsonDecode(response.body));
  } else {
    print("Failed to fetch data");
  }

}