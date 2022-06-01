import 'package:flutter/material.dart';

class adminAlert extends StatelessWidget {
  const adminAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF2E00),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Alerted by the admin", style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),

            SizedBox(height: 0,),

            Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.5,
                        child: Icon(
                          Icons.error_rounded ,  size: MediaQuery.of(context).size.height*0.45,
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),

                      Container(
                          height: MediaQuery.of(context).size.height*0.5,
                          alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Evacuation \nalert!".toUpperCase(),
                              textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                            ),
                            ),

                            SizedBox(height: 80,),

                            Text("Don't panic, evacuate as \nper protocol",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              ),
                            ),

                          ],
                        )
                      ),



                    ],
                  ),


                ],
              ),
            ),

            Text("Proceed to the assembly ground", style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ),
    );
  }
}
