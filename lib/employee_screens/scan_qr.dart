import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbs_app/employee_screens/profile_page_3.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mobile_scanner/mobile_scanner.dart' as scanner;

import 'employee_welcome_1.dart';
import 'guest_register_2.dart';
import 'my_attendance.dart';

class scanQr extends StatefulWidget {
  const scanQr({Key? key}) : super(key: key);

  @override
  State<scanQr> createState() => _scanQrState();
}

class _scanQrState extends State<scanQr> {
  Uint8List bytes = Uint8List(0);
  TextEditingController? _inputController;
  TextEditingController? _outputController;

  @override
  initState() {
    super.initState();
    this._inputController = new TextEditingController();
    this._outputController = new TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        children: [
                          IconButton(
                              onPressed: (){
                                Navigator
                                    .of(context)
                                    .push(MaterialPageRoute(builder:
                                    (BuildContext context) => employeeWelcome()));
                              },
                              icon: Icon(CupertinoIcons.home, size: 30,
                                  color: Color(0xff717171))),

                          Text("Home",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff717171)
                            ),)
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            //padding: EdgeInsets.only(left:10),
                              onPressed: (){
                                Icon(Icons.ac_unit, color :Colors.teal);
                                Navigator
                                    .of(context)
                                    .pushReplacement(MaterialPageRoute(builder:
                                    (BuildContext context) => guestRegister()));
                              },
                              icon: Icon(CupertinoIcons.person_crop_circle_fill_badge_plus,
                                  size: 30,
                                  color: Color(0xff0093CB))),
                          Text("Add guest",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff0093CB)
                            ),)
                        ],
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
                                  (BuildContext context) => scanQr()));
                            },
                            icon: Icon(CupertinoIcons.qrcode_viewfinder,  size: 40,
                                color: Color(0xff717171))),
                      ),
                      Column(
                        children: [
                          IconButton(
                            //padding: EdgeInsets.only(left:10),
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>myAttendance()));
                              },
                              icon: Icon(CupertinoIcons.chart_bar, size: 30,
                                  color: Color(0xff717171))),
                          Text("Attendance",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff717171)
                            ),)
                        ],
                      ),

                      Column(
                        children: [
                          IconButton(
                            //padding: EdgeInsets.only(left:10),
                              onPressed: (){
                                Navigator
                                    .of(context)
                                    .push(MaterialPageRoute(builder:
                                    (BuildContext context) => employeeProfile()));
                              },
                              icon: Icon(Icons.more_horiz_rounded, size: 30,
                                  color: Color(0xff717171))),
                          Text("Menu",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff717171)
                            ),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 15,),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        label: Text("Cancel", style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                        ),),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: BorderSide(color: Color(0xff005993))
                                )
                            ),
                            backgroundColor: MaterialStateProperty.all(Color(0xff005993),)
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 120, bottom: 120, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Scan QR", textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff005993)
                        ),),

                      SizedBox(height: 10,),

                      Text("Point camera on a QR", textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff00A3FF)
                        ),),

                      SizedBox(height: 50,),

                  Center(
                    child: Stack(
                      children: [
                        Container(
                          child: CustomPaint(
                            foregroundPainter: BorderPainter(),
                            child: Container(
                              height: MediaQuery.of(context).size.width*0.6,
                              width: MediaQuery.of(context).size.width*0.6,
                            ),
                          ),
                        ),


                        Positioned(
                          top: 20,
                          left: 20,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child:Container(
                                    height: MediaQuery.of(context).size.width*0.5,
                                    width: MediaQuery.of(context).size.width*0.5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25)
                                    ),
                                    child: MobileScanner(
                                        allowDuplicates: false,
                                        onDetect: (barcode, args) {
                                          if (barcode.rawValue == null) {
                                            debugPrint('Failed to scan Barcode');
                                          } else {
                                            final String code = barcode.rawValue!;
                                            Navigator
                                                .of(context)
                                                .pushReplacement(MaterialPageRoute(builder:
                                                (BuildContext context) => employeeWelcome()));
                                            debugPrint('Barcode found! $code');
                                          }
                                        }),
                                    //   child: QRViewExample(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                      // SizedBox(height: 10,),
                      //
                      //
                      // Center(
                      //   child: ClipRRect(
                      //       borderRadius: BorderRadius.circular(20),
                      //       child:Container(
                      //         height: MediaQuery.of(context).size.width*0.6,
                      //         width: MediaQuery.of(context).size.width*0.6,
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(25)
                      //         ),
                      //         child: MobileScanner(
                      //             allowDuplicates: false,
                      //             onDetect: (barcode, args) {
                      //               if (barcode.rawValue == null) {
                      //                 debugPrint('Failed to scan Barcode');
                      //               } else {
                      //                 final String code = barcode.rawValue!;
                      //                 Navigator
                      //                     .of(context)
                      //                     .pushReplacement(MaterialPageRoute(builder:
                      //                     (BuildContext context) => employeeWelcome()));
                      //                 debugPrint('Barcode found! $code');
                      //               }
                      //             }),
                      //         //   child: QRViewExample(),
                      //       ),
                      //   ),
                      // ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}




class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double sh = size.height; // for convenient shortage
    double sw = size.width; // for convenient shortage
    double cornerSide = sh * 0.15; // desirable value for corners side

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path()
      ..moveTo(cornerSide, 0)
      ..quadraticBezierTo(0, 0, 0, cornerSide)
      ..moveTo(0, sh - cornerSide)
      ..quadraticBezierTo(0, sh, cornerSide, sh)
      ..moveTo(sw - cornerSide, sh)
      ..quadraticBezierTo(sw, sh, sw, sh - cornerSide)
      ..moveTo(sw, cornerSide)
      ..quadraticBezierTo(sw, 0, sw - cornerSide, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BorderPainter oldDelegate) => false;
}
