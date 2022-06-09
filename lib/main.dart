import 'package:flutter/material.dart';
import 'package:jbs_app/manager/approvereq.dart';
import 'package:jbs_app/screens/splash_screen_1.dart';
import 'package:jbs_app/storage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Storage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        // debugShowCheckedModeBanner: false,
        // home: const MyHomePage(),
     home: //Approve_req()
      splash1()
    );
  }
}


