import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart';

import '../../storage.dart';
import '../my_regulaization_request.dart';

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

// List sundays = [
//   DateTime(2022, 6, 5),
//   DateTime(2022, 6, 12),
//   DateTime(2022, 6, 19),
// ];

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
  void initState() {
    super.initState();
    setState((){
      absent.clear();
      present.clear();
    });

  }

  @override
  Widget build(BuildContext context) {
    // for (int i = 0; i < presentDates.length; i++) {
    //
    //   _markedDateMap.add(
    //     presentDates[i],
    //     Event(
    //       date:  presentDates[i],
    //       title: 'Event 5',
    //       icon: _presentIcon(
    //         presentDates[i].day.toString(),
    //       ),
    //     ),
    //   );
    // }

    // for (int i = 0; i < absentDates.length; i++) {
    //
    //   _markedDateMap.add(
    //     absentDates[i],
    //     Event(
    //       date:  absentDates[i],
    //       title: 'Event 5',
    //       icon: _absentIcon(
    //         absentDates[i].day.toString(),
    //       ),
    //     ),
    //   );
    // }

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

    for(int i=0; i<absentLog.length; i++){
      final abs = DateFormat('yyyy-MM-dd').format(DateTime.parse(absentLog[i]["DateTime"]));
      absent.add(abs);
    }

    for(int i=0; i<presentLog.length; i++){
      final abs = DateFormat('yyyy-MM-dd').format(DateTime.parse(presentLog[i]["DateTime"]));
      present.add(abs);
    }

    // access().empAbsPres().then((value) async {
    //   if (value["success"]){
    //     EmpAbsPresentRes absPres = await EmpAbsPresentRes.fromJson(value);
    //     final presLen = absPres.data.presentDates.length;
    //     print(presLen);
    //     for (int i = 0; i < presLen; i++) {
    //       final year = DateTime.parse(absPres.data.presentDates[i].DateTime).year;
    //       final month = DateTime.parse(absPres.data.presentDates[i].DateTime).month;
    //       final day = DateTime.parse(absPres.data.presentDates[i].DateTime).day;
    //
    //
    //       _markedDateMap.add(
    //         DateTime(year, month, day),
    //         Event(
    //           date:  DateTime(year, month, day),
    //           title: 'Event 5',
    //           icon: _presentIcon(
    //             day.toString(),
    //           ),
    //         ),
    //       );
    //     }
    //   }
    // });

    // access().empAbsPres().then((value) async {
    //   if (value["success"]){
    //     EmpAbsPresentRes absPres = await EmpAbsPresentRes.fromJson(value);
    //     final absLen = absPres.data.absentDates.length;
    //     print(absLen);
    //     for (int i = 0; i < absLen; i++) {
    //       final year = DateTime.parse(absPres.data.absentDates[i].DateTime).year;
    //       final month = DateTime.parse(absPres.data.absentDates[i].DateTime).month;
    //       final day = DateTime.parse(absPres.data.absentDates[i].DateTime).day;
    //
    //       _markedDateMap.add(
    //         DateTime(year, month, day),
    //         Event(
    //           date:  DateTime(year, month, day),
    //           title: 'Event 5',
    //           icon: _absentIcon(
    //             day.toString(),
    //           ),
    //         ),
    //       );
    //     }
    //   }
    // });

    cHeight = MediaQuery.of(context).size.height;

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      selectedDayTextStyle: const TextStyle(
          color: Colors.green, fontSize: 20
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
        //Text("${DateFormat.MMMM().format(_currentDate2).toString()} "),
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
                          children:  [
                            Text("${DateFormat.d().format(_currentDate2)} ${DateFormat.MMMM().format(_currentDate2)}, "
                                "${_currentDate2.day == DateTime.now().day? "Today": ""}",
                              style: const TextStyle(
                                  color: Color(0xff288EE3),
                                  fontSize: 22
                              ),),
    if(absent.contains(DateFormat("yyyy-MM-dd").format(_currentDate2)))...[
      Text("ABSENT",
        style: TextStyle(color: Color(0xffFF2E00),
            fontSize: 22
        ),)
    ] else if(present.contains(DateFormat("yyyy-MM-dd").format(_currentDate2)))...[
      Text("PRESENT",
        style: TextStyle(color: Color(0xff0EAF00),
            fontSize: 22
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


// Future empAbsPresent() async {
//
//   var headers = {
//     'Content-Type': 'application/json',
//     'Authorization': 'Bearer ${Storage.get_accessToken()}',
//   };
//
//   var url = Uri.parse('https://stg.visitormanager.net/v1/employee/attendance/date');
//   var response = await http.get(url, headers: headers);
//
//   if (response.statusCode == 200 || response.statusCode == 201) {
//     final absPresList=jsonDecode(response.body)["data"];
//
//     final  presentList=jsonDecode(response.body)["data"]["Present_Dates"];
//     print("PresentList: $presentList") ;
//
//     final presLen = presentList.length;
//     print("presLen: ${presLen}");
//
//     for (int i = 0; i < presLen; i++) {
//       final year = DateTime
//           .parse(presentList[i]["DateTime"])
//           .year;
//       print("years: $year");
//       final month = DateTime
//           .parse(presentList[i]["DateTime"])
//           .month;
//       print("months: $month");
//
//       final day = DateTime
//           .parse(presentList[i]["DateTime"])
//           .day;
//       print("days: $day");
//
//       presentDates.add(
//         DateTime(year, month, day),
//       );
//     }
//     print("print present days: ${presentDates}");
//
// ///absent dates
//     final  absentList=jsonDecode(response.body)["data"]["Absent_Dates"];
//     print("AbsentList: $presentList") ;
//     final absLen = absentList.length;
//     print("absLen: ${absLen}");
//
//     for (int i = 0; i < absLen; i++) {
//       final year = DateTime
//           .parse(absentList[i]["DateTime"])
//           .year;
//       print("years: $year");
//       final month = DateTime
//           .parse(absentList[i]["DateTime"])
//           .month;
//       print("months: $month");
//
//       final day = DateTime
//           .parse(absentList[i]["DateTime"])
//           .day;
//       print("days: $day");
//
//       absentDates.add(
//        DateTime(year, month, day),
//       );
//     }
//     print("print absent days: ${absentDates}");
//
//     return presentList.map(((e)=>PresentDates.fromJson(e))).toList();
//
//   } else {
//     throw Exception('Failed to load album');
//   }
//
// }
