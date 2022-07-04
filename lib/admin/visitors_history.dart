import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:jbs_app/admin/statistics.dart';
import 'package:jbs_app/admin/usersList.dart';
import 'package:jbs_app/api/access.dart';
import 'package:jbs_app/storage.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import '../models/VisitorData.dart';
import 'admin2.dart';
import 'admin_profile.dart';
import 'admin_scanQr.dart';

class visitorHistory extends StatefulWidget {
  const visitorHistory({Key? key}) : super(key: key);

  @override
  State<visitorHistory> createState() => _visitorHistoryState();
}

class _visitorHistoryState extends State<visitorHistory> {
  TextEditingController dateinput1 = TextEditingController();
  TextEditingController dateinput2 = TextEditingController();
  VisitorData? visitData;

  String startDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String endDate = DateFormat("yyyy-MM-dd").format(DateTime.now());


  bool loading = true;
  @override
  void initState(){
    super.initState();
    loading = false;
    dateinput1.text = DateFormat("dd MMM").format(DateTime.now()).toString();
    print(dateinput1.text);
    dateinput2.text = DateFormat("dd MMM").format(DateTime.now()).toString();
    print(dateinput2.text);

    if(startDate.isNotEmpty && endDate.isNotEmpty) {
      access().visitorData(startDate,
          endDate).then((value) {
            setState((){
              visitData = VisitorData.fromJson(value);
            });

        loading = false;
      });
    } else{
      Fluttertoast.showToast(
          msg: "${"Fields cannot be empty"}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(left:3.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: const[
                        Icon(Icons.arrow_back_ios,
                            color: Color(0xff005993), size: 12),
                        Text("back",
                          style: TextStyle(
                            fontSize: 12,
                              color: Color(0xff005993)
                          ),)
                      ],
                    ),
                  ),
                );
              }
          ),
          title: const Text(
            'Visitor History',
            style: TextStyle(color: Color(0xff005993)),
          ),
          centerTitle: true,
        ),
          bottomNavigationBar: Container(
            color: Colors.white,
            child: BottomAppBar(
                shape: CircularNotchedRectangle(),
                color: Colors.transparent,
                elevation: 0,
                child: SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (BuildContext context) =>
                              Admin2(location: Storage.get_location().toString(),
                                empID: Storage.get_adminEmpID().toString(),)));
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
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return UsersLists();
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

                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffE8F9FF)
                        ),
                        child: IconButton(
                          //padding: EdgeInsets.only(left:10),
                            onPressed: (){
                              Navigator
                                  .of(context)
                                  .push(MaterialPageRoute(builder:
                                  (BuildContext context) => adminScanQr()));
                            },
                            icon: Icon(CupertinoIcons.qrcode_viewfinder,  size: 40,
                                color: Color(0xff717171))),
                      ),

                      TextButton(
                        onPressed: () {
                          print("stats");
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return stats();
                          }));
                        },
                        child: Column(
                          children: [
                            LineIcon(
                              LineIcons.barChart,
                              size: 30,
                              color: HexColor('#005993'),
                            ),
                            Text(
                              'Stats',
                              style: TextStyle(color: HexColor('#005993'), fontSize: 15),
                            )
                          ],
                        ),
                      ),


                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return adminProfile();
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
          ),

    body: loading? Center(child: CircularProgressIndicator(),):
    SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [ BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 5.0,
                    ),]

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: ()async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context, initialDate: DateTime.now(),
                                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101)
                                  );

                                  if(pickedDate != null ){
                                    print("picked date: $pickedDate");
                                    String formattedDate = DateFormat('dd MMM').format(pickedDate);
                                    print(formattedDate);
                                    setState(() {
                                      startDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                      print(startDate);
                                      dateinput1.text = formattedDate; //set output date to TextField value.
                                    });

                                  }else{
                                    print("Date is not selected");
                                  }

                                  access().visitorData(startDate,
                                      endDate).then((value) {
                                    setState((){
                                      visitData = VisitorData.fromJson(value);
                                    });

                                    loading = false;
                                  });

                                  if(DateTime.parse(startDate).isAfter(DateTime.parse(endDate))){
                                    Fluttertoast.showToast(
                                        msg: "${"Start date cannot be greater than end date"}",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    print("start date cannot be more than end dzte");
                                  }

                                  // if(DateTime.parse(Storage.get_startDateVisitor().toString()).
                                  // isAfter( DateTime.parse(Storage.get_endDateVisitor().toString())) == false){
                                  //   print(DateTime.parse(Storage.get_startDateVisitor().toString()).isAfter(DateTime.parse(Storage.get_endDateVisitor().toString())));
                                  //
                                  //   Fluttertoast.showToast(
                                  //       msg: "${"Start date cannot be greater than end date"}",
                                  //       toastLength: Toast.LENGTH_SHORT,
                                  //       gravity: ToastGravity.BOTTOM,
                                  //       timeInSecForIosWeb: 1,
                                  //       backgroundColor: Colors.red,
                                  //       textColor: Colors.white,
                                  //       fontSize: 16.0);
                                  // }
                                },
                                child: Icon(Icons.calendar_month, color: Color(0xff2980B9),)),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () async{
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context, initialDate: DateTime.now(),
                                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101)
                                    );

                                    if(pickedDate != null ){
                                      print(pickedDate);
                                      String formattedDate = DateFormat('dd MMM').format(pickedDate);
                                      print(formattedDate);
                                      setState(() {
                                        // final startDateVisitor = DateFormat('yyyy-MM-dd').format(pickedDate);
                                        // print(startDateVisitor);
                                        // Storage.set_startDateVisitor(startDateVisitor);
                                        startDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                        print(startDate);
                                        dateinput1.text = formattedDate;//set output date to TextField value.

                                      });

                                    }else{
                                      print("Date is not selected");
                                    }

                                    access().visitorData(startDate,
                                        endDate).then((value) {
                                      setState((){
                                        visitData = VisitorData.fromJson(value);
                                      });

                                      loading = false;
                                    });


                                    if(DateTime.parse(startDate).isAfter(DateTime.parse(endDate))){
                                      Fluttertoast.showToast(
                                          msg: "${"Start date cannot be greater than end date"}",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      print("start date cannot be more than end dzte");
                                    }

                                    // if(DateTime.parse(Storage.get_startDateVisitor().toString()).
                                    // isAfter( DateTime.parse(Storage.get_endDateVisitor().toString())) == false){
                                    //   print(DateTime.parse(Storage.get_startDateVisitor().toString()).
                                    //   isAfter(DateTime.parse(Storage.get_endDateVisitor().toString())));
                                    //
                                    //   Fluttertoast.showToast(
                                    //       msg: "${"Start date cannot be greater than end date"}",
                                    //       toastLength: Toast.LENGTH_SHORT,
                                    //       gravity: ToastGravity.BOTTOM,
                                    //       timeInSecForIosWeb: 1,
                                    //       backgroundColor: Colors.red,
                                    //       textColor: Colors.white,
                                    //       fontSize: 16.0);
                                    // }
                                  },
                                  child: Text(dateinput1.text, style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.055,
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),
                                SizedBox(height: 6,),
                                // Row(
                                //   children: [
                                //     Text("03:00",style: TextStyle(
                                //       fontSize: MediaQuery.of(context).size.width*0.055,
                                //       fontWeight: FontWeight.bold,
                                //     ), ),
                                //     Text(" am",style: TextStyle(
                                //       fontSize: MediaQuery.of(context).size.width*0.04,
                                //       fontWeight: FontWeight.bold,
                                //     ), ),
                                //   ],
                                // ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),

                    Text("to", style: TextStyle(
                        color: Color(0xff2980B9),
                        fontSize: 18
                    ),),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap:()async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context, initialDate: DateTime.now(),
                                    firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101)
                                );

                                if(pickedDate != null ){
                                  print(pickedDate);
                                  String formattedDate = DateFormat('dd MMM').format(pickedDate);
                                  print(formattedDate);
                                  setState(() {
                                    endDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                    print(endDate);
                                    dateinput2.text = formattedDate; //set output date to TextField value.
                                  });

                                }else{
                                  print("Date is not selected");
                                }

                                access().visitorData(startDate,
                                    endDate).then((value) {
                                  setState((){
                                    visitData = VisitorData.fromJson(value);
                                  });

                                  loading = false;
                                });
                                if(DateTime.parse(startDate).isAfter(DateTime.parse(endDate))){
                                  Fluttertoast.showToast(
                                      msg: "${"Start date cannot be greater than end date"}",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  print("start date cannot be more than end dzte");
                                }

                                // if(DateTime.parse(Storage.get_startDateVisitor().toString()).
                                // isAfter( DateTime.parse(Storage.get_endDateVisitor().toString()))==false){
                                //   print(DateTime.parse(Storage.get_startDateVisitor().toString()).isAfter(DateTime.parse(Storage.get_endDateVisitor().toString())));
                                //
                                //   Fluttertoast.showToast(
                                //       msg: "${"Start date cannot be greater than end date"}",
                                //       toastLength: Toast.LENGTH_SHORT,
                                //       gravity: ToastGravity.BOTTOM,
                                //       timeInSecForIosWeb: 1,
                                //       backgroundColor: Colors.red,
                                //       textColor: Colors.white,
                                //       fontSize: 16.0);
                                // }
                              },
                                child: Icon(Icons.calendar_month, color: Color(0xff2980B9),)),

                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: ()async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context, initialDate: DateTime.now(),
                                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101)
                                    );

                                    if(pickedDate != null ){
                                      print(pickedDate);
                                      String formattedDate = DateFormat('dd MMM').format(pickedDate);
                                      print(formattedDate);
                                      setState(() {
                                        // final endDateVisitor = DateFormat('yyyy-MM-dd').format(pickedDate);
                                        // print(endDateVisitor);
                                        // Storage.set_endDateVisitor(endDateVisitor);
                                        endDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                        print(endDate);
                                        dateinput2.text = formattedDate; //set output date to TextField value.
                                      });

                                    }else{
                                      print("Date is not selected");
                                    }

                                    access().visitorData(startDate,
                                        endDate).then((value) {
                                      setState((){
                                        visitData = VisitorData.fromJson(value);
                                      });

                                      loading = false;
                                    });

                                    if(DateTime.parse(startDate).isAfter(DateTime.parse(endDate))){
                                      Fluttertoast.showToast(
                                                msg: "${"Start date cannot be greater than end date"}",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                      print("start date cannot be more than end dzte");
                                    }

                                    // if(DateTime.parse(Storage.get_startDateVisitor().toString()).
                                    // isAtSameMomentAs( DateTime.parse(Storage.get_endDateVisitor().toString())) == false){
                                    //   print(DateTime.parse(Storage.get_startDateVisitor().toString()).isAfter(DateTime.parse(Storage.get_endDateVisitor().toString())));
                                    //
                                    //   Fluttertoast.showToast(
                                    //       msg: "${"Start date cannot be greater than end date"}",
                                    //       toastLength: Toast.LENGTH_SHORT,
                                    //       gravity: ToastGravity.BOTTOM,
                                    //       timeInSecForIosWeb: 1,
                                    //       backgroundColor: Colors.red,
                                    //       textColor: Colors.white,
                                    //       fontSize: 16.0);
                                    // }
                                  },
                                  child: Text(dateinput2.text, style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.055,
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),

                                SizedBox(height: 6,),
                                // Row(
                                //   children: [
                                //     Text("03:00",style: TextStyle(
                                //       fontSize: MediaQuery.of(context).size.width*0.055,
                                //       fontWeight: FontWeight.bold,
                                //     ), ),
                                //     Text(" pm",style: TextStyle(
                                //       fontSize: MediaQuery.of(context).size.width*0.04,
                                //       fontWeight: FontWeight.bold,
                                //     ), ),
                                //   ],
                                // ),
                              ],
                            )
                          ],
                        ),


                      ],
                    ),

                  ],
                ),
                ),

              SizedBox(height: 20,),



        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [ BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 5.0,
              ),]
          ),
          child: visitData == null? Center(child: Text("No visitors, deliveries or "
              "contractors present in this date",
            textAlign: TextAlign.center,),): (DateTime.parse(startDate).isAfter(DateTime.parse(endDate)))?
              Center(child: Text("start date cannot be greater than end date"),):
          Table(
            children: [
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Text('Date',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                    color: Color(0xff092F52)
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Text('Type',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        color: Color(0xff092F52)
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Text('Company',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        color: Color(0xff092F52)
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                  child: Text('Time',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        color: Color(0xff092F52)
                    ),),
                ),
              ]),

              for(int i=0; i<visitData!.graphData.length; i++)
              TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(DateFormat("dd MMM").format(DateTime.parse(visitData!.graphData[i].date.toString())),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(visitData!.graphData[i].visitType.substring(0,
                        visitData!.graphData[i].visitType.indexOf("-")).trim(),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text('${visitData!.graphData[i].visitType.substring(
                        visitData!.graphData[i].visitType.indexOf("-")+1).trim()}',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text('${visitData!.graphData[i].time} - \n${visitData!.graphData[i].checkOutTime}',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02
                      ),),
                  ),


              ])
            ],
          ),

        )
            ],
          ),
        ),
      ),
    )
      ),

    );
  }
}
