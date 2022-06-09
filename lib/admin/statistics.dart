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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
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
                    Text(
                      '34/50',
                      style: TextStyle(color: Color(0xff005993)),
                    )
                  ],
                )
            ),

            SizedBox(height: MediaQuery.of(context).size.width*0.04,),
            Container(
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
                      '45/80',
                      style: TextStyle(color: Color(0xff005993)),
                    )
                  ],
                )
            ),

            SizedBox(height: MediaQuery.of(context).size.width*0.04,),
            Container(
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
                      '110',
                      style: TextStyle(color: Color(0xff005993)),
                    )
                  ],
                )
            ),

          ],
        ),
      ),
    ));
  }
}
