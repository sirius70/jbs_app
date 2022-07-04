import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart';

import '../../api/access.dart';
import '../../models/current_month_attendance.dart';
import '../../storage.dart';
import '../my_regulaization_request.dart';
import '../view_my_calendar.dart';

class CalendarPage2 extends StatefulWidget {
  @override
  _CalendarPage2State createState() => new _CalendarPage2State();
}


List presentDates = [];
List absentDates = [];

List absentLog=[];
List presentLog=[];

List absent = [];
List present = [];

class _CalendarPage2State extends State<CalendarPage2> {
  CurrentMonthAttendance? currMonth;

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

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  CalendarCarousel? _calendarCarouselNoHeader;

  double? cHeight;

  @override
  void initState() {
    super.initState();
    setState((){
      absent.clear();
      present.clear();
    });
    print("presesbxh: $presentDates");
    empAbsPresent();
    access().currMonthAttendance().then((value) {
      if(value["success"]){
        setState((){
          currMonth = CurrentMonthAttendance.fromJson(value);
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {


    if (absentLog!=null){
      for(int i=0;i<absentLog.length; i++){
        final year = DateTime.parse(absentLog[i]["DateTime"]).year;
        final month = DateTime.parse(absentLog[i]["DateTime"]).month;
        final day = DateTime.parse(absentLog[i]["DateTime"]).day;
        _markedDateMap.add(
            DateTime(year, month, day),
            Event(
              date: DateTime(year, month, day),
              id: absentLog[i]["id"],
              title: absentLog[i]["marked"].toString(),
              icon: _absentIcon(
                day.toString(),
              ),
            )
        );
      }
    }

    if(presentLog != null){
      for(int i=0;i<presentLog.length; i++){

        final year = DateTime.parse(presentLog[i]["DateTime"]).year;
        final month = DateTime.parse(presentLog[i]["DateTime"]).month;
        final day = DateTime.parse(presentLog[i]["DateTime"]).day;
        _markedDateMap.add(
            DateTime(year, month, day),
            Event(
              date: DateTime(year, month, day),
              id: presentLog[i]["id"],
              title: presentLog[i]["marked"].toString(),
              icon: _presentIcon(
                day.toString(),
              ),
            )
        );
      }
    }

    print("absenttttttLogsss: $absentLog");
    if(absentLog!=null){
      for(int i=0; i<absentLog.length; i++){
        final abs = DateFormat('yyyy-MM-dd').format(DateTime.parse(absentLog[i]["DateTime"]));
        setState((){
          absent.add(abs);
        });
      }
    }

    if(presentLog!=null){
      for(int i=0; i<presentLog.length; i++){
        final pres = DateFormat('yyyy-MM-dd').format(DateTime.parse(presentLog[i]["DateTime"]));
        present.add(pres);
      }
    }

    cHeight = MediaQuery.of(context).size.height;


    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      selectedDayTextStyle:  TextStyle(
          color: Colors.green, fontSize: MediaQuery.of(context).size.width*0.05
      ),
      onDayPressed: (date, events){
        setState(() => _currentDate2 = date);
        print(_currentDate2);
        events.forEach((event) {
          Storage.set_attendanceMark(event.title.toString());
          print("titles: ${Storage.get_attendanceMark()}");
          Storage.set_attendanceId(event.id.toString());
          print("ids: ${Storage.get_attendanceId()}");
        });

      },
      iconColor: const Color(0xff1AA7EC),
        headerTextStyle:  TextStyle(color: Color(0xff005993),
          fontSize: cHeight! * 0.04, fontWeight: FontWeight.bold ),
      daysTextStyle: const TextStyle(color: Color(0xff666666), fontSize: 15),
      weekdayTextStyle:  TextStyle( fontSize: MediaQuery.of(context).size.width * 0.04,
          color: Color(0xff333333)),
      height: cHeight! * 0.5,
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
            height: MediaQuery.of(context).size.height*0.6,
            width: MediaQuery.of(context).size.width,
            child: _calendarCarouselNoHeader!,
        ),
        const SizedBox(height: 10,),
        //Text("${DateFormat.MMMM().format(_currentDate2).toString()} "),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(currMonth==null?"0/16*":"${currMonth!.present[0].COUNT}/16*",  style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.06,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff005993)
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
                            children:  [
                              Text("${DateFormat.d().format(_currentDate2)} ${DateFormat.MMMM().format(_currentDate2)}, "
                                  "${_currentDate2.day == DateTime.now().day? "Today": ""}",
                                style:  TextStyle(
                                    color: const Color(0xff288EE3),
                                    fontSize: MediaQuery.of(context).size.width * 0.06
                                ),),
                              if(absent.contains(DateFormat("yyyy-MM-dd").format(_currentDate2)))...[
                                Text("ABSENT",
                                  style: TextStyle(color: Color(0xffFF2E00),
                                      fontSize: MediaQuery.of(context).size.width * 0.06
                                  ),)
                              ] else if(present.contains(DateFormat("yyyy-MM-dd").format(_currentDate2)))...[
                                Text("PRESENT",
                                  style: TextStyle(color: Color(0xff0EAF00),
                                      fontSize: MediaQuery.of(context).size.width * 0.06
                                  ),)
                              ]

                            ],),
                          GestureDetector(
                            onTap: (){
                              print("absenttt: $absentLog");
                              print("presentttt: $presentLog");

                             print("abs: $absent");
                              print("pres: $present");
                              setState((){
                                absent.clear();
                                present.clear();
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>regularizationRequest()));
                              });

                            },
                            child: Container(
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
                            ),
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
                ],),
            )
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


