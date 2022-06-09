import 'package:flutter/material.dart';
import 'package:jbs_app/admin/usersList.dart';

import 'add_user.dart';
import 'admin_disable.dart';
import 'admin_users.dart';

class Appdrawer extends StatelessWidget {
  const Appdrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        title: Text(
          'Manage Users',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color(0xffE9E9E9))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Create User',
                  style: TextStyle(fontSize: 20, color: Color(0xff092F52)),
                ),

                IconButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return Create_user();
                      }));
                }, icon: Icon(Icons.arrow_forward_ios),color: Color(0xff005993)),

              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xffE9E9E9))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
              'Disabled User',
                  style: TextStyle(fontSize: 20, color: Color(0xff092F52)),
                ),

                IconButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return Deleted_users();
                      }));
                }, icon: Icon(Icons.arrow_forward_ios),color: Color(0xff005993)),


              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xffE9E9E9))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Deleted Users',
                  style: TextStyle(fontSize: 20, color: Color(0xff092F52)),
                ),

                IconButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return Users();
                      }));
                }, icon: Icon(Icons.arrow_forward_ios),color: Color(0xff005993)),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xffE9E9E9))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'View all Users',
                  style: TextStyle(fontSize: 20, color: Color(0xff092F52)),
                ),

                IconButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return UsersLists();
                      }));
                }, icon: Icon(Icons.arrow_forward_ios),color: Color(0xff005993)),
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
