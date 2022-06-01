import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'more.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          children: [
            Icon(Icons.arrow_left_sharp, color: Colors.black),
            Text(
              'back',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        height: 65,
        color: HexColor('#d8d8d9'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
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
              onPressed: () {},
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return More();
                }));
              },
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
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Attendance',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                        fontSize: 35)),
              ),
              SizedBox(
                width: 100,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'This month',
                        style: TextStyle(color: Colors.blue, fontSize: 10),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.blue)
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Material(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(20),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(18)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Employees present today: '),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        '52',
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 1,
                      ),
                      Text('Working days this month: '),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        '28',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 70,
                      ),
                      Text('Average rate: '),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        '50',
                        style: TextStyle(color: Colors.amber),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 170,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Stats',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.blue.shade900,
                            fontSize: 20),
                      ),
                      Center(
                        child: Image(
                          image: AssetImage('lib/images/bars2.png'),
                          height: 100,
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 5,
                          ),
                          Text(
                            ' On Time',
                            style: TextStyle(color: Colors.blue),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: 5,
                          ),
                          Text(
                            ' Late',
                            style: TextStyle(color: Colors.blue),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.purple,
                            radius: 5,
                          ),
                          Text(
                            ' Leave',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      )
                    ],
                  )),
              Container(
                height: 170,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Logs',
                            style: TextStyle(
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                          IconButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Colors.blue.shade900,
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text('Today')),
                      ),
                      Row(
                        children: [
                          Text('Vinod'),
                          Spacer(),
                          Text('Checkout'),
                          Spacer(),
                          Text('9:40 am')
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('Vinod'),
                          Spacer(),
                          Text('Checkout'),
                          Spacer(),
                          Text('9:40 am')
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('Vinod'),
                          Spacer(),
                          Text('Checkout'),
                          Spacer(),
                          Text('9:40 am')
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('Vinod'),
                          Spacer(),
                          Text('Checkout'),
                          Spacer(),
                          Text('9:40 am')
                        ],
                      )
                    ]),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Late',
                    style: TextStyle(color: Colors.blue.shade900),
                  ),
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
                  ]),
                  SizedBox(
                    height: 5,
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
                  ]),
                  SizedBox(
                    height: 5,
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
                  ]),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Leave',
                    style: TextStyle(color: Colors.blue.shade900),
                  ),
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
                  ]),
                  SizedBox(
                    height: 5,
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
                  ]),
                  SizedBox(
                    height: 5,
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
                  ]),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'On time',
                    style: TextStyle(color: Colors.blue.shade900),
                  ),
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
                  ]),
                  SizedBox(
                    height: 5,
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
                  ]),
                  SizedBox(
                    height: 5,
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
                  ]),
                ],
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
