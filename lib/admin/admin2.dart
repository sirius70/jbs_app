import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:marquee/marquee.dart';

import 'admin_users.dart';
import 'navigation bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Admin2(),
    );
  }
}

class Admin2 extends StatelessWidget {
  const Admin2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: Container(
        height: 65,
        color: HexColor('#d8d8d9'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Users();
                }));
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
              onPressed: () {},
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
                onPressed: () {},
                child: Icon(
                  Icons.qr_code,
                  color: HexColor('#818081'),
                  size: 50,
                )),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Appdrawer();
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
            TextButton(
              onPressed: () {},
              child: Column(
                children: [
                  LineIcon(
                    LineIcons.boxes,
                    size: 30,
                    color: HexColor('#818081'),
                  ),
                  Text(
                    'More',
                    style: TextStyle(color: HexColor('#818081'), fontSize: 15),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(color: Colors.lightBlue, fontSize: 15),
                    ),
                    Row(
                      children: [
                        Text(
                          'Caroline\nRose',
                          style: TextStyle(
                              color: Colors.blue.shade900, fontSize: 30),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_drop_down,
                                color: Colors.lightBlue))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 86,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image(image: AssetImage('lib/images/face.png'), height: 50),
                    Text(
                      'Admin',
                      style: TextStyle(color: Colors.amber, fontSize: 10),
                    ),
                    Text(
                      'Bengaluru',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(
                      'Emp Id: 12345',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 20,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Marquee(
              text: 'sample text ',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 60.0,
              pauseAfterRound: Duration.zero,
              startPadding: 10.0,
              accelerationDuration: Duration.zero,
              accelerationCurve: Curves.linear,
              decelerationDuration: Duration.zero,
              decelerationCurve: Curves.easeOut,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23, top: 5, bottom: 5),
                    child: Container(
                      height: 130,
                      width: 315,
                      decoration: BoxDecoration(
                        color: HexColor('#f1f0f1'),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Reports from front desk',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                    image: AssetImage('lib/images/bors2.png'),
                                    height: 80,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: HexColor('#ababab'),
                                          radius: 5,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 80,
                                          height: 10,
                                          color: HexColor('#dadbda'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: HexColor('#ababab'),
                                          radius: 5,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 100,
                                          height: 10,
                                          color: HexColor('#dadbda'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: HexColor('#ababab'),
                                          radius: 5,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 40,
                                          height: 10,
                                          color: HexColor('#dadbda'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: HexColor('#ababab'),
                                          radius: 5,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 120,
                                          height: 10,
                                          color: HexColor('#dadbda'),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'view in details >',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 23),
                    child: Container(
                        height: 420,
                        width: 320,
                        decoration: BoxDecoration(
                            color: HexColor('#f1f0f1'),
                            borderRadius: BorderRadius.circular(18)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Service Request',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 70,
                                  width: 80,
                                  child: Image(
                                      height: 70,
                                      width: 80,
                                      image:
                                          AssetImage('lib/images/face2.jpg')),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      color: HexColor('#dadbda'),
                                      height: 10,
                                      width: 120,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      color: HexColor('#dadbda'),
                                      height: 10,
                                      width: 150,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      color: HexColor('#dadbda'),
                                      height: 10,
                                      width: 150,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: 30,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text('respond',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                HexColor('#dadbda'))),
                                  ),
                                )),
                            Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 70,
                                  width: 80,
                                  child: Image(
                                      height: 70,
                                      width: 80,
                                      image:
                                          AssetImage('lib/images/face2.jpg')),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      color: HexColor('#dadbda'),
                                      height: 10,
                                      width: 120,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      color: HexColor('#dadbda'),
                                      height: 10,
                                      width: 150,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      color: HexColor('#dadbda'),
                                      height: 10,
                                      width: 150,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: 30,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text('respond',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                HexColor('#dadbda'))),
                                  ),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 70,
                                  width: 80,
                                  child: Image(
                                      height: 70,
                                      width: 80,
                                      image:
                                          AssetImage('lib/images/face2.jpg')),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      color: HexColor('#dadbda'),
                                      height: 10,
                                      width: 120,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      color: HexColor('#dadbda'),
                                      height: 10,
                                      width: 150,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      color: HexColor('#dadbda'),
                                      height: 10,
                                      width: 150,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: 30,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text('respond',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                HexColor('#dadbda'))),
                                  ),
                                )),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
          Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: ListTile(
                leading: Text('View guest',
                    style: TextStyle(color: Colors.lightBlue)),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_right_alt,
                    color: Colors.lightBlue,
                  ),
                  onPressed: () {},
                ),
              ))
        ],
      ),
    ));
  }
}
