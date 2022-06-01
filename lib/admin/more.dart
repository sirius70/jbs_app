import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    Color _iconColor = Colors.black;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading: Image(
                  image: AssetImage('lib/images/face.png'),
                  height: 150,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Caroline \nRose',
                      style: TextStyle(
                          color: Colors.lightBlue.shade700, fontSize: 25),
                    ),
                    Text(
                      'View profile and settings',
                      style: TextStyle(color: Colors.lightBlue),
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
                  leading: Text(
                    'Manage service request',
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_right,
                      color: _iconColor,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        _iconColor = Colors.blue.shade900;
                      });
                    },
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 0.3,
                  color: Colors.grey.shade400,
                ),
                ListTile(
                  minVerticalPadding: 0,
                  leading: Text(
                    'Manage users',
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_right,
                      color: _iconColor,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        _iconColor = Colors.blue.shade900;
                      });
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
                  leading: Text(
                    'Visitors History',
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_right,
                      color: _iconColor,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        _iconColor = Colors.blue.shade900;
                      });
                    },
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 0.3,
                  color: Colors.grey.shade400,
                ),
                ListTile(
                  minVerticalPadding: 0,
                  leading: Text(
                    'Evacuation Mode',
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_right,
                      color: _iconColor,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        _iconColor = Colors.blue.shade900;
                      });
                    },
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
}
