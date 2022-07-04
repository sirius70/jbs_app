import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jbs_app/admin/search_employee.dart';
import 'package:jbs_app/admin/statistics.dart';
import 'package:jbs_app/manager/viewusers.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:typed_data';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../storage.dart';
import 'home.dart';
import 'more.dart';

class managerScanQr extends StatefulWidget {
  const managerScanQr({Key? key}) : super(key: key);

  @override
  State<managerScanQr> createState() => _managerScanQrState();
}

class _managerScanQrState extends State<managerScanQr> {
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
        backgroundColor: Colors.white,
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
                            fontSize: 12,
                              color: Color(0xff005993)
                          ),)
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
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
                        Get.to(()=>Home2(empId: Storage.get_adminEmpID().toString(),
                          location: Storage.get_location().toString(),
                          ));
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
                        Get.off(()=>Users());
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
                            Get.to(managerScanQr());
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
                        // Get.to(stats());
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
                        Get.to(More());
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const Text("Scan QR", textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff005993)
                  ),),

                const SizedBox(height: 10,),

                const Text("Point camera on a QR", textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff00A3FF)
                  ),),

                const SizedBox(height: 20,),

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
                                          // Navigator.push(
                                          //     context, MaterialPageRoute(builder: (BuildContext context) =>
                                          //     Admin2(location: Storage.get_location().toString(),
                                          //       empID: Storage.get_adminEmpID().toString(),
                                          //       name: Storage.get_name().toString(),)));
                                          Get.off(()=>Home2(empId: Storage.get_adminEmpID().toString(),
                                            location: Storage.get_location().toString(),));

                                          // Get.back();
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
