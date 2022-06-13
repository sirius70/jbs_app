import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import '../models/contractors_report_model.dart';
import '../models/guests_report_model.dart';
import '../storage.dart';

class todayGuestsReport extends StatefulWidget {
  const todayGuestsReport({Key? key}) : super(key: key);

  @override
  State<todayGuestsReport> createState() => _todayGuestsReportState();
}

class _todayGuestsReportState extends State<todayGuestsReport> {
  var inside;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Todays Contractors reports"),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Expanded(
                  child: FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot != null){
                        GuestsInsideReport guestReport = snapshot.data as GuestsInsideReport ;
                        if (guestReport == null){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        else{
                          return weatherBox(context, guestReport);
                        }}
                      else{
                        return CircularProgressIndicator();
                      }
                    },

                    future: getGuestsReportList(),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget weatherBox(BuildContext context, GuestsInsideReport guestReport){
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20,
              );
            },
            itemCount: guestReport.visitorReportsToday!.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow:  [new BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 5.0,
                      ),]
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                  backgroundImage: AssetImage("lib/images/face3.png")
                               // backgroundImage: NetworkImage(guestReport.visitorReportsToday![index].vISITORPHOTO.toString()),
                              ),
                              Text(guestReport.visitorReportsToday![index].vISITORNAME.toString()),
                              Text(guestReport.visitorReportsToday![index].vISITORCOMPANYNAME.toString()),
                              Text(guestReport.visitorReportsToday![index].vISITORPHONENUMBER.toString()),
                              Text(guestReport.visitorReportsToday![index].vISITOREmail.toString()),

                            ],
                          ),
                          guestReport.visitorReportsToday![index].checkOut == 1?
                          Column(
                            children: [
                              Container(height: 20,width: 20, decoration: BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle
                              ),),
                              Text("Checked out")
                            ],
                          ):Column(
                            children: [
                              Container(height: 20,width: 20, decoration: BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle
                              ),),
                              Text("Still inside")
                            ],
                          )

                        ],
                      ),

                      Divider(thickness: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("entry time: ${guestReport.visitorReportsToday![index].vISITORENTRYTIME}"),
                          Text("checkout time: ${guestReport.visitorReportsToday![index].checkOutTime}")
                        ],
                      ),
                      SizedBox(height: 15,),

                      Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("emp name: ${guestReport.visitorReportsToday![index].eMPLOYEENAME}"),
                              Text("emp email: ${guestReport.visitorReportsToday![index].eMPLOYEEEMAIL}"),
                              Text("emp phNo: ${guestReport.visitorReportsToday![index].eMPLOYEEPHONENUMBER}"),
                              Text("nda sign: ${guestReport.visitorReportsToday![index].nDASign==0? "not signed":"signed"}")
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
        )
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