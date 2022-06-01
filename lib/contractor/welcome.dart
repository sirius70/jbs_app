import 'package:flutter/material.dart';

import 'contractor3.dart';

class Welcome_c extends StatelessWidget {
  const Welcome_c({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Center(
                    child: Text(
                      'Attendance',
                      style: TextStyle(color: Colors.black),
                    ),
                  )),
              SizedBox(
                width: 150,
              ),
              Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Center(
                    child: Text(
                      'Admin',
                      style: TextStyle(color: Colors.black),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 70,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              color: Colors.orange.shade700,
              size: 100,
            ),
            radius: 70,
          ),
          SizedBox(
            height: 25,
          ),
          Text('Welcome Asmita !',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 35)),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Contractor3();
              }));
            },
            child: Text(
              'Lets Begin',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20)),
                elevation: MaterialStateProperty.all(0),
                backgroundColor:
                    MaterialStateProperty.all(Colors.grey.shade500)),
          ),
          SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Have a QR code?',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  Image(
                    image: AssetImage('lib/images/qr.png'),
                    height: 70,
                  ),
                  Text('Scan here',
                      style: TextStyle(color: Colors.black, fontSize: 15))
                ],
              ),
              SizedBox(
                width: 100,
              ),
              Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Center(
                    child: Text(
                      'LOGO',
                      style: TextStyle(color: Colors.black),
                    ),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
