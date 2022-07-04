import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jbs_app/admin/admin2.dart';
import 'package:jbs_app/admin/navigation%20bar.dart';
import 'package:jbs_app/admin/service_requests.dart';
import 'package:jbs_app/admin/statistics.dart';
import 'package:jbs_app/admin/usersList.dart';
import 'package:jbs_app/api/access.dart';
import 'package:jbs_app/employee_screens/my_scan_qr.dart';
import 'package:jbs_app/models/profile_model.dart';
import 'package:jbs_app/screens/login_2.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../storage.dart';
import 'admin_scanQr.dart';
import 'evacuation_mode.dart';


class adminProfile extends StatefulWidget {
  const adminProfile({Key? key}) : super(key: key);

  @override
  State<adminProfile> createState() => _adminProfileState();
}

class _adminProfileState extends State<adminProfile> {
  ProfileApi? getProfile;
  bool loading = true;

  SharedPreferencesInit() async {
    await Storage.init();
  }

  @override
  void initState(){
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
    SharedPreferencesInit();
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (BuildContext context) =>
                            Admin2(location: Storage.get_location().toString(),
                              empID: Storage.get_adminEmpID().toString(),)));
                      },
                      child: Column(
                        children: [
                          LineIcon(
                            LineIcons.home,
                            size: 30,
                            color: HexColor('#818081'),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(color: HexColor('#818081'), fontSize: 15),
                          )
                        ],
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return UsersLists();
                        }));
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
                            Navigator
                                .of(context)
                                .push(MaterialPageRoute(builder:
                                (BuildContext context) => profileQr()));
                          },
                          icon: Icon(CupertinoIcons.qrcode_viewfinder,  size: 40,
                              color: Color(0xff717171))),
                    ),

                    TextButton(
                      onPressed: () {
                        print("stats");
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return stats();
                        }));
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return adminProfile();
                        }));
                      },
                      child: Column(
                        children: [
                          LineIcon(
                            LineIcons.boxes,
                            size: 30,
                            color: HexColor('#005993'),
                          ),
                          Text(
                            'More',
                            style: TextStyle(color: HexColor('#005993'), fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
        body: loading? Center(child: CircularProgressIndicator(),):
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [ BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 5.0,
                        ),]
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/loki.jpg"),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),

                        SizedBox(width: 20,),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(getProfile==null? "": getProfile!.data[0].name,
                                style: TextStyle(
                                    color: Color(0xff005993),
                                    fontSize: 20
                                ),),

                              SizedBox(height: 5,),
                              GestureDetector(
                                onTap: (){
                                  access().profile().then((value) async{
                                    if(value["success"]) {
                                      ProfileApi profile = await ProfileApi.fromJson(value);
                                      // final name = profile.data.name;
                                      // Storage.set_name(name);
                                      return _showEditProfileDialogue(context, profile);
                                    }else{
                                      return Center(child: CircularProgressIndicator(),);
                                    }
                                  });

                                },
                                child: Text("View Profile and settings",
                                  style: TextStyle(
                                      color: Color(0xff009AFF)
                                  ),),

                              )
                            ],
                          ),
                        )
                      ],
                    )
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
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: ListTile(
                          title:  Text("Manage Service Requests",
                          style:  TextStyle(
                            fontSize: MediaQuery.of(context).size.width*0.0375
                          ),),
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder:
                                (context)=>adminServiceRequests()));
                          },
                          trailing: IconButton(onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder:
                                (context)=>adminServiceRequests()));
                          },
                              icon:  Icon(Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: MediaQuery.of(context).size.width*0.05,)),
                        ),
                      ),
                    //  Divider(),

                      ListTile(
                        title:  Text("Manage Users",
                          style:  TextStyle(
                              fontSize: MediaQuery.of(context).size.width*0.0375
                          ),),
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder:
                              (context)=>Appdrawer()));
                        },
                        trailing: IconButton(onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder:
                              (context)=>Appdrawer()));
                        },
                            icon: Icon(Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: MediaQuery.of(context).size.width*0.05,)),


                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 20,),


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
                        title:  Text("Visitor Stats",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width*0.0375
                          ),),
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder:
                              (context)=>stats()));
                        },
                        trailing: IconButton(onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder:
                              (context)=>stats()));
                        },
                            icon: Icon(Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: MediaQuery.of(context).size.width*0.05,)),


                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                Container(
                 // padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [ BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 5.0,
                      ),]
                  ),
                  child: ListTile(
                    title:  Text("Evacuation Mode",
                      style: TextStyle(
                        color: Color(0xffFF0000),
                          fontSize: MediaQuery.of(context).size.width*0.0375
                      ),),
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder:
                          (context)=>evacuationOff()));
                    },
                    trailing: IconButton(onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder:
                          (context)=>evacuationOff()));
                    },
                        icon: Icon(Icons.arrow_forward_ios,
                          color: Color(0xffFF0000),
                          size: MediaQuery.of(context).size.width*0.05,)),


                  ),
                ),

                SizedBox(height: 70,),

                Container(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.logout, color: Colors.white,),
                      onPressed: (){

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
                      label: Text("    Logout", style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
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
                ),


              ],
            ),
          ),
        ),
      ),
    );
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
