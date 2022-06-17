import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jbs_app/admin/admin_profile.dart';
import 'package:jbs_app/admin/search_employee.dart';
import 'package:jbs_app/admin/statistics.dart';
import 'package:jbs_app/storage.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:marquee/marquee.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../api/access.dart';
import '../employee_screens/employee_welcome_1.dart';
import '../manager/home.dart';
import '../models/admin_issues_list.dart';
import '../models/contractor_count_model.dart';
import '../models/delivery_count_model.dart';
import '../models/visitor_count_model.dart';
import 'admin1.dart';
import 'admin_users.dart';
import 'navigation bar.dart';
import 'package:http/http.dart'  as http;

class Admin2 extends StatefulWidget {
  Admin2({Key? key, required  this.empID,
    required  this.location, required this.name}) :
        super(key: key);
  String empID;
  String location;
  String name;

  @override
  State<Admin2> createState() => _Admin2State();
}

class _Admin2State extends State<Admin2> {
  @override
  void initState(){
    super.initState();
    getIssuesList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          extendBody: true,
      bottomNavigationBar: Container(
        child: BottomAppBar(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.075,
          color: HexColor('#d8d8d9'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (BuildContext context) =>
                      Admin2(empID: widget.empID, location: widget.location, name: widget.name)));
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
                  print("stats");
                  access().deliveryTodayCount().then((value) async{
                    if(value["success"]){
                      DeliveryTodaysCount deliveryCount = await DeliveryTodaysCount.fromJson(value);
                      final deliCount = deliveryCount.data[0].count;
                      print(deliCount);
                      Storage.set_deliveryCount(deliCount.toString());
                    }
                  });

                  access().visitorTodayCount().then((value) async{
                    if(value["success"]){
                      VisitorTodaysCount visitorCount = await VisitorTodaysCount.fromJson(value);
                      final visitCount = visitorCount.visitorInsideToday[0].count;
                      final totalVisitCount = visitorCount.totalVisitorVisitedToday[0].count;
                      print("${visitCount}, ${totalVisitCount }");
                      Storage.set_visitorCount(visitCount.toString());
                      Storage.set_totalVisitorCount(totalVisitCount.toString());
                    }
                  });

                  access().contractorTodayCount().then((value) async{
                    if(value["success"]){
                      ContractorTodaysCount contractorCount = await ContractorTodaysCount.fromJson(value);
                      final contracCount = contractorCount.contractorInsideToday[0].count;
                      final totalContracCount = contractorCount.totalContractorVisitedToday[0].count;
                      print("${contracCount}, ${totalContracCount }");
                      Storage.set_contractorCount(contracCount.toString());
                      Storage.set_totalContractorCount(totalContracCount.toString());
                    }
                  });
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
                  child: Icon(
                    Icons.qr_code,
                    color: HexColor('#818081'),
                    size: 50,
                  )),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return searchEmployee();
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
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Appdrawer();
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
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hello,',
                        style: TextStyle(color: Colors.lightBlue, fontSize: 15),
                      ),
                      Row(

                        children: [
                          Text(
                            "${widget.name}",
                            style: TextStyle(
                                color: Colors.blue.shade900, fontSize: 30),
                          ),
                          IconButton(
                              onPressed: () {
                                showMaterialModalBottomSheet(
                                  context: context,
                                  builder: (context) => SingleChildScrollView(
                                    controller:
                                    ModalScrollController.of(context),
                                    child: Container(
                                        child: Column(
                                          children: [
                                            Divider(
                                              thickness: 3,
                                              color: Colors.blue.shade900,
                                              height: 1,
                                              endIndent: 120,
                                              indent: 120,
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                Navigator.pushReplacement(
                                                    (context as Element),
                                                    MaterialPageRoute(
                                                        builder: (BuildContext context) => Home2(empId: Storage.get_adminEmpID().toString(),
                                                          location: Storage.get_location().toString(),
                                                          name: Storage.get_name().toString(),)));
                                              },
                                              child: ListTile(
                                                leading: Image(
                                                    image: AssetImage(
                                                        'lib/images/face.png')),
                                                title: Text('Manager',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.blue.shade900)),
                                              ),),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                Navigator.pushReplacement(
                                                    (context as Element),
                                                    MaterialPageRoute(
                                                        builder: (BuildContext context) => Admin1()));
                                              },
                                              child: ListTile(
                                                leading: Image(
                                                    image: AssetImage(
                                                        'lib/images/face.png')),
                                                title: Text('Admin',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.normal,
                                                        color: Colors.blue.shade900)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            GestureDetector(
                                                onTap: (){
                                                  Navigator.pushReplacement(
                                                      (context as Element),
                                                      MaterialPageRoute(
                                                          builder: (BuildContext context) => employeeWelcome()));
                                                },
                                                child: ListTile(
                                                  leading: Image(
                                                      image: AssetImage(
                                                          'lib/images/face.png')),
                                                  title: Text('Employee',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.normal,
                                                          color: Colors.blue.shade900)),
                                                )),
                                            SizedBox(
                                              height: 25,
                                            )
                                          ],
                                        )),
                                  ),
                                );
                              },
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.lightBlue))
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              adminProfile()));
                          },
                          child: Image(image: AssetImage('lib/images/face.png'), height: 50)),
                      Text(
                        'Admin',
                        style: TextStyle(color: Colors.amber, fontSize: 10),
                      ),
                      Text(
                        '${widget.location}',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Text(
                        'Emp Id: ${widget.empID}',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Marquee(
                text: 'sample text ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 60.0,
                pauseAfterRound: Duration.zero,
                startPadding: 10.0,
                accelerationDuration: Duration.zero,
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration.zero,
                decelerationCurve: Curves.easeOut,
              ),
            ),



            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [new BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 5.0,
                          ),]
                      ),
                      child: Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Reports from front desk',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                      image: AssetImage('lib/images/bors2.png'),
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
                                            backgroundColor: HexColor('#ababab'),
                                            radius: 5,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Guests inside: ${Storage.get_visitorCount().toString()}",
                                            style: TextStyle(
                                                backgroundColor: HexColor('#dadbda')
                                            ),)
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: HexColor('#ababab'),
                                            radius: 5,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Contractors inside: ${Storage.get_contractorCount().toString()}",
                                            style: TextStyle(
                                                backgroundColor: HexColor('#dadbda')
                                            ),)
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: HexColor('#ababab'),
                                            radius: 5,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Deliveries accepted: ${Storage.get_deliveryCount().toString()}",
                                          style: TextStyle(
                                            backgroundColor: HexColor('#dadbda')
                                          ),)
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(child: Divider()),
                      Text(
                        "Service Request's",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [new BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                blurRadius: 5.0,
                              ),]
                          ),

                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children:[
                                    IconButton(onPressed: (){},
                                        icon: Icon(Icons.arrow_circle_right, size: 30,
                                          color: Color(0xff2980B9),))
                                  ],
                                ),
                                FutureBuilder(
                                  builder: (context, snapshot) {
                                    if (snapshot != null){
                                      AdminIssuesList issue = snapshot.data as AdminIssuesList ;
                                      if (issue == null){
                                        return Center(child: Text("No requests"),);
                                      }
                                      else{
                                        return ListView.separated(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          separatorBuilder: (BuildContext context, int index) {
                                            return Divider(
                                            );
                                          },
                                          itemCount: issue.data.length,
                                          itemBuilder: (context, index){
                                            return Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Container(
                                                      height: 70,
                                                      width: 80,
                                                      child: Image(
                                                          height: 90,
                                                          width: 90,
                                                          image:
                                                          AssetImage('lib/images/face3.png')),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(issue.data[index].issueLevel == 1? "Low":
                                                        issue.data[index].issueLevel == 2? "High":
                                                        "Very high", style: TextStyle(
                                                          backgroundColor: Colors.grey.shade300
                                                        ),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(issue.data[index].name, style: TextStyle(
                                                            backgroundColor: Colors.grey.shade300
                                                        ),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(issue.data[index].phoneNumber, style: TextStyle(
                                                            backgroundColor: Colors.grey.shade300
                                                        ),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(issue.data[index].email, style: TextStyle(
                                                            backgroundColor: Colors.grey.shade300
                                                        ),
                                                        ),

                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Align(
                                                      alignment: Alignment.bottomRight,
                                                      child: Container(
                                                        height: 40,
                                                        child: TextButton(
                                                          onPressed: () {},
                                                          child: Text('respond',
                                                              style: TextStyle(
                                                                  color: Color(0xff005993), fontSize: 15)),
                                                          style: ButtonStyle(
                                                              shape: MaterialStateProperty.all<
                                                                  RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(5.0),
                                                                  )),
                                                              backgroundColor:
                                                              MaterialStateProperty.all(
                                                                  Colors.transparent)),
                                                        ),
                                                      )),
                                                ),
                                              ],
                                            );
                                          },

                                        );
                                      }}
                                    else{
                                      return Center(
                                        child: Text("No employee Below Admin post in this organization"),
                                      );
                                    }
                                  },

                                  future: getIssuesList(),
                                ),

                              ],
                            ),
                          ),

                        ),

                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade400)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("View Guests", style: TextStyle(
                                color: Color(0xff005993),
                                fontSize: 16
                              ),),

                              Row(
                                children: [
                                  VerticalDividerWidget(),
                                  IconButton(onPressed: (){},
                                      icon: Icon(Icons.arrow_forward_ios, size: 20,
                                        color: Color(0xff005993),))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    ));
  }

}

class VerticalDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey.shade400,
    );
  }
}

Future getIssuesList() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};


  var url = Uri.parse('https://stg.visitormanager.net/v1/get/service/request?location_Id=000000${Storage.get_locationID()}');

  final response = await http.get(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return AdminIssuesList.fromJson(jsonDecode(response.body));
  } else {
    print("Failed to fetch data");
  }

}
