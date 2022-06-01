import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jbs_app/employee_screens/my_scan_success_fail.dart';

class profileQr extends StatefulWidget {
  const profileQr({Key? key}) : super(key: key);

  @override
  State<profileQr> createState() => _profileQrState();
}

class _profileQrState extends State<profileQr> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 13,),
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>myScanSuccess()));
                        },
                        label: Text("Cancel", style: TextStyle(
                            color: Colors.white,
                            fontSize: 13
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
                  padding: const EdgeInsets.only(top: 100, bottom: 100),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("My QR", textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff005993)
                          ),),

                        SizedBox(height: 10,),

                        Text("Scan this QR code using the tablet's scanner", textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff00A3FF)
                          ),),

                        SizedBox(height: 50,),
                        Image.asset("assets/images/qr_code.jpg"),

                        SizedBox(height: 70,),
                        Text("OR", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),

                        SizedBox(height: 20,),
                        Text("Enter ID on Front Desk", style: TextStyle(
                            fontSize: 20,
                        ),),
                        SizedBox(height: 10,),
                        Text("1 2 8 7", style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold,
                          color: Color(0xff005993)
                        ),),
                      ],
                    ),
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


