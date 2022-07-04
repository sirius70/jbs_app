import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import '../api/access.dart';
import '../models/contractors_report_model.dart';
import '../models/guests_report_model.dart';
import '../storage.dart';

class todayGuestsReport extends StatefulWidget {
  const todayGuestsReport({Key? key}) : super(key: key);

  @override
  State<todayGuestsReport> createState() => _todayGuestsReportState();
}

class _todayGuestsReportState extends State<todayGuestsReport> {
  GuestsInsideReport? insideGuestReport;
  List insideGuestReportNull = [];
  var inside;
  bool loading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState(){
    super.initState();
    loading = false;
    access().getGuestsReportList().then((value) async{
      if(value["success"]){
        print("deli count: $value");
        setState(() {
          insideGuestReport =  GuestsInsideReport.fromJson(value);
        });
        loading = false;
      }else{
        setState(() {
          insideGuestReportNull =  value;

        });
        loading = false;
        //print(insideGuestReportNull["data"]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text("Todays Visitors reports"),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: loading? Center(child: CircularProgressIndicator(),):
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),

                insideGuestReport==null?
                   const Center(child: Text("No visitors today in your organization"),):
                insideGuestReport==null?
                   Center(child: const Text("No visitors today in your organization")):
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: insideGuestReport!.visitorReportsToday.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow:  [ BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              blurRadius: 5.0,
                            ),]
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                     const CircleAvatar(
                                          backgroundImage: AssetImage("lib/images/face3.png")
                                        // backgroundImage: NetworkImage(guestReport.visitorReportsToday![index].vISITORPHOTO.toString()),
                                      ),
                                      Text(insideGuestReport!.visitorReportsToday[index].visitorName.toString(),
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width*0.035
                                      ),),
                                      SizedBox(height: 4,),
                                      Text(insideGuestReport!.visitorReportsToday[index].visitorCompanyName.toString(),
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width*0.035
                                        ),),
                                      SizedBox(height: 4,),
                                      Text(insideGuestReport!.visitorReportsToday[index].visitorPhoneNumber.toString(),
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width*0.035
                                        ),),
                                      SizedBox(height: 4,),
                                      Text(insideGuestReport!.visitorReportsToday[index].visitorEmail.toString(),
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width*0.035
                                        ),),

                                    ],
                                  ),
                                ),
                                insideGuestReport!.visitorReportsToday[index].checkOut == 1?
                                Column(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.width * 0.065,
                                      width: MediaQuery.of(context).size.width * 0.065,
                                      decoration: BoxDecoration(
                                        color: Colors.green, shape: BoxShape.circle
                                    ),),
                                    SizedBox(height: 4,),
                                    Text("Checked out")
                                  ],
                                ):Column(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.width * 0.065,
                                      width: MediaQuery.of(context).size.width * 0.065,
                                      decoration: BoxDecoration(
                                        color: Colors.red, shape: BoxShape.circle
                                    ),),
                                    SizedBox(height: 4,),
                                    Text("Still inside")
                                  ],
                                )

                              ],
                            ),

                            Divider(thickness: 2,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("entry time: ${insideGuestReport!.visitorReportsToday[index].visitorEntryTime}",
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.035
                                  ),),
                                Text("checkout time: ${insideGuestReport!.visitorReportsToday[index].checkOutTime}",
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.035
                                  ),)
                              ],
                            ),
                            SizedBox(height: 15,),

                            Row(

                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("emp name: ${insideGuestReport!.visitorReportsToday[index].employeeName}",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width*0.035
                                      ),),
                                    Text("emp email: ${insideGuestReport!.visitorReportsToday[index].employeeEmail}",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width*0.035
                                      ),),
                                    Text("emp phNo: ${insideGuestReport!.visitorReportsToday[index].employeePhoneNumber}",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width*0.035
                                      ),),
                                    Text("nda sign: ${insideGuestReport!.visitorReportsToday[index].visitorNdaSign==0? "not signed":"signed"}",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width*0.035
                                      ),)
                                  ],
                                )
                              ],
                            )



                            // inside
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),

              ],
            ),
          )
      ),
    );
  }

}


Future getGuestsReportList() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};


  var url = Uri.parse('https://stg.visitormanager.net/v1/reportsTodayGuests?location_Id=${Storage.get_locationID()}');

  final response = await http.get(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return GuestsInsideReport.fromJson(jsonDecode(response.body));
  } else {
    print("Failed to fetch data");
  }

}