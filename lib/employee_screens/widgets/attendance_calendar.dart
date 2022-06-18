import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart'  as http;
import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart';
import 'package:jbs_app/api/access.dart';
import 'package:jiffy/jiffy.dart';

import '../../models/emp_abs_pres_model.dart';
import '../../storage.dart';

class CalendarPage2 extends StatefulWidget {
  @override
  _CalendarPage2State createState() => new _CalendarPage2State();
}


List presentDates = [
  DateTime(2022,6,3),
  DateTime(2022, 6, 4),
  DateTime(2022, 6, 6),
  DateTime(2022, 6, 7),
  DateTime(2022, 6, 8),
  DateTime(2022, 6, 9),
  DateTime(2022, 6, 10),
  DateTime(2022, 6, 11),
  DateTime(2022, 6, 15),
  DateTime(2022, 6, 16),
  DateTime(2022, 6, 17),
  DateTime(2022, 6, 18),
];
List absentDates = [
  DateTime(2022, 6, 2),
  DateTime(2022, 6, 6),
  DateTime(2022, 6, 7),
];

List sundays = [
  DateTime(2022, 6, 5),
  DateTime(2022, 6, 12),
  DateTime(2022, 6, 19),
];

class _CalendarPage2State extends State<CalendarPage2> {
  DateTime _currentDate2 = DateTime.now();
  static Widget _presentIcon(String day) => CircleAvatar(
    backgroundColor: Colors.green,
    child: Text(
      day,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
  static Widget _absentIcon(String day) => CircleAvatar(
    backgroundColor: Color(0xffF06754),
    child: Text(
      day,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  static Widget _sundaysIcon(String day) => CircleAvatar(
    backgroundColor: Color(0xff979797),
    child: Text(
      day,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  CalendarCarousel? _calendarCarouselNoHeader;

  double? cHeight;

  @override
  void initState() { //set the initial value of text field
    super.initState();
    access().empAbsPres();
  }

  @override
  Widget build(BuildContext context) {
    print(DateTime.now().month);
    access().empAbsPres().then((value) async {
      if (value["success"]){
        EmpAbsPresentRes absPres = await EmpAbsPresentRes.fromJson(value);
        final presLen = absPres.data.presentDates.length;
        print(presLen);
        for (int i = 0; i < presLen; i++) {
          final year = DateTime.parse(absPres.data.presentDates[i].DateTime).year;
          final month = DateTime.parse(absPres.data.presentDates[i].DateTime).month;
          final day = DateTime.parse(absPres.data.presentDates[i].DateTime).day;


          _markedDateMap.add(
            DateTime(year, month, day),
            Event(
              date:  DateTime(year, month, day),
              title: 'Event 5',
              icon: _presentIcon(
                day.toString(),
              ),
            ),
          );
        }
      }
    });

    access().empAbsPres().then((value) async {
      if (value["success"]){
        EmpAbsPresentRes absPres = await EmpAbsPresentRes.fromJson(value);
        final absLen = absPres.data.absentDates.length;
        print(absLen);
        for (int i = 0; i < absLen; i++) {
          final year = DateTime.parse(absPres.data.absentDates[i].DateTime).year;
          final month = DateTime.parse(absPres.data.absentDates[i].DateTime).month;
          final day = DateTime.parse(absPres.data.absentDates[i].DateTime).day;

          _markedDateMap.add(
            DateTime(year, month, day),
            Event(
              date:  DateTime(year, month, day),
              title: 'Event 5',
              icon: _absentIcon(
                day.toString(),
              ),
            ),
          );
        }
      }
    });

    cHeight = MediaQuery.of(context).size.height;

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (date, events){
        setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      iconColor: const Color(0xff1AA7EC),
        headerTextStyle: const TextStyle(color: Color(0xff005993),
          fontSize: 20, fontWeight: FontWeight.bold ),
      daysTextStyle: const TextStyle(color: Color(0xff666666), fontSize: 15),
      weekdayTextStyle: const TextStyle( fontSize: 16,
          color: Color(0xff333333)),
      height: cHeight! * 0.4,
      weekendTextStyle: const TextStyle(
        color: Colors.black,
      ),
      todayButtonColor: const Color(0xff59B2EC),
      markedDatesMap: _markedDateMap,
      selectedDayButtonColor: Colors.yellow,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal:
      null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

    return  Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: _calendarCarouselNoHeader!,
        ),
        const SizedBox(height: 10,),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children:const [
                        Text("09/16*",  style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff005993)
                        ),),
                        Text("Present",),],
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width*0.6,
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height:8,
                                width: 8,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff0EAF00)
                                ),
                              ),
                            const  Text(" Present",
                                style: TextStyle(
                                    color: Color(0xff005993)
                                ),)
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height:8,
                                width: 8,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffFF3821)
                                ),
                              ),
                              const Text(" Absent",
                                style: TextStyle(
                                    color: Color(0xff005993)
                                ),)],
                          ),
                          Row(
                            children: [
                              Container(
                                height:8,
                                width: 8,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff59B2EC)
                                ),
                              ),
                             const Text(" Today",
                                style: TextStyle(
                                    color: Color(0xff005993)
                                ),)],
                          )
                        ],
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 20,),
                Divider(),
                SizedBox(height: 20,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("19 October, Today",
                              style: TextStyle(
                                  color: Color(0xff288EE3),
                                  fontSize: 22
                              ),),
                            Text("ABSENT",
                              style: TextStyle(color: Color(0xffFF2E00),
                                  fontSize: 22
                              ),)
                          ],),
                        Container(
                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 30, right: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Color(0xff288EE3) )
                          ),
                          child: const Text("Regularize",  style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff005993)
                          ),),
                        )
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Check-in at 8:59 AM via QR",
                            style: TextStyle(fontSize: 15
                            ),),
                          SizedBox(height: 10,),
                          Text("Exit detected at 12:15PM",
                            style: TextStyle(
                                fontSize: 15
                            ),),
                          SizedBox(height: 10,),
                          Text("Entry book detected at 12:45PM",
                            style: TextStyle(
                                fontSize: 15),),
                          SizedBox(height: 10,),
                          Text("Check-out at 6:59 AM via ID",
                            style: TextStyle(
                                fontSize: 15),),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),

                  ],
                ),

                // ..._.map((event) => Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     height: MediaQuery.of(context).size.height/20,
                //     width: MediaQuery.of(context).size.width/2,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(30),
                //         color: Colors.white,
                //         border: Border.all(color: Colors.grey)
                //     ),
                //     child: Center(
                //         child: Text(event,
                //           style: TextStyle(color: Colors.blue,
                //               fontWeight: FontWeight.bold,fontSize: 16),)
                //     ),
                //   ),
                // )),
              ],)
        )]
    );
  }

  Widget markerRepresent(Color color, String data) {
    return  ListTile(
      leading:  CircleAvatar(
        backgroundColor: color,
        radius: cHeight! * 0.022,
      ),
      title:  Text(
        data,
      ),
    );
  }
}


Future empAbsPresent() async {

  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}',
  };

  var url = Uri.parse('https://stg.visitormanager.net/v1/employee/attendance/date');
  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    return EmpAbsPresentRes.fromJson(jsonDecode(response.body));

  } else {
    throw Exception('Failed to load album');
  }

}
