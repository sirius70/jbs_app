import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jbs_app/admin/todayContractorsInside_report.dart';
import 'package:jbs_app/admin/todayDeliveryInside_report.dart';
import 'package:jbs_app/admin/todayGuestsInside_report.dart';
import 'package:jbs_app/admin/usersList.dart';
import 'package:jbs_app/admin/visitors_history.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../api/access.dart';
import '../employee_screens/my_scan_qr.dart';
import '../models/contractor_count_model.dart';
import '../models/delivery_count_model.dart';
import '../models/visitor_count_model.dart';
import '../storage.dart';
import 'admin2.dart';
import 'admin_profile.dart';
import 'admin_scanQr.dart';

class stats extends StatefulWidget {
  const stats({Key? key}) : super(key: key);

  @override
  State<stats> createState() => _statsState();
}

class _statsState extends State<stats> {
  bool loading = true;

  DeliveryTodaysCount? deliveryCount;
  VisitorTodaysCount? visitorCount;
  ContractorTodaysCount? contractorCount;


  @override
  void initState(){
    super.initState();
    access().deliveryTodayCount().then((value) async{
      if(value["success"]){
        print("deli count: $value");
        setState(() {
          deliveryCount =  DeliveryTodaysCount.fromJson(value);
        });
        loading = false;
      }
    });

    access().visitorTodayCount().then((value) async{
      print("visit count: $value");
      if(value["success"]){
        setState(() {
          visitorCount =  VisitorTodaysCount.fromJson(value);
        });
        loading = false;
      }
    });

    access().contractorTodayCount().then((value) async{
      if(value["success"]){
        print("deli count: $value");
        setState(() {
          contractorCount = ContractorTodaysCount.fromJson(value);
        });
        loading = false;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
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
                          Navigator.push(
                              context, MaterialPageRoute(builder: (BuildContext context) =>
                              Admin2(location: Storage.get_location().toString(),
                                empID: Storage.get_adminEmpID().toString(),
                                )));
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
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
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
                                  (BuildContext context) => profileQr()));
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
                        color: Color(0xff005993),
                        fontSize: 12
                      ),)
                    ],
                  ),
              ),
            );
          }
        ),
        title: const Text(
          'Visitor Stats',
          style: TextStyle(color: Color(0xff005993)),
        ),
        centerTitle: true,
      ),
      body: loading?Center(child: CircularProgressIndicator(),):
      SingleChildScrollView(
        child: Padding(
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
                              '${visitorCount==null?0:visitorCount!.visitorInside[0].COUNT}/'
                                  '${visitorCount==null?0:visitorCount!.visitorVisited[0].COUNT}',
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
                          '${contractorCount==null?0:contractorCount!.contractorInside[0].COUNT}/'
                              '${contractorCount==null?0:contractorCount!.totalContractorVisited[0].COUNT}',
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
                          "${deliveryCount==null?0:deliveryCount!.data[0].COUNT}",
                          style: TextStyle(color: Color(0xff005993)),
                        )
                      ],
                    )
                ),
              ),

              SizedBox(height: 50,),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      visitorHistory()));
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
                          'Visitor History',
                          style: TextStyle(color: Color(0xff092F52)),
                        ),
                        GestureDetector(
                            onTap: (){

                            },
                            child: Icon(Icons.arrow_forward_ios, size: 15,))
                      ],
                    )
                ),
              ),

            ],
          ),
        ),
      ),
    ));
  }
}
