import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class evacuationOn extends StatefulWidget {
  const evacuationOn({Key? key}) : super(key: key);

  @override
  State<evacuationOn> createState() => _evacuationOnState();
}

class _evacuationOnState extends State<evacuationOn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF2E00),
      body: Center(
        child: GestureDetector(
          onVerticalDragUpdate: (dragUpdateDetails) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder:
                (context)=>evacuationOn()));
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("SWIPE UP",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width*0.09
                ),),
                SizedBox(height: 8,),
                Text("To activate evacuation mode",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width*0.05
                  ),),

                GestureDetector(
                  onVerticalDragUpdate: (dragUpdateDetails) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=>evacuationOff()));
                    },
                  child: Container(
                    child: Column(
                      children: [
                        // Container(
                        //   width: MediaQuery.of(context).size.width*0.6,
                        //   child: Icon(Icons.keyboard_arrow_up_outlined, color: Colors.white,),
                        // ),
                        // Icon(Icons.keyboard_arrow_up_outlined, color: Colors.white,),
                        Icon(Icons.keyboard_arrow_up_outlined, color: Colors.white,
                          size: MediaQuery.of(context).size.height*0.2,),
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

class evacuationOff extends StatefulWidget {
   evacuationOff({Key? key}) : super(key: key);

  @override
  State<evacuationOff> createState() => _evacuationOffState();
}

class _evacuationOffState extends State<evacuationOff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF2E00),
      body: Center(
        child: GestureDetector(
          onVerticalDragUpdate: (dragUpdateDetails) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder:
                (context)=>evacuationOn()));
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("EVACUATION MODE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width*0.09
                  ),),
                SizedBox(height: 8,),
                Text("Activated",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width*0.05
                  ),),

                GestureDetector(
                  onVerticalDragUpdate: (dragUpdateDetails) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:
                        (context)=>evacuationOn()));
                  },
                  child: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white,
                    size: MediaQuery.of(context).size.height*0.2,),
                ),
                SizedBox(height: 10,),
                Text("Swipe down to de-activate",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width*0.05
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
