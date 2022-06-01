import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jbs_app/screens/login_2.dart';

class splash1 extends StatefulWidget {
  const splash1({Key? key}) : super(key: key);

  @override
  State<splash1> createState() => _splash1State();
}

class _splash1State extends State<splash1> {

  bool _isVisible = false;
  _splash1State() {
    new Timer(const Duration(milliseconds: 2500), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => loginScreen()),
                (route) => false);
      });
    });

    new Timer(Duration(milliseconds: 15), () {
      setState(() {
        _isVisible = true; //shows fade effect and navigating to login page
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF0000),
      body: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 2000),
        child: Center(
          child: Text(
            "JBS", style: TextStyle(
            color: Colors.white,
            height: 1.25,
            fontSize: 60, fontWeight: FontWeight.bold,
          ),
          ),
        ),
      ),
    );
  }
}

class splash2 extends StatefulWidget {
  const splash2({Key? key}) : super(key: key);

  @override
  State<splash2> createState() => _splash2State();
}

class _splash2State extends State<splash2> {

  bool _isVisible = false;
  _splash2State() {
    new Timer(const Duration(milliseconds: 2500), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => loginScreen()),
                (route) => false);
      });
    });

    new Timer(Duration(milliseconds: 15), () {
      setState(() {
        _isVisible = true; //shows fade effect and navigating to login page
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFECE2F),
      body: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 2000),
        child: Center(
          child: Text(
            "JBS", style: TextStyle(
            color: Colors.white,
            height: 1.25,
            fontSize: 60, fontWeight: FontWeight.bold,
          ),
          ),
        ),
      ),
    );
  }
}

class splash3 extends StatefulWidget {
  const splash3({Key? key}) : super(key: key);

  @override
  State<splash3> createState() => _splash3State();
}

class _splash3State extends State<splash3> {
  bool _isVisible = false;
  _splash3State() {
    new Timer(const Duration(milliseconds: 2500), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => loginScreen()),
                (route) => false);
      });
    });

    new Timer(Duration(milliseconds: 15), () {
      setState(() {
        _isVisible = true; //shows fade effect and navigating to login page
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 2000),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          decoration:  BoxDecoration(
            gradient:  LinearGradient(
              colors:  [
                Color(0xff0487FF).withOpacity(0.8),
                 Color(0xff00E0FF).withOpacity(0.5),
                  Color(0xff0487FF).withOpacity(0.8),
                 Color(0xff00E0FF).withOpacity(0.5),
                 Color(0xff0487FF).withOpacity(0.8),
              ],
               tileMode: TileMode.clamp,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Text(
              "JBS", style: TextStyle(
              color: Colors.white,
              fontSize: 60, fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ),
      ),

    );
  }
}

class CircularBackgroundPainter extends CustomPainter {
  final Paint mainPaint;
  final Paint middlePaint;
  final Paint lowerPaint;
  CircularBackgroundPainter()
      : mainPaint = new Paint(),
        middlePaint = new Paint(),
        lowerPaint = new Paint() {
    mainPaint.color =  Color(0xff00E0FF);
    mainPaint.isAntiAlias = true;
    mainPaint.style = PaintingStyle.fill;
    middlePaint.color =  Color(0xffFF00FF);
    middlePaint.isAntiAlias = true;
    middlePaint.style = PaintingStyle.fill;
    lowerPaint.color =  Color(0xffFDE5FF);
    lowerPaint.isAntiAlias = true;
    lowerPaint.style = PaintingStyle.fill;
  }
  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();
    //canvas.translate(radius, radius);
    drawBellAndLeg(radius, canvas, size);
    canvas.restore();
  }
  void drawBellAndLeg(radius, canvas, Size size) {
    Path upperPath = new Path();
    upperPath.addRect(Rect.fromLTRB(0, 0, size.width, size.height / 4));
    upperPath.addArc(
        Rect.fromLTRB(-140, 40, size.width + 50, size.height / 1.95), 0.1, 30);
    Path middlePath = new Path();
    middlePath.addRect(Rect.fromLTRB(0, 0, size.width, size.height / 4));
    middlePath.addArc(
        Rect.fromLTRB(-135, 0, size.width + 50, size.height / 2.2), 0.1, 30);
    Path lowerPath = new Path();
    //path1.lineTo(size.width, 0);
    //path1.lineTo(size.width, size.height / 3);
    //path1.addOval(Rect.fromLTRB(-150, 100, size.width + 50, size.height / 2));
    lowerPath.addRect(Rect.fromLTRB(0, 0, size.width, size.height / 5));
    lowerPath.addArc(
        Rect.fromLTRB(-150, -100, size.width + 50, size.height / 2.5), 0.1, 30);
    //path1.quadraticBezierTo(0, size.height / 3, size.width, size.height / 3);
    canvas.drawPath(upperPath, lowerPaint);
    canvas.drawPath(middlePath, middlePaint);
    canvas.drawPath(lowerPath, mainPaint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

