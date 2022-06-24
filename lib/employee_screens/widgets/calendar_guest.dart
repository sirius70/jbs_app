import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:jbs_app/storage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  void disable() async{
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime(2100),
    );
  }

  @override
  Widget build(BuildContext context) {
        /// Example Calendar Carousel without header and custom prev & next button
    final _calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (date, events){
        setState(() => _currentDate2 = date);
        print(_currentDate2.month);
        print("Hemashree: ${DateFormat('yyyy-MM-dd').format(_currentDate2)}");
        final datess = DateFormat('yyyy-MM-dd').format(_currentDate2);
        Storage.set_date(datess);
        events.forEach((event) => print(event.title));

      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekFormat: false,
      height: MediaQuery.of(context).size.width *0.6,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
      CircleBorder(side: BorderSide(color: Colors.yellow)),
      markedDateCustomTextStyle: const TextStyle(
        fontSize: 22,
        color: Colors.blue,
      ),
      showHeader: false,
      todayTextStyle: const TextStyle(
        color: Color(0xff00A3FF), fontWeight: FontWeight.bold,
        fontSize: 20
      ),
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.transparent,
      weekdayTextStyle: const TextStyle(color: Color(0xff00417C),
          fontWeight: FontWeight.bold, fontSize: 15),
      weekendTextStyle: const TextStyle(color: Color(0xff092F52), fontSize: 18),
      selectedDayBorderColor: Colors.transparent,
      selectedDayButtonColor: Colors.transparent,
      selectedDayTextStyle: const TextStyle(
        color: Colors.green, fontSize: 20
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      daysTextStyle: const TextStyle(color: Color(0xff092F52), fontSize: 18),
      prevDaysTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
      inactiveDaysTextStyle: const TextStyle(
        color: Colors.teal,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios,color: Color(0xff2980B9),),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month - 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    ),
                    // Expanded(
                    //     child: ),
                    Row(
                      children: [
                        Text(
                          _currentMonth,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff092F52),
                            fontSize: 24.0,
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                           // _selectDateFromPicker()
                          },
                            icon: Icon(Icons.keyboard_arrow_down,), color: Color(0xff2980B9))
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Color(0xff2980B9),),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month + 2);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarouselNoHeader,
              ), //
            ],
          );
  }
}