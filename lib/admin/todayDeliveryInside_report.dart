import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import '../models/delivery_report_model.dart';
import '../storage.dart';

class todayDeliveryReport extends StatefulWidget {
  const todayDeliveryReport({Key? key}) : super(key: key);

  @override
  State<todayDeliveryReport> createState() => _todayDeliveryReportState();
}

class _todayDeliveryReportState extends State<todayDeliveryReport> {
  var inside;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Todays Deliveries reports"),
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
                        DeliveryInsideReport delReport = snapshot.data as DeliveryInsideReport ;
                        if (delReport == null){
                          return Center(child: Text("No deleveries today in your organization"),);
                        }
                        else{
                          return weatherBox(context, delReport);
                        }}
                      else{
                        return CircularProgressIndicator();
                      }
                    },

                    future: getDeliveryReportList(),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget weatherBox(BuildContext context, DeliveryInsideReport delReport){
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20,
              );
            },
            itemCount: delReport.deliveryReportsToday!.length,
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
                                //backgroundImage: NetworkImage(delReport.deliveryReportsToday![index].dELIVERYBOYPHOTO.toString()),
                              ),
                              Text(delReport.deliveryReportsToday[index].DELIVERYNAME.toString()),
                              Text(delReport.deliveryReportsToday[index].DELIVERYCOMPANYNAME.toString()),
                              Text(delReport.deliveryReportsToday[index].DELIVERYPHONENUMBER.toString()),
                              Text(delReport.deliveryReportsToday[index].DELIVERYEMAIL.toString()),
                            ],
                          ),
                          delReport.deliveryReportsToday![index].checkOut == 1?
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
                          Text("entry time: ${delReport.deliveryReportsToday[index].DELIVERYENTRYTIME}"),
                          Text("checkout time: ${delReport.deliveryReportsToday[index].checkOutTime}")
                        ],
                      ),
                      SizedBox(height: 15,),

                      Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("emp name: ${delReport.deliveryReportsToday[index].EMPLOYEENAME}"),
                              Text("emp email: ${delReport.deliveryReportsToday[index].EMPLOYEEEMAIL}"),
                              Text("emp phNo: ${delReport.deliveryReportsToday[index].EMPLOYEEPHONENUMBER}"),
                              Text("nda sign: ${delReport.deliveryReportsToday[index].NDASign==0? "not signed":"signed"}")
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


Future getDeliveryReportList() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};


  var url = Uri.parse('https://stg.visitormanager.net/v1/reportsTodayDeleveries?location_Id=${Storage.get_locationID()}');

  final response = await http.get(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return DeliveryInsideReport.fromJson(jsonDecode(response.body));
  } else {
    print("Failed to fetch data");
  }

}