import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jbs_app/admin/admin_profile.dart';
import 'package:jbs_app/admin/statistics.dart';
import 'package:jbs_app/admin/todayGuestsInside_report.dart';
import 'package:jbs_app/admin/usersList.dart';
import 'package:jbs_app/employee_screens/my_scan_qr.dart';
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
import '../models/profile_model.dart';
import '../models/visitor_count_model.dart';
import 'admin_scanQr.dart';
import 'package:http/http.dart'  as http;
import 'package:get/get.dart';

class Admin2 extends StatefulWidget {
  Admin2({Key? key, required  this.empID,
    required  this.location}) :
        super(key: key);
  String empID;
  String location;

  @override
  State<Admin2> createState() => _Admin2State();
}

class _Admin2State extends State<Admin2> {
  bool loading = true;
  ProfileApi? getProfile;

  AdminIssuesList? issuesList;
  DeliveryTodaysCount? deliveryCount;
  VisitorTodaysCount? visitorCount;
  ContractorTodaysCount? contractorCount;
  TextEditingController feedbackController = TextEditingController();

  @override
  void initState(){
    super.initState();
    loading = false;
    feedbackController.text = '';

    access().profile().then((value) {
      if(value["success"]){
        setState((){
          getProfile = ProfileApi.fromJson(value);
        });
        loading=false;

      }
    });

    access().getIssuesList().then((value) async{
      print("value: $value");
      setState(() {
        issuesList = AdminIssuesList.fromJson(value);
      });
      loading = false;
      print("issues list: ${issuesList!.data[0]}");

    });

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

    Future<bool> showExitPopup() async {
      return await showDialog( //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit an App?'),
          actions:[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child:Text('No'),
            ),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              //return true when click on "Yes"
              child:Text('Yes'),
            ),

          ],
        ),
      )??false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
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
                        // Navigator.pushReplacement(
                        //     context, MaterialPageRoute(builder: (BuildContext context) =>
                        //     Admin2(empID: widget.empID, location: widget.location, name: widget.name)));
                        Get.off(()=>Admin2(empID: widget.empID, location: widget.location,));
                      },
                      child: Column(
                        children: [
                          LineIcon(
                            LineIcons.home,
                            size: 30,
                            color: HexColor('#005993'),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(color: HexColor('#005993'), fontSize: 15),
                          )
                        ],
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return UsersLists();
                        // }));
                        Get.to(UsersLists());
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
                            // Navigator
                            //     .of(context)
                            //     .push(MaterialPageRoute(builder:
                            //     (BuildContext context) => adminScanQr()));
                            Get.to(profileQr());
                          },
                          icon: Icon(CupertinoIcons.qrcode_viewfinder,  size: 40,
                              color: Color(0xff717171))),
                    ),

                    TextButton(
                      onPressed: () {
                        print("stats");
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return stats();
                        // }));
                        Get.to(stats());
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
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return adminProfile();
                        // }));
                        Get.to(adminProfile());
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
        Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hello,',
                                style: TextStyle(color: Colors.lightBlue,
                                    fontSize: MediaQuery.of(context).size.width*0.04),
                              ),
                              SizedBox(height: 5,),
                              Column(

                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.275,
                                        child: Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                // "${widget.name}",
                                                getProfile==null? "": getProfile!.data[0].name,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                                textAlign: TextAlign.justify,
                                                //"${widget.name}",
                                                style: TextStyle(
                                                    color: Colors.blue.shade900, fontSize: MediaQuery.of(context).size.width*0.05),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            print("admin: ${Storage.get_isAdmin()}");
                                            print("manager: ${Storage.get_isManager()}");

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

                                                        if (Storage.get_isManager() == "1")...[
                                                          GestureDetector(
                                                            onTap: (){
                                                              // Navigator.pushReplacement(
                                                              //     (context as Element),
                                                              // MaterialPageRoute(
                                                              //     builder: (BuildContext context) => Home2(empId: Storage.get_adminEmpID().toString(),
                                                              //       location: Storage.get_location().toString(),
                                                              //       name: Storage.get_name().toString(),)));
                                                              Navigator.pushAndRemoveUntil(context,
                                                                  MaterialPageRoute(builder: (context)=>Home2(empId: Storage.get_adminEmpID().toString(),
                                                                    location: Storage.get_location().toString(),))
                                                                  , (route) => false);
                                                            },
                                                            child: ListTile(
                                                              leading: Image(
                                                                  image: AssetImage(
                                                                      'lib/images/face.png')),
                                                              title: Text('Manager',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.normal,
                                                                      color: Colors.blue.shade900)),
                                                            ),)
                                                        ],
                                                        SizedBox(
                                                          height: 25,
                                                        ),

                                                        if(Storage.get_isAdmin()=="1")...[
                                                          GestureDetector(
                                                            onTap: (){
                                                              // Navigator.pushReplacement(
                                                              //     (context as Element),
                                                              //     MaterialPageRoute(
                                                              //         builder: (BuildContext context) => Admin2(
                                                              //           location: Storage.get_location().toString(),
                                                              //           empID: Storage.get_adminEmpID().toString(),
                                                              //           name: Storage.get_name().toString(),)));

                                                              Navigator.pushAndRemoveUntil(context,
                                                                  MaterialPageRoute(builder: (context)=>
                                                                      Admin2(
                                                                        location: Storage.get_location().toString(),
                                                                        empID: Storage.get_adminEmpID().toString(),))
                                                                  , (route) => false);

                                                            },
                                                            child: ListTile(
                                                              leading: Image(
                                                                  image: AssetImage(
                                                                      'lib/images/face.png')),
                                                              title: Text('Admin',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.blue.shade900)),
                                                            ),
                                                          ),
                                                        ],

                                                        SizedBox(
                                                          height: 25,
                                                        ),
                                                        GestureDetector(
                                                            onTap: (){
                                                              // Navigator.pushReplacement(
                                                              //     (context as Element),
                                                              //     MaterialPageRoute(
                                                              //         builder: (BuildContext context) => employeeWelcome()));

                                                              Navigator.pushAndRemoveUntil(context,
                                                                  MaterialPageRoute(builder: (context)=>
                                                                  employeeWelcome())
                                                                  , (route) => false);
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
                                          child: Icon(Icons.arrow_drop_down,
                                              color: Colors.lightBlue))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: (){

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  //     adminProfile()));
                                  Get.to(adminProfile());
                                },
                                child: Image(image: AssetImage('lib/images/face.png'), height: 50)),
                            SizedBox(height: 2,),
                            Text(
                              'Admin',
                              style: TextStyle(color: Colors.amber, fontSize: MediaQuery.of(context).size.width*0.03),
                            ),
                            Text(
                              widget.location,
                              style: TextStyle(color: Colors.blue,
                                  fontSize: MediaQuery.of(context).size.width*0.04),
                            ),
                            Text(
                              'Emp Id: ${widget.empID}',
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04),
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

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [ BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 5.0,
                          ),]
                      ),
                      child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Reports from front desk',
                                  style: TextStyle(fontWeight: FontWeight.w700,
                                      fontSize: MediaQuery.of(context).size.width*0.04),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:  const EdgeInsets.all(8.0),
                                    child: Image(
                                      image: AssetImage('lib/images/bors2.png'),
                                      height: MediaQuery.of(context).size.width*0.225,
                                      width: MediaQuery.of(context).size.width*0.225,
                                    ),
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
                                            width: MediaQuery.of(context).size.width*0.025,
                                          ),
                                          visitorCount == null?
                                          Text("Guests inside: 0",
                                            style: TextStyle( fontSize: MediaQuery.of(context).size.width*0.0375,
                                                backgroundColor: HexColor('#dadbda')
                                            ),):
                                          Text("Guests inside: ${visitorCount!.visitorInside[0].COUNT}",
                                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.0375,
                                                backgroundColor: HexColor('#dadbda')
                                            ),)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: HexColor('#ababab'),
                                            radius: 5,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*0.025,
                                          ),
                                          contractorCount == null?
                                          Text("Contractors inside: 0",
                                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.0375,
                                                backgroundColor: HexColor('#dadbda')
                                            ),):
                                          Text("Contractors inside: ${contractorCount!.contractorInside[0].COUNT}",
                                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.0375,
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
                                            width: MediaQuery.of(context).size.width*0.025,
                                          ),
                                          deliveryCount == null?
                                          Text("Deliveries accepted: 0",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width*0.0375,
                                                backgroundColor: HexColor('#dadbda')
                                            ),):
                                          Text("Deliveries accepted: ${Storage.get_deliveryCount().toString()}",
                                            style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.0375,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [ BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 5.0,
                          ),]
                      ),

                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            issuesList == null?
                            Center(child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("No requests"),
                              ],
                            ),): issuesList!.data.length==0?
                            Center(child: Text("no requests")):
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              separatorBuilder: (BuildContext context, int index) {
                                return Divider(
                                );
                              },
                              itemCount: issuesList!.data.length,
                              itemBuilder: (context, index){
                                return Column(
                                  children: [
                                    SizedBox(height:10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                      child: Row(
                                        children: [
                                          Image(
                                              height: MediaQuery.of(context).size.width*0.2,
                                              width: MediaQuery.of(context).size.width*0.2,
                                              image:
                                              AssetImage('lib/images/face3.png')),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*0.025,
                                          ),

                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(issuesList!.data[index].issueLevel == 1? "Low":
                                                  issuesList!.data[index].issueLevel == 2? "Medium":
                                                  "High", style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.width*0.0375,
                                                      backgroundColor: Colors.grey.shade300
                                                  ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(issuesList!.data[index].name,
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(context).size.width*0.0375,
                                                        backgroundColor: Colors.grey.shade300
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(issuesList!.data[index].phoneNumber,
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(context).size.width*0.0375,
                                                        backgroundColor: Colors.grey.shade300
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(issuesList!.data[index].issueElaboration,
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(context).size.width*0.0375,
                                                        backgroundColor: Colors.grey.shade300
                                                    ),
                                                    maxLines: 5,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),

                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            height: MediaQuery.of(context).size.width*0.1,
                                            child: TextButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                                          content: Container(
                                                            //padding: EdgeInsets.all(10),
                                                            width: MediaQuery.of(context).size.width,
                                                            height: MediaQuery.of(context).size.height*0.5,
                                                            decoration:const BoxDecoration(
                                                              shape: BoxShape.rectangle,
                                                              color:  Color(0xFFFFFF),
                                                            ),
                                                            child: SingleChildScrollView(
                                                              child: Center(
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child: Column(
                                                                            mainAxisSize: MainAxisSize.min,
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text("${issuesList!.data[index].name}",
                                                                                style: TextStyle(
                                                                                  color: Color(0xff005993),
                                                                                  fontSize:  MediaQuery.of(context).size.width*0.045,
                                                                                ),),
                                                                              SizedBox(height: 4,),
                                                                              Text("Employee", style:TextStyle(
                                                                                  fontSize: MediaQuery.of(context).size.width*0.03
                                                                              )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child: Align(
                                                                            alignment: Alignment.topRight,
                                                                            child: Text("App-QR error",style:TextStyle(
                                                                                fontSize: MediaQuery.of(context).size.width*0.05
                                                                            )),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),

                                                                    SizedBox(height: 20,),

                                                                    Text("Description",
                                                                      style: TextStyle(
                                                                        fontSize: MediaQuery.of(context).size.width*0.04,
                                                                      ),),
                                                                    SizedBox(height: 10,),

                                                                    Text(issuesList!.data[index].issueElaboration,
                                                                        textAlign: TextAlign.justify,
                                                                        style:  TextStyle(
                                                                            fontSize: MediaQuery.of(context).size.width*0.0375
                                                                        )),

                                                                    SizedBox(height: 20,),

                                                                    // Row(
                                                                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                    //   children: [
                                                                    //     Row(
                                                                    //       children: [
                                                                    //         Container(
                                                                    //           height: MediaQuery.of(context).size.width*0.045,
                                                                    //           width: MediaQuery.of(context).size.width*0.045,
                                                                    //           decoration: BoxDecoration(
                                                                    //             shape: BoxShape.circle,
                                                                    //             border: Border.all(color: Color(0xff005993),
                                                                    //             width: 4
                                                                    //             )
                                                                    //           ),
                                                                    //         ),
                                                                    //
                                                                    //         SizedBox(width: MediaQuery.of(context).size.width*0.0175,),
                                                                    //
                                                                    //         Text("Pending",
                                                                    //         style: TextStyle(
                                                                    //           fontSize: MediaQuery.of(context).size.width*0.04
                                                                    //         ),)
                                                                    //       ],
                                                                    //     ),
                                                                    //     Row(
                                                                    //       children: [
                                                                    //         Container(
                                                                    //           height: MediaQuery.of(context).size.width*0.045,
                                                                    //           width: MediaQuery.of(context).size.width*0.045,
                                                                    //           decoration: BoxDecoration(
                                                                    //               shape: BoxShape.circle,
                                                                    //               border: Border.all(color: Color(0xff005993),
                                                                    //                   width: 4
                                                                    //               )
                                                                    //           ),
                                                                    //         ),
                                                                    //
                                                                    //         SizedBox(width: MediaQuery.of(context).size.width*0.0175,),
                                                                    //
                                                                    //         Text("Resolved",
                                                                    //           style: TextStyle(
                                                                    //               fontSize: MediaQuery.of(context).size.width*0.04
                                                                    //           ),)
                                                                    //       ],
                                                                    //     ),
                                                                    //   ],
                                                                    // ),
                                                                    SizedBox(height: 20,),
                                                                    Text("Send Feedback",
                                                                      style: TextStyle(
                                                                          fontSize: MediaQuery.of(context).size.width*0.0425
                                                                      ),),
                                                                    Padding(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(20),
                                                                        ),
                                                                        child: TextFormField(
                                                                          controller: feedbackController,
                                                                          textInputAction: TextInputAction.newline,
                                                                          keyboardType: TextInputType.multiline,
                                                                          minLines: null,
                                                                          maxLines: 6,
                                                                          cursorColor: Color(0xff031627),
                                                                          decoration: InputDecoration(
                                                                            contentPadding: const EdgeInsets.all(10.0),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Color(0xffF3F3F3)),
                                                                            ),
                                                                            focusedBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Color(0xffF3F3F3)),
                                                                            ),
                                                                            focusColor: Color(0xff031627),
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                              borderSide: BorderSide(color: Color(0xffF3F3F3)),
                                                                            ),
                                                                            filled: true,
                                                                            fillColor: Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    SizedBox(height: 15,),

                                                                    Container(
                                                                      width: MediaQuery.of(context).size.width,
                                                                      child: ElevatedButton(
                                                                        onPressed: (){
                                                                          print(issuesList!.data[index].id);
                                                                          access().respondServiceReq(feedbackController.text,
                                                                              issuesList!.data[index].id.toString()).then((value) {
                                                                            if (value["success"]){
                                                                              print(issuesList!.data[index].id);

                                                                              setState((){
                                                                                issuesList!.data.removeAt(index);
                                                                              });

                                                                              Get.back();

                                                                              Fluttertoast.showToast(
                                                                                  msg: "${"Response sent as resolved"}",
                                                                                  toastLength: Toast.LENGTH_SHORT,
                                                                                  gravity: ToastGravity.BOTTOM,
                                                                                  timeInSecForIosWeb: 1,
                                                                                  backgroundColor: Colors.green.shade400,
                                                                                  textColor: Colors.white,
                                                                                  fontSize: 16.0);

                                                                              setState((){
                                                                                feedbackController.clear();
                                                                              });
                                                                            } else{
                                                                              Get.back();
                                                                              Fluttertoast.showToast(
                                                                                  msg: "${"Response sent as pending"}",
                                                                                  toastLength: Toast.LENGTH_SHORT,
                                                                                  gravity: ToastGravity.BOTTOM,
                                                                                  timeInSecForIosWeb: 1,
                                                                                  backgroundColor: Colors.red.shade400,
                                                                                  textColor: Colors.white,
                                                                                  fontSize: 16.0);

                                                                              setState((){
                                                                                feedbackController.clear();
                                                                              });
                                                                            }
                                                                          });
                                                                        },
                                                                        child: Text("Update", style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontSize: 16
                                                                        ),),
                                                                        style: ButtonStyle(
                                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                                RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(25),
                                                                                    side: BorderSide(color: Color(0xff00A3FF))
                                                                                )
                                                                            ),
                                                                            backgroundColor: MaterialStateProperty.all(Color(0xff00A3FF),)
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ));
                                                    });
                                              },
                                              child: Text('Respond',
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

                            ),



                          ],
                        ),
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: GestureDetector(
                      onTap: (){
                        print("view guests");
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>todayGuestsReport()));
                        Get.to(todayGuestsReport());
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade400)
                        ),
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("View Guests", style: TextStyle(
                                  color: Color(0xff005993),
                                  fontSize: MediaQuery.of(context).size.width*0.04
                              ),),

                              Row(
                                children: [
                                  VerticalDividerWidget(),
                                  IconButton(onPressed: (){
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>todayGuestsReport()));
                                    Get.to(todayGuestsReport());
                                  },
                                      icon: Icon(Icons.arrow_forward_ios, size: MediaQuery.of(context).size.width*0.04,
                                        color: Color(0xff005993),))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );

    // Future<bool> showExitPopup() async {
    //   return await showDialog( //show confirm dialogue
    //     //the return value will be from "Yes" or "No" options
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: Text('Exit App'),
    //       content: Text('Do you want to exit an App?'),
    //       actions:[
    //         ElevatedButton(
    //           onPressed: () => Navigator.of(context).pop(false),
    //           //return false when click on "NO"
    //           child:Text('No'),
    //         ),
    //
    //         ElevatedButton(
    //           onPressed: () => Navigator.of(context).pop(true),
    //           //return true when click on "Yes"
    //           child:Text('Yes'),
    //         ),
    //
    //       ],
    //     ),
    //   )??false; //if showDialouge had returned null, then return false
    // }
    //


    // return WillPopScope(
    //     onWillPop: showExitPopup, //call function on back button press
    //     child:SafeArea(
    //         child:
    // );
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
