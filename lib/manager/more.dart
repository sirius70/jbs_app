import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:jbs_app/manager/reqManagerRegularization.dart';
import 'package:jbs_app/manager/viewusers.dart';

import '../api/access.dart';
import '../employee_screens/my_attendance.dart';
import '../models/profile_model.dart';
import '../screens/login_2.dart';
import '../storage.dart';
import 'home.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  ProfileApi? getProfile;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loading = false;
    access().profile().then((value) {
      if (value["success"]) {
        setState(() {
          getProfile = ProfileApi.fromJson(value);
        });
        loading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: loading? Center(child: CircularProgressIndicator(),):
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [ BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 5.0,
                          ),]
                      ),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(
                        leading: Image(
                          image: AssetImage('lib/images/face.png'),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getProfile==null? "": getProfile!.data[0].name,
                              style: TextStyle(
                                  color: Colors.lightBlue.shade700,
                                  fontSize: MediaQuery.of(context).size.width*0.05),
                            ),
                            SizedBox(height: 5,),
                            GestureDetector(
                              onTap: (){
                                access().profile().then((value) async{
                                  if(value["success"]) {
                                    ProfileApi profile = await ProfileApi.fromJson(value);
                                    final name = profile.data[0].name;
                                    Storage.set_name(name);
                                    return _showEditProfileDialogue(context, profile);
                                  }else{
                                    return Center(child: CircularProgressIndicator(),);
                                  }
                                });
                              },
                              child: Text(
                                'View profile and settings',
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width*0.035,
                                    color: Colors.lightBlue),
                              ),
                            ),
                          ],
                        ),
                        horizontalTitleGap: 15,
                        minLeadingWidth: 0,
                      )),

                  SizedBox(height: 20,),


                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [ BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 5.0,
                        ),]
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          trailing: IconButton(onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>myAttendance()));
                          },
                              icon: Icon(Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: MediaQuery.of(context).size.width*0.05,)),
                          title:  Text("Attendance stats",
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width*0.0375
                            ),),
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>myAttendance()));
                          },
                          leading: Icon(Icons.qr_code_sharp,
                            color: Color(0xff009AFF),
                            size: MediaQuery.of(context).size.width*0.06,)
                        ),
                        ListTile(
                            trailing: IconButton(onPressed: (){
                              Get.to(reqRegularization());
                            },
                                icon: Icon(Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                  size: MediaQuery.of(context).size.width*0.05,)),
                            title:  Text("Approve Requests",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width*0.0375
                              ),),
                            onTap: (){
                              Get.to(reqRegularization());
                            },
                            leading: Icon(Icons.timer,
                              color: Color(0xff009AFF),
                              size: MediaQuery.of(context).size.width*0.06,)
                        ),

                      ],
                    ),
                  ),

                  SizedBox(height: 20,),

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [ BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 5.0,
                        ),]
                    ),
                    child: Column(
                      children: [
                        ListTile(
                            trailing: IconButton(onPressed: (){
                              Get.to(Users());
                            },
                                icon: Icon(Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                  size: MediaQuery.of(context).size.width*0.05,)),
                            title:  Text("User Details",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width*0.0375
                              ),),
                            onTap: (){
                              Get.to(Users());
                            },
                            leading: Icon(Icons.qr_code_sharp,
                              color: Color(0xff009AFF),
                              size: MediaQuery.of(context).size.width*0.06,)
                        ),

                      ],
                    ),
                  ),



                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.2,
                  ),
                  SizedBox(
                    width: 100,
                    child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content:  Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Are you sure you want to logout?",
                                    textAlign: TextAlign.center,),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel', style: TextStyle(
                                      color: Colors.black
                                  )),
                                ),

                                TextButton(
                                  onPressed: () {
                                    access().logout().then((value) async{
                                      if(value["success"]) {
                                        await Storage.sharedPreferences!.remove("accessToken");
                                        // await Storage.sharedPreferences!.remove("locationID");
                                        // await Storage.sharedPreferences!.remove("employeeId");
                                        // await Storage.sharedPreferences!.remove("adminEmpId");
                                        // await Storage.sharedPreferences!.remove("location");
                                        // await Storage.sharedPreferences!.remove("managerEmpId");

                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    loginScreen()
                                            ));
                                        Fluttertoast.showToast(
                                            msg: "${"Logout successful"}",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.green.shade300,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }else{
                                        Fluttertoast.showToast(
                                            msg: "${"Logout unsuccessful"}",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    });
                                  },
                                  child: const Text('Logout', style: TextStyle(
                                      color: Colors.red
                                  ),),
                                ),
                              ],
                            ),
                          );

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Logout',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                            )
                          ],
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.blue.shade900),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )))),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  _showEditProfileDialogue(BuildContext context, ProfileApi profilee) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Container(
                //padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 400.0,
                decoration:const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color:  Color(0xFFFFFF),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/loki.jpg"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),

                      SizedBox(height: 20),
                      Text("${profilee.data[0].name}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20
                        ),),

                      SizedBox(height: 30),
                      Container(
                        child: Column(
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.call, color: Color(0xff009AFF),),
                                  Text(" ${profilee.data[0].phoneNumber}"),
                                ],
                              ),
                            ),

                            SizedBox(height: 10),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Icon(Icons.call, color: Color(0xff009AFF),),
                            //     Text(" bhshbchsbcuhicunciscn@scbscjn"),
                            //   ],
                            // ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                const Center(child: Icon(Icons.mail, color: Color(0xff009AFF),)),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.02,
                                ),
                                Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.4,
                                    child: Expanded(
                                      child: Text(" ${profilee.data[0].email}",
                                        overflow: TextOverflow.clip,
                                        maxLines: 3,
                                        style:  TextStyle(
                                          fontSize: MediaQuery.of(context).size.width*0.0375,
                                        ),),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // SizedBox(height: 20,),
                            // Container(
                            //   child: Directionality(
                            //     textDirection: TextDirection.rtl,
                            //     child: ElevatedButton.icon(
                            //       icon: Icon(Icons.edit, color: Colors.white,
                            //         size: MediaQuery.of(context).size.width*0.05,),
                            //       onPressed: (){
                            //         // Navigator.push(context,
                            //         //     MaterialPageRoute(builder: (context)=>otpVerify()));
                            //       },
                            //       label: Text("   Edit", style: TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 16
                            //       ),),
                            //       style: ButtonStyle(
                            //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            //               RoundedRectangleBorder(
                            //                   borderRadius: BorderRadius.circular(25),
                            //                   side: BorderSide(color: Color(0xff005993))
                            //               )
                            //           ),
                            //           backgroundColor: MaterialStateProperty.all(Color(0xff005993),)
                            //       ),
                            //     ),
                            //   ),
                            // ),

                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ));
        });
  }


}



