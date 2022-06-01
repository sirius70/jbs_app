import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jbs_app/admin/statistics.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'admin2.dart';
import 'navigation bar.dart';

class Admin1 extends StatelessWidget {
  const Admin1({Key? key}) : super(key: key);

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
                            style: TextStyle(color: HexColor('#818081'), fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
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
                        onPressed: () {},
                        child: Image(
                          image: AssetImage('lib/images/barcode.png'),
                          color: Colors.grey,
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 15,
                  child: ListTile(
                    leading: Icon(
                      Icons.location_pin,
                      color: Colors.amber,
                      size: 15,
                    ),
                    title: Text(
                      'Mumbai',
                      style: TextStyle(color: Colors.amber, fontSize: 10),
                    ),
                    horizontalTitleGap: 0,
                    minLeadingWidth: 10,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 7),
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.sort),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return Appdrawer();
                              }));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    SizedBox(
                      width: 153,
                      child: ListTile(
                        leading: Icon(Icons.arrow_drop_down),
                        title: Text('Hi Georgi !'),
                        subtitle: Text(
                          'Have a good vibe',
                          style: TextStyle(color: Colors.red),
                        ),
                        minLeadingWidth: 5,
                        horizontalTitleGap: 0,
                        minVerticalPadding: 0,
                      ),
                    ),
                    CircleAvatar(
                        child: Image(image: AssetImage('lib/images/face.png')))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23, top: 5, bottom: 5),
                  child: Container(
                    height: 130,
                    width: 315,
                    decoration: BoxDecoration(
                      color: HexColor('#e5eaf6'),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Reports from front desk',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                  image: AssetImage('lib/images/bars.png'),
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
                                        backgroundColor: Colors.white,
                                        radius: 5,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 80,
                                        height: 10,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 5,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 100,
                                        height: 10,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 5,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 40,
                                        height: 10,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 5,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 120,
                                        height: 10,
                                        color: Colors.white,
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
                          color: HexColor('#e5eaf6'),
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
                                color: Colors.white,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.white,
                                    height: 10,
                                    width: 120,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height: 10,
                                    width: 150,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height: 10,
                                    width: 150,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
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
                                color: Colors.white,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.white,
                                    height: 10,
                                    width: 120,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height: 10,
                                    width: 150,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height: 10,
                                    width: 150,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 70,
                                width: 80,
                                color: Colors.white,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.white,
                                    height: 10,
                                    width: 120,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height: 10,
                                    width: 150,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height: 10,
                                    width: 150,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Could nt load',
                            style: TextStyle(
                                color: HexColor('#aabcd9'),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return Admin2();
                            }));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(HexColor('#aabcd9')),
                          elevation: MaterialStateProperty.all(0),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                      child: Text('Reload',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold))),
                )
              ],
            ),
          ),
        ));
  }
}
