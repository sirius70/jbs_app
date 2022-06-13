import 'package:flutter/material.dart';
import 'package:jbs_app/admin/todayContractorsInside_report.dart';
import 'package:jbs_app/admin/todayDeliveryInside_report.dart';
import 'package:jbs_app/admin/todayGuestsInside_report.dart';

import '../storage.dart';

class stats extends StatelessWidget {
  const stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          children: [
            Icon(Icons.arrow_left_sharp, color: Colors.black),
          ],
        ),
        title: Text(
          'Statistics',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    todayGuestsReport()));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [new BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 5.0,
                      ),]
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Guests inside',
                        style: TextStyle(color: Color(0xff092F52)),
                      ),
                      Row(
                        children: [
                          Text(
                            '${Storage.get_visitorCount()}/${Storage.get_totalVisitorCount()}',
                            style: TextStyle(color: Color(0xff005993)),
                          ),
                          // IconButton(onPressed: (){
                          //
                          // },
                          //     icon: Icon(Icons.arrow_forward_ios,
                          //     size: 16,))
                        ],
                      )
                    ],
                  )
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.width*0.04,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    todayContractorsReport()));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [new BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 5.0,
                      ),]
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Contractors inside',
                        style: TextStyle(color: Color(0xff092F52)),
                      ),
                      Text(
                        '${Storage.get_contractorCount()}/${Storage.get_totalContractorCount()}',
                        style: TextStyle(color: Color(0xff005993)),
                      )
                    ],
                  )
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.width*0.04,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    todayDeliveryReport()));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [new BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 5.0,
                      ),]
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Deliveries Accepted',
                        style: TextStyle(color: Color(0xff092F52)),
                      ),
                      Text(
                        Storage.get_deliveryCount().toString(),
                        style: TextStyle(color: Color(0xff005993)),
                      )
                    ],
                  )
              ),
            ),

          ],
        ),
      ),
    ));
  }
}
