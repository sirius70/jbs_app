import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart';

class CalendarPage2 extends StatefulWidget {
  @override
  _CalendarPage2State createState() => new _CalendarPage2State();
}


List<DateTime> presentDates = [
  DateTime(2022, 6, 3),
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
List<DateTime> absentDates = [
  DateTime(2022, 6, 2),
  DateTime(2022, 6, 13),
  DateTime(2022, 6, 14),
];

List<DateTime> sundays = [
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

  var len0 = presentDates.length;
  var len1 = absentDates.length;
  var len2 = sundays.length;
  double? cHeight;

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;
    for (int i = 0; i < len0; i++) {
      _markedDateMap.add(
        presentDates[i],
        new Event(
          date: presentDates[i],
          title: 'Event 5',
          icon: _presentIcon(
            presentDates[i].day.toString(),
          ),
        ),
      );
    }

    for (int i = 0; i < len1; i++) {
      _markedDateMap.add(
        absentDates[i],
        new Event(
          date: absentDates[i],
          title: 'Event 5',
          icon: _absentIcon(
            absentDates[i].day.toString(),
          ),
        ),
      );
    }

    for (int i = 0; i < len2; i++) {
      _markedDateMap.add(
        sundays[i],
        new Event(
          date: sundays[i],
          title: 'Event 5',
          icon: _sundaysIcon(
            sundays[i].day.toString(),
          ),
        ),
      );
    }

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      //dayButtonColor: Color(0xff333333),
     // headerText: DateFormat('MMMM yyyy').format(DateTime.now()).toString(),
      iconColor: Color(0xff1AA7EC),
        headerTextStyle: TextStyle(color: Color(0xff005993),
          fontSize: 20, fontWeight: FontWeight.bold ),
      daysTextStyle: TextStyle(color: Color(0xff666666), fontSize: 15),
      weekdayTextStyle: TextStyle( fontSize: 16,
          color: Color(0xff333333)),
      height: cHeight! * 0.4,
      weekendTextStyle: TextStyle(
        color: Colors.black,
      ),
      todayButtonColor: Color(0xff59B2EC),
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal:
      null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

    return  new Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        child: _calendarCarouselNoHeader!,

    );
  }

  Widget markerRepresent(Color color, String data) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        radius: cHeight! * 0.022,
      ),
      title: new Text(
        data,
      ),
    );
  }
}