import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import '../models/contractors_report_model.dart';
import '../storage.dart';

class todayContractorsReport extends StatefulWidget {
  const todayContractorsReport({Key? key}) : super(key: key);

  @override
  State<todayContractorsReport> createState() => _todayContractorsReportState();
}

class _todayContractorsReportState extends State<todayContractorsReport> {
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
                      ContractorsInsideReport contReport = snapshot.data as ContractorsInsideReport ;
                      if (contReport == null){
                        return Center(child: CircularProgressIndicator(),);
                      }
                      else{
                        return weatherBox(context, contReport);
                      }}
                    else{
                      return CircularProgressIndicator();
                    }
                  },

                  future: getContractorsReportList(),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  Widget weatherBox(BuildContext context, ContractorsInsideReport contactReport){
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20,
              );
            },
            itemCount: contactReport.contractorsReportsToday!.length,
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
                               // backgroundImage: NetworkImage(contactReport.contractorsReportsToday![index].cONTRACTORPHOTO.toString()),
                              ),
                              Text(contactReport.contractorsReportsToday![index].cONTRACTORNAME.toString()),
                              Text(contactReport.contractorsReportsToday![index].cONTRACTORCOMPANYNAME.toString()),
                              Text(contactReport.contractorsReportsToday![index].cONTRACTORPHONENUMBER.toString()),
                              Text(contactReport.contractorsReportsToday![index].cONTRACTOREMAIL.toString()),

                            ],
                          ),
                          contactReport.contractorsReportsToday![index].checkOut == 1?
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
                          Text("entry time: ${contactReport.contractorsReportsToday![index].cONTRACTORSENTRYTIME}"),
                          Text("checkout time: ${contactReport.contractorsReportsToday![index].checkOutTime}")
                        ],
                      ),
                        SizedBox(height: 15,),

                        Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("emp name: ${contactReport.contractorsReportsToday![index].eMPLOYEENAME}"),
                                Text("emp email: ${contactReport.contractorsReportsToday![index].eMPLOYEEEMAIL}"),
                                Text("emp phNo: ${contactReport.contractorsReportsToday![index].eMPLOYEEPHONENUMBER}"),
                                Text("nda sign: ${contactReport.contractorsReportsToday![index].nDASign==0? "not signed":"signed"}")
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


Future getContractorsReportList() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};


  var url = Uri.parse('https://stg.visitormanager.net/v1/reportsTodayContractors?location_Id=${Storage.get_locationID()}');

  final response = await http.get(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return ContractorsInsideReport.fromJson(jsonDecode(response.body));
  } else {
    print("Failed to fetch data");
  }

}