import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbs_app/employee_screens/employee_welcome_1.dart';
import 'package:jbs_app/employee_screens/guest_register_2.dart';
import 'package:jbs_app/employee_screens/scan_qr.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../my_attendance.dart';
import '../profile_page_3.dart';


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    employeeWelcome(),
    guestRegister(),
    scanQr(),
    myAttendance(),
    employeeProfile()
  ];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home, size: 30,),
                label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_crop_circle_fill_badge_plus,
               size: 30,),
              label: 'Add guest',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.qrcode_viewfinder,  size: 40,),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_bar, size: 30,),
              label: 'Attendance',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_rounded, size: 30,),
              label: 'Menu',
            ),

          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
         selectedIconTheme: IconThemeData(color: Color(0xff0093CB)),
         selectedItemColor: Color(0xff0093CB),
          onTap: _onItemTapped,
        ),
    );
  }
}


///bottom2


class bottomNavigation extends StatelessWidget {
  const bottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.transparent,
          elevation: 0,
          child: SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(
                    //padding: EdgeInsets.only(left:10),
                      onPressed: (){

                      },
                      icon: Icon(CupertinoIcons.home, size: 30,
                        color: Color(0xff0093CB))),
                  IconButton(
                    //padding: EdgeInsets.only(left:10),
                      onPressed: (){

                      },
                      icon: Icon(CupertinoIcons.person_crop_circle_fill_badge_plus,
                          size: 30,
                          color: Color(0xff717171))),
                  IconButton(
                    //padding: EdgeInsets.only(left:10),
                      onPressed: (){

                      },
                      icon: Icon(CupertinoIcons.qrcode_viewfinder,  size: 40,
                          color: Color(0xff717171))),
                  IconButton(
                    //padding: EdgeInsets.only(left:10),
                      onPressed: (){

                      },
                      icon: Icon(CupertinoIcons.home, size: 30,
                          color: Color(0xff717171))),

                  IconButton(
                    //padding: EdgeInsets.only(left:10),
                      onPressed: (){

                      },
                      icon: Icon(CupertinoIcons.home, size: 30,
                          color: Color(0xff717171))),
                ],
              ),
            ),
          ),
        )
    );
  }

}


