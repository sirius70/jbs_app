import 'package:flutter/material.dart';

import '../api/access.dart';
import '../models/profile_model.dart';
import '../storage.dart';
import 'home.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
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
                          Storage.get_name().toString(),
                          style: TextStyle(
                              color: Colors.lightBlue.shade700, fontSize: 25),
                        ),
                        GestureDetector(
                          onTap: (){
                            access().profile().then((value) async{
                              if(value["success"]) {
                                ProfileApi profile = await ProfileApi.fromJson(value);
                                final name = profile.data.name;
                                Storage.set_name(name);
                                return _showEditProfileDialogue(context, profile);
                              }else{
                                return Center(child: CircularProgressIndicator(),);
                              }
                            });
                          },
                          child: Text(
                            'View profile and settings',
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                        ),
                      ],
                    ),
                    horizontalTitleGap: 15,
                    minLeadingWidth: 0,
                  )),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 1,
                thickness: 0.3,
                color: Colors.grey.shade500,
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      minVerticalPadding: 0,
                      horizontalTitleGap: 0,
                      leading: Icon(
                        Icons.qr_code,
                        color: Colors.blue.shade900,
                        size: 30,
                      ),
                      title: Text(
                        'Attendance stats',
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_right,
                          color: Colors.grey.shade500,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 0.3,
                      color: Colors.grey.shade400,
                    ),
                    ListTile(
                      minVerticalPadding: 0,
                      horizontalTitleGap: 0,
                      leading: Icon(
                        Icons.timer,
                        color: Colors.blue.shade900,
                        size: 30,
                      ),
                      title: Text(
                        'Approve Request',
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_right,
                          color: Colors.grey.shade500,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context) =>
                                  Home2(empId: Storage.get_adminEmpID().toString(),
                                location: Storage.get_location().toString(),
                                    name: Storage.get_name().toString(),)
                              ));
                        },
                      ),
                    ),
                    Divider(
                      height: 0,
                      thickness: 0.3,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 0,
                      thickness: 0.3,
                      color: Colors.grey.shade400,
                    ),
                    ListTile(
                      minVerticalPadding: 0,
                      horizontalTitleGap: 0,
                      leading: Icon(
                        Icons.details,
                        color: Colors.blue.shade900,
                        size: 30,
                      ),
                      title: Text(
                        'User Details',
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_right,
                          color: Colors.grey.shade500,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 0.3,
                      color: Colors.grey.shade400,
                    ),
                    ListTile(
                      minVerticalPadding: 0,
                      horizontalTitleGap: 0,
                      leading: Icon(
                        Icons.timer,
                        color: Colors.blue.shade900,
                        size: 30,
                      ),
                      title: Text(
                        'Attendance stats',
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_right,
                          color: Colors.grey.shade500,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Divider(
                      height: 0,
                      thickness: 0.3,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
              ),
              SizedBox(
                width: 100,
                child: TextButton(
                    onPressed: () {},
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
                          Text(" ${profilee.data.email}", textAlign: TextAlign.center,),
                        ],
                      ),
                    ),

                  ],
                ),
              ));
        });
  }


}



