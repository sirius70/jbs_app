import 'package:flutter/material.dart';

import 'contractor4.dart';

class Contractor3 extends StatelessWidget {
  const Contractor3({Key? key}) : super(key: key);

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
            height: 50,
          ),
          Text(
            'Let us know who you are ?',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200),
                child: Center(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Meet\nSomeone',
                          style: TextStyle(color: Colors.black),
                        ))),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200),
                child: Center(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Delivery',
                          style: TextStyle(color: Colors.black),
                        ))),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Contractor4();
                          }));
                        },
                        child: Text(
                          'Contractor',
                          style: TextStyle(color: Colors.black),
                        ))),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200),
                child: Center(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign out',
                          style: TextStyle(color: Colors.black),
                        ))),
              )
            ],
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
