import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import '../api/access.dart';
import '../models/delivery_report_model.dart';
import '../storage.dart';

class todayDeliveryReport extends StatefulWidget {
  const todayDeliveryReport({Key? key}) : super(key: key);

  @override
  State<todayDeliveryReport> createState() => _todayDeliveryReportState();
}

class _todayDeliveryReportState extends State<todayDeliveryReport> {
  DeliveryInsideReport? insideDeliveriesReport;
  var inside;
  bool loading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState(){
    super.initState();
    loading = false;
    access().getDeliveriesReportList().then((value) async{
      if(value["success"]){
        print("deli count: $value");
        setState(() {
          insideDeliveriesReport =  DeliveryInsideReport.fromJson(value);
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
            title: Text("Todays Deliveries reports"),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                insideDeliveriesReport == null?
                const Center(child: Text("No deliveies today in your organization"),):
                insideDeliveriesReport!.deliveryReportsToday.length==0?
                const Text("No deliveies today in your organization"):
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: insideDeliveriesReport!.deliveryReportsToday.length,
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
                                            //backgroundImage: NetworkImage(delReport.deliveryReportsToday![index].dELIVERYBOYPHOTO.toString()),
                                          ),
                                          Text(insideDeliveriesReport!.deliveryReportsToday[index].deliveryName.toString(),
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width*0.035
                                            ),),
                                          Text(insideDeliveriesReport!.deliveryReportsToday[index].deliveryCompanyName.toString(),
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width*0.035
                                            ),),
                                          Text(insideDeliveriesReport!.deliveryReportsToday[index].deliveryPhoneNumber.toString(),
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width*0.035
                                            ),),
                                          Text(insideDeliveriesReport!.deliveryReportsToday[index].deliveryEmail.toString(),
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width*0.035
                                            ),),
                                        ],
                                      ),
                                    ),
                                    insideDeliveriesReport!.deliveryReportsToday[index].checkOut == 1?
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
                                    Text("entry time: ${insideDeliveriesReport!.deliveryReportsToday[index].deliveryEntryTime}",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width*0.035
                                      ),),
                                    Text("checkout time: ${insideDeliveriesReport!.deliveryReportsToday[index].checkOutTime}",
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
                                        Text("emp name: ${insideDeliveriesReport!.deliveryReportsToday[index].employeeName}",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width*0.035
                                          ),),
                                        Text("emp email: ${insideDeliveriesReport!.deliveryReportsToday[index].employeeEmail}",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width*0.035
                                          ),),
                                        Text("emp phNo: ${insideDeliveriesReport!.deliveryReportsToday[index].employeePhoneNumber}",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width*0.035
                                          ),),
                                        Text("nda sign: ${insideDeliveriesReport!.deliveryReportsToday[index].deliveryNdaSign==0? "not signed":"signed"}",
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
                  )
                ),
              ],
            ),
          )
      ),
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