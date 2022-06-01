import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(children: [
              Text(
                'Guests inside',
                style: TextStyle(color: Colors.blue.shade900),
              ),
              Text(
                '34/50',
                style: TextStyle(color: Colors.lightBlue),
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(children: [
              Text(
                'Contractors inside',
                style: TextStyle(color: Colors.blue.shade900),
              ),
              Text(
                '45/80',
                style: TextStyle(color: Colors.lightBlue),
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(children: [
              Text(
                'Deliveries Accepted',
                style: TextStyle(color: Colors.blue.shade900),
              ),
              Text(
                '110',
                style: TextStyle(color: Colors.lightBlue),
              )
            ]),
          )
        ],
      ),
    ));
  }
}
