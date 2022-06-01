import 'package:flutter/material.dart';
import 'attendance.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
          Row(children: [
            SizedBox(
              width: 10,
            ),
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
                Container(
                  height: 10,
                  width: 120,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 150,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 80,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(
              width: 65,
            ),
            TextButton(
                onPressed: () {
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
                      child: Column(
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
                                      child: Text('Caroline forbes',
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
                                        '+91 744xxxxxxx',
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
                                      child: Text('carolineforbes@gmail.com',
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
                      ),
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
          Row(children: [
            SizedBox(
              width: 10,
            ),
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
                Container(
                  height: 10,
                  width: 120,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 150,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 80,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(
              width: 65,
            ),
            TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_right_sharp,
                  size: 35,
                ))
          ]),
          SizedBox(
            height: 15,
          ),
          Row(children: [
            SizedBox(
              width: 10,
            ),
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
                Container(
                  height: 10,
                  width: 120,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 150,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 80,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(
              width: 65,
            ),
            TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_right_sharp,
                  size: 35,
                ))
          ]),
          SizedBox(
            height: 15,
          ),
          Row(children: [
            SizedBox(
              width: 10,
            ),
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
                Container(
                  height: 10,
                  width: 120,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 150,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 80,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(
              width: 65,
            ),
            TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_right_sharp,
                  size: 35,
                ))
          ]),
          SizedBox(
            height: 15,
          ),
          Row(children: [
            SizedBox(
              width: 10,
            ),
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
                Container(
                  height: 10,
                  width: 120,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 150,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 80,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(
              width: 65,
            ),
            TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_right_sharp,
                  size: 35,
                ))
          ]),
          SizedBox(
            height: 15,
          ),
          Row(children: [
            SizedBox(
              width: 10,
            ),
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
                Container(
                  height: 10,
                  width: 120,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 150,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 80,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(
              width: 65,
            ),
            TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_right_sharp,
                  size: 35,
                ))
          ]),
          SizedBox(
            height: 15,
          ),
          Row(children: [
            SizedBox(
              width: 10,
            ),
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
                Container(
                  height: 10,
                  width: 120,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 150,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 80,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(
              width: 65,
            ),
            TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_right_sharp,
                  size: 35,
                ))
          ]),
          SizedBox(
            height: 15,
          ),
          Row(children: [
            SizedBox(
              width: 10,
            ),
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
                Container(
                  height: 10,
                  width: 120,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 150,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 80,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(
              width: 65,
            ),
            TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_right_sharp,
                  size: 35,
                ))
          ]),
        ],
      ),
    ));
  }
}
