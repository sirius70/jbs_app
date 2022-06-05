import 'package:flutter/material.dart';

import 'add_user.dart';
import 'admin_disable.dart';
import 'admin_users.dart';

class Appdrawer extends StatelessWidget {
  const Appdrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.1)),
            child: Row(
              children: [
                SizedBox(width: 5),
                Text(
                  'Create User',
                  style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                ),
                SizedBox(
                  width: 200,
                ),
                Container(
                  height: 35,
                  width: 40,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Create_user();
                      }));
                    },
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.blue.shade400,
                    ),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      padding:
                          MaterialStateProperty.all(EdgeInsets.only(bottom: 3)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.1)),
            child: Row(
              children: [
                SizedBox(width: 5),
                Text(
                  'Disabled User',
                  style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                ),
                SizedBox(
                  width: 183,
                ),
                Container(
                  height: 35,
                  width: 40,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Deleted_users();
                      }));
                    },
                    child: Icon(Icons.arrow_right, color: Colors.blue.shade400),
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(EdgeInsets.only(bottom: 3)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.1)),
            child: Row(
              children: [
                SizedBox(width: 5),
                Text(
                  'Deleted User',
                  style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                ),
                SizedBox(
                  width: 192,
                ),
                Container(
                  height: 35,
                  width: 40,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Users();
                      }));
                    },
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.blue.shade400,
                    ),
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(EdgeInsets.only(bottom: 3)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.1)),
            child: Row(
              children: [
                SizedBox(width: 5),
                Text(
                  'View all users',
                  style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                ),
                SizedBox(
                  width: 192,
                ),
                Container(
                  height: 35,
                  width: 40,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return Users();
                          }));
                    },
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.blue.shade400,
                    ),
                    style: ButtonStyle(
                      padding:
                      MaterialStateProperty.all(EdgeInsets.only(bottom: 3)),
                      backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
