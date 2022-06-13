import 'package:flutter/material.dart';
import '../models/manager_user_details_model.dart';
import '../models/manager_user_lists.dart';
import '../storage.dart';
import 'attendance.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:http/http.dart'  as http;

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  bool _myBool = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Row(
            children: [
              Icon(Icons.arrow_left_sharp, color: Colors.blue),
              Text(
                'back',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          title: Text(
            'Active Users',
            style: TextStyle(color: Colors.blue.shade900),
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
        children: [


          Expanded(
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot != null){
                  ManagerUserLists managerUsers = snapshot.data as ManagerUserLists ;
                  if (managerUsers == null){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  else{
                    return managerUserListBox(context, managerUsers);
                  }}
                else{
                  return CircularProgressIndicator();
                }
              },

              future: getManagerUserList(),
            ),
          ),
        ],
      ),
    ));
  }

  Widget manuserDetailBox(BuildContext context, ManagerUserDetailsLists manUserDetails){
    return Column(
      children: [
        Divider(
          height: 1,
          thickness: 4,
          color: Colors.grey,
          endIndent: 70,
          indent: 70,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Image(
                      image:
                      AssetImage('lib/images/face.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 15,
                    width: 150,
                    child: Text('${manUserDetails.data[0].name.toString()}',
                        style: TextStyle(
                            color: Colors.lightBlue)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 15,
                    width: 120,
                    child: Text(
                      '${manUserDetails.data[0].phoneNumber.toString()}',
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
                    child: Text('${manUserDetails.data[0].email.toString()}',
                        style: TextStyle(
                            color: Colors.lightBlue)),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                    height: 30,
                    width: 100,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) {
                                    return Attendance();
                                  }));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(
                                Colors.blue.shade900),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        18)))),
                        child: Row(
                          children: [
                            Text('View attendance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10)),
                            Icon(Icons.arrow_right_alt,
                                color: Colors.white,
                                size: 15),
                          ],
                        )),
                  )
                ],
              ),
              Column(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.blue,
                            size: 10,
                          ),
                          Text(
                            'Edit',
                            style:
                            TextStyle(color: Colors.blue),
                          )
                        ],
                      ))
                ],
              )
            ]),
      ],
    );
  }

  Widget managerUserListBox(BuildContext context, ManagerUserLists empListss){
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20,
              );
            },
            itemCount: empListss.data.length,
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

                                  Text(empListss.data[index].name.toString(), style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      backgroundColor: Colors.grey.shade300
                                  ),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("${empListss.data[index].phoneNumber.toString()}", style: TextStyle(
                                      fontSize: 15,
                                      backgroundColor: Colors.grey.shade300
                                  ),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("${empListss.data[index].email.toString()}", style: TextStyle(
                                      fontSize: 15,
                                      backgroundColor: Colors.grey.shade300
                                  ),),

                                ],
                              ),
                            ],
                          ),

                          TextButton(
                              onPressed: () {
                                final empId = empListss.data[index].employeeId;
                                Storage.set_managerEmpID(empId.toString());
                                print(Storage.get_managerEmpID());
                                showMaterialModalBottomSheet(
                                  expand: false,
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => Container(
                                      padding: EdgeInsets.all(0),
                                      height: 300,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              topLeft: Radius.circular(40))),
                                      child:
                                      //manuserDetailBox(context, manUserDetails)
                                      Column(
                                        children: [
                                          Divider(
                                            height: 1,
                                            thickness: 4,
                                            color: Colors.grey,
                                            endIndent: 70,
                                            indent: 70,
                                          ),


                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 50,
                                                      child: Image(
                                                        image:
                                                        AssetImage('lib/images/face.png'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),

                                                //put here
                                                FutureBuilder(
                                                  builder: (context, snapshot) {
                                                    if (snapshot != null){
                                                      ManagerUserDetailsLists manUserDeta = snapshot.data as ManagerUserDetailsLists ;
                                                      if (manUserDeta == null){
                                                        return Center(child: CircularProgressIndicator(),);
                                                      }
                                                      else{
                                                        return manUserDetailsBox(context, manUserDeta);
                                                      }}
                                                    else{
                                                      return CircularProgressIndicator();
                                                    }
                                                  },

                                                  future: getManagerUserDetailsList(),
                                                ),
                                                Column(
                                                  children: [
                                                    TextButton(
                                                        onPressed: () {},
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.edit,
                                                              color: Colors.blue,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              'Edit',
                                                              style:
                                                              TextStyle(color: Colors.blue),
                                                            )
                                                          ],
                                                        ))
                                                  ],
                                                )
                                              ]),
                                        ],
                                      )
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
  Widget manUserDetailsBox(BuildContext context, ManagerUserDetailsLists manUserDetails){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
          height: 15,
          width: 150,
          child: Text('${manUserDetails.data[0].name.toString()}',
              style: TextStyle(
                  color: Colors.lightBlue)),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 15,
          width: 120,
          child: Text(
            '${manUserDetails.data[0].phoneNumber.toString()}',
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
          child: Text('${manUserDetails.data[0].email.toString()}',
              style: TextStyle(
                  color: Colors.lightBlue)),
        ),
        SizedBox(
          height: 80,
        ),
        SizedBox(
          height: 30,
          width: 100,
          child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) {
                          return Attendance();
                        }));
              },
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(
                      Colors.blue.shade900),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                              18)))),
              child: Row(
                children: [
                  Text('View attendance',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10)),
                  Icon(Icons.arrow_right_alt,
                      color: Colors.white,
                      size: 15),
                ],
              )),
        )
      ],);
  }
}

Future getManagerUserList() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};

  var url = Uri.parse('https://stg.visitormanager.net/v1/manager/userlist', );

  final response = await http.get(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return managerUserListsFromJson(response.body);
  } else {
    print("Failed to fetch data");
  }

}


Future getManagerUserDetailsList() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};

  var url = Uri.parse('https://stg.visitormanager.net/v1/manager/userdetail?employee_id=${Storage.get_managerEmpID()}', );

  final response = await http.get(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return managerUserDetailsListsFromJson(response.body);
  } else {
    print("Failed to fetch data");
  }

}

