import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../admin/more.dart';
import 'viewusers.dart';

class Approve_req extends StatefulWidget {
  const Approve_req({Key? key}) : super(key: key);

  @override
  State<Approve_req> createState() => _Approve_reqState();
}

class _Approve_reqState extends State<Approve_req> {
  bool _myBool = false;
  bool _mybool = false;

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
                          style: TextStyle(
                              color: HexColor('#818081'), fontSize: 15),
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
                          style: TextStyle(
                              color: HexColor('#818081'), fontSize: 15),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Users();
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
                          style: TextStyle(
                              color: HexColor('#818081'), fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
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
                          style: TextStyle(
                              color: HexColor('#818081'), fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
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
                          onPressed: () {
                            setState(() => _myBool = !_myBool);
                            showMaterialModalBottomSheet(
                                expand: false,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(18),
                                              topRight: Radius.circular(18))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Approve all',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 15),
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Deny all',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ))
                                        ],
                                      ),
                                    ));
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                    height: 20.0,
                                    width: 20.0,
                                    child: GestureDetector(
                                      onTap: () {
                                        showMaterialModalBottomSheet(
                                            expand: false,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) => Container(
                                                  height: 150,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(18),
                                                              topRight: Radius
                                                                  .circular(
                                                                      18))),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            'Approve all',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontSize: 15),
                                                          )),
                                                      Divider(
                                                        thickness: 0.5,
                                                        color: Colors.grey,
                                                      ),
                                                      TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            'Deny all',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue),
                                                          ))
                                                    ],
                                                  ),
                                                ));
                                      },
                                      child: Checkbox(
                                          value: _myBool,
                                          onChanged: (value) {
                                            setState(() => _myBool = value!);
                                          }),
                                    )),
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
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
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
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
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
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
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
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
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
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
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
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
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
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
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
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
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
                ]),
              ],
            )));
  }
}
