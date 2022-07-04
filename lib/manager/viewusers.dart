import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
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
  bool loading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loading = false;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
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
                      // Get.back();
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
            'Active Users',
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
          //           onPressed: () => setState(() => _myBool = !_myBool),
          //           child: Row(
          //               mainAxisAlignment: MainAxisAlignment.end,
          //               children: [
          //                 SizedBox(
          //                     height: 20.0,
          //                     width: 20.0,
          //                     child: Checkbox(
          //                         value: _myBool,
          //                         onChanged: (value) {
          //                           setState(() => _myBool = value!);
          //                         })),
          //                 SizedBox(width: 5.0),
          //                 Text(
          //                   "Select all",
          //                   style: TextStyle(color: Colors.lightBlue),
          //                 )
          //               ])),
          //     ],
          //   ),
          // )
      ),
      body: loading? Center(child: CircularProgressIndicator(),):
      Container(
        padding: const EdgeInsets.all(0),
        child: Column(
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
                      height: MediaQuery.of(context).size.width*0.16,
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
                  Text('${manUserDetails.data[0].name.toString()}',
                      style: TextStyle(
                          color: Colors.lightBlue)),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${manUserDetails.data[0].phoneNumber.toString()}',
                    style:
                    TextStyle(color: Colors.lightBlue),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('${manUserDetails.data[0].email.toString()}',
                      style: TextStyle(
                          color: Colors.lightBlue)),
                  SizedBox(
                    height: 80,
                  ),
                  TextButton(
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
                      ))
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
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 20,
          );
        },
        itemCount: empListss.data.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Image(
              image: AssetImage('lib/images/face3.png'),
              height: MediaQuery.of(context).size.width*0.16,
            ),
            title: Row(
              children: [
                Text(empListss.data[index].name.toString(), style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width*0.0375,
                    backgroundColor: Colors.grey.shade300
                ),),

              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text("${empListss.data[index].phoneNumber.toString()}", style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width*0.0375,
                    color: Colors.black,
                    backgroundColor: Colors.grey.shade300
                ),),
                SizedBox(
                  height: 5,
                ),
                Text("${empListss.data[index].email.toString()}",
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width*0.0375,
                      backgroundColor: Colors.grey.shade300
                  ),),
              ],
            ),
            trailing: TextButton(
                onPressed: () {
                  final empId = empListss.data[index].employeeId;
                  Storage.set_managerEmpID(empId.toString());
                  print(Storage.get_managerEmpID());
                  showMaterialModalBottomSheet(
                    expand: false,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => Container(
                        height: MediaQuery.of(context).size.height*0.375,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40))),
                        child:
                        //manuserDetailBox(context, manUserDetails)
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Divider(
                                height: 3,
                                thickness: 4,
                                endIndent: 110,
                                indent: 110,
                                color: Color(0xff005993)
                            ),

                            // Padding(
                            //   padding: const EdgeInsets.only(top: 10, left: 20.0, right: 20),
                            //   child: GestureDetector(
                            //     onTap: (){},
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.end,
                            //       children: const[
                            //         Icon(Icons.edit, size: 15,),
                            //         Text("Edit", style: TextStyle(
                            //             fontSize: 12,
                            //             color: Color(0xff005993)
                            //         ),)
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [


                                  Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 50,
                                          child: Image(
                                            image:
                                            AssetImage('lib/images/face.png'),
                                          ),
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


                                      ]),

                                  SizedBox(height: 20,),

                                  Container(
                                    width: MediaQuery.of(context).size.width*0.375,
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
                                                    fontSize: MediaQuery.of(context).size.width*0.04)),
                                            Icon(Icons.arrow_right_alt,
                                                color: Colors.white,
                                                size: 15),
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xff525252),
                  size: 20,
                )),
          );


            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Text(empListss.data[index].name.toString(), style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: MediaQuery.of(context).size.width*0.0375,
                                backgroundColor: Colors.grey.shade300
                            ),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("${empListss.data[index].phoneNumber.toString()}", style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width*0.0375,
                                backgroundColor: Colors.grey.shade300
                            ),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("rfghudsygatayhuufdgysftghnjchbgvfgavhbs",
                              maxLines: 3,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width*0.0375,
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
                                height: MediaQuery.of(context).size.height*0.375,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40),
                                        topLeft: Radius.circular(40))),
                                child:
                                //manuserDetailBox(context, manUserDetails)
                                Column(
                                 // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   const Divider(
                                      height: 3,
                                      thickness: 4,
                                      endIndent: 110,
                                      indent: 110,
                                       color: Color(0xff005993)
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, left: 20.0, right: 20),
                                      child: GestureDetector(
                                        onTap: (){},
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: const[
                                            Icon(Icons.edit, size: 15,),
                                            Text("Edit", style: TextStyle(
                                              fontSize: 12,
                                                color: Color(0xff005993)
                                            ),)
                                          ],
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [


                                          Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 50,
                                                  child: Image(
                                                    image:
                                                    AssetImage('lib/images/face.png'),
                                                  ),
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


                                              ]),

                                          SizedBox(height: 20,),

                                          Container(
                                            width: MediaQuery.of(context).size.width*0.375,
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
                                                            fontSize: MediaQuery.of(context).size.width*0.04)),
                                                    Icon(Icons.arrow_right_alt,
                                                        color: Colors.white,
                                                        size: 15),
                                                  ],
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
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
          );
        }
    );
  }
  Widget manUserDetailsBox(BuildContext context, ManagerUserDetailsLists manUserDetails){
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              '${manUserDetails.data[0].name.toString()}',
              style: TextStyle(
                  color: Colors.lightBlue)),
          SizedBox(
            height: 8,
          ),
          Text(
            '${manUserDetails.data[0].phoneNumber.toString()}',
            style:
            TextStyle(color: Colors.lightBlue),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
              '${manUserDetails.data[0].email.toString()}',
              style: TextStyle(
                  color: Colors.lightBlue)),
          

        ],),
    );
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

