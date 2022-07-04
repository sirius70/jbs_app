import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import '../api/access.dart';
import '../models/contractors_report_model.dart';
import '../storage.dart';

class todayContractorsReport extends StatefulWidget {
  const todayContractorsReport({Key? key}) : super(key: key);

  @override
  State<todayContractorsReport> createState() => _todayContractorsReportState();
}

class _todayContractorsReportState extends State<todayContractorsReport> {
  ContractorsInsideReport? insideContractorReport;
  var inside;
  bool loading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState(){
    super.initState();
    loading = false;
    access().getContractorsReportList().then((value) async{
      print("contr report: $value");
      if(value["success"]){
        setState(() {
          insideContractorReport =  ContractorsInsideReport.fromJson(value);
        });
        loading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Todays Contractors reports"),
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
              SizedBox(height: 10,),

              insideContractorReport==null?
              const Center(child: Text("No contractors today in your organization")):
              insideContractorReport!.contractorsReportsToday.length==0?
              Center(child: const Text("No contractors today in your organization")):

              Expanded(
                child:  ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: insideContractorReport!.contractorsReportsToday.length,
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
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircleAvatar(
                                            backgroundImage: AssetImage("lib/images/face3.png")
                                          // backgroundImage: NetworkImage(contactReport.contractorsReportsToday![index].cONTRACTORPHOTO.toString()),
                                        ),
                                        Text(insideContractorReport!.contractorsReportsToday[index].contractorsName.toString(),
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width*0.035
                                          ),),
                                        Text(insideContractorReport!.contractorsReportsToday[index].contractorsCompanyName.toString(),
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width*0.035
                                          ),),
                                        Text(insideContractorReport!.contractorsReportsToday[index].contractorsPhoneNumber.toString(),
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width*0.035
                                          ),),
                                        Text(insideContractorReport!.contractorsReportsToday[index].contractorsEmail.toString(),
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width*0.035
                                          ),),

                                      ],
                                    ),
                                  ),
                                  insideContractorReport!.contractorsReportsToday[index].checkOut == 1?
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
                                  Text("entry time: ${insideContractorReport!.contractorsReportsToday[index].contractorsEntryTime}",
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width*0.035
                                    ),),
                                  Text("checkout time: ${insideContractorReport!.contractorsReportsToday[index].checkOutTime}",
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
                                      Text("emp name: ${insideContractorReport!.contractorsReportsToday[index].employeeName}",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width*0.035
                                        ),),
                                      Text("emp email: ${insideContractorReport!.contractorsReportsToday[index].employeeEmail}",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width*0.035
                                        ),),
                                      Text("emp phNo: ${insideContractorReport!.contractorsReportsToday[index].employeePhoneNumber}",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width*0.035
                                        ),),
                                      Text("nda sign: ${insideContractorReport!.contractorsReportsToday[index].contractorsNdaSign==0? "not signed":"signed"}",
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
                // FutureBuilder(
                //   builder: (context, snapshot) {
                //     if (snapshot != null){
                //       ContractorsInsideReport contReport = snapshot.data as ContractorsInsideReport ;
                //       if (contReport == null){
                //         return Center(child: Text("No contractors today in your organization"),);
                //       }
                //       else{
                //         return weatherBox(context, contReport);
                //       }}
                //     else{
                //       return Center(child: CircularProgressIndicator(),);
                //     }
                //   },
                //
                //   future: getContractorsReportList(),
                // ),
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
            itemCount: contactReport.contractorsReportsToday.length,
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
                              Text(contactReport.contractorsReportsToday[index].contractorsName.toString()),
                              Text(contactReport.contractorsReportsToday[index].contractorsCompanyName.toString()),
                              Text(contactReport.contractorsReportsToday[index].contractorsPhoneNumber.toString()),
                              Text(contactReport.contractorsReportsToday[index].contractorsEmail.toString()),

                            ],
                          ),
                          contactReport.contractorsReportsToday[index].checkOut == 1?
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
                          Text("entry time: ${contactReport.contractorsReportsToday[index].contractorsEntryTime}"),
                          Text("checkout time: ${contactReport.contractorsReportsToday[index].checkOutTime}")
                        ],
                      ),
                        SizedBox(height: 15,),

                        Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("emp name: ${contactReport.contractorsReportsToday[index].employeeName}"),
                                Text("emp email: ${contactReport.contractorsReportsToday[index].employeeEmail}"),
                                Text("emp phNo: ${contactReport.contractorsReportsToday[index].employeePhoneNumber}"),
                                Text("nda sign: ${contactReport.contractorsReportsToday[index].contractorsNdaSign==0? "not signed":"signed"}")
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