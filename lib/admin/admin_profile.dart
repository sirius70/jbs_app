import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbs_app/admin/admin2.dart';
import 'package:jbs_app/admin/navigation%20bar.dart';
import 'package:jbs_app/api/access.dart';
import 'package:jbs_app/models/profile_model.dart';

import '../storage.dart';


class adminProfile extends StatefulWidget {
  const adminProfile({Key? key}) : super(key: key);

  @override
  State<adminProfile> createState() => _adminProfileState();
}

class _adminProfileState extends State<adminProfile> {

  SharedPreferencesInit() async {
    await Storage.init();
  }

  @override
  void initState(){
    super.initState();
    SharedPreferencesInit();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [new BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 5.0,
                        ),]
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
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
                              Text(Storage.get_name().toString(),
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
                      boxShadow: [new BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 5.0,
                      ),]
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Manage service requests"),

                            IconButton(onPressed: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder:
                                  (context)=>Admin2(location: Storage.get_location().toString(),
                                    empID: Storage.get_adminEmpID().toString(),
                                  name: Storage.get_name().toString(),)));
                            },
                                icon: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                          ],
                        ),
                      ),
                      Divider(),

                      Padding(
                        padding: const EdgeInsets.only( left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Manage users"),

                            IconButton(onPressed: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder:
                                  (context)=>Appdrawer()));
                            },
                                icon: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [new BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 5.0,
                      ),]
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Visitor's history"),

                            IconButton(onPressed: (){
                              // Navigator.push(
                              //     context, MaterialPageRoute(builder:
                              //     (context)=>myTracking()));
                            },
                                icon: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                          ],
                        ),
                      ),
                      Divider(),

                      Padding(
                        padding: const EdgeInsets.only( left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Evacuation mode"),
                            IconButton(onPressed: (){
                            },
                                icon: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                          ],
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),

                SizedBox(height: 70,),

                Container(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.logout, color: Colors.white,),
                      onPressed: (){
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context)=>otpVerify()));
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
                padding: EdgeInsets.all(10),
                width: 425.0,
                height: 400.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color(0xFFFFFF),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/images/loki.jpg"),
                              fit: BoxFit.fill
                          )
                      ),
                    ),

                    SizedBox(height: 20),
                    Text("${profilee.data.name}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20
                      ),),

                    SizedBox(height: 30),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call, color: Color(0xff009AFF),),
                          Text(" ${profilee.data.phoneNumber}"),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.mail, color: Color(0xff009AFF),),
                          Text(" ${profilee.data.email}"),
                        ],
                      ),
                    ),

                  ],
                ),
              ));
        });
  }
}
