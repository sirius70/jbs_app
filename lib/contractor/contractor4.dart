import 'package:flutter/material.dart';

import 'contractor5.dart';

class Contractor4 extends StatelessWidget {
  const Contractor4({Key? key}) : super(key: key);

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
          Text(
            'Your details',
            style: TextStyle(fontSize: 25),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Name",
                      fillColor: Colors.grey.shade300),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Phone/E-mail",
                      fillColor: Colors.grey.shade300),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Password",
                      fillColor: Colors.grey.shade300),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.4,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Add members +',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                            )),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent))),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.4,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return contractor5();
                    }));
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.only(left: 50, right: 50)),
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  child: Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  )),
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
