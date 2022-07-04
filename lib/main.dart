import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jbs_app/admin/usersList.dart';
import 'package:jbs_app/screens/splash_screen_1.dart';
import 'package:jbs_app/storage.dart';
import 'package:get/get_navigation/get_navigation.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Storage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          crossAxisMargin: 3,
          thumbVisibility: MaterialStateProperty.all(true),
          thickness: MaterialStateProperty.all(8),
          trackVisibility: MaterialStateProperty.all(true),
          trackColor: MaterialStateProperty.all(Color(0xffD9F1FF)),
          thumbColor: MaterialStateProperty.all(Color(0xff00A3FF)),
        ),),
        // debugShowCheckedModeBanner: false,
        // home: const MyHomePage(),
     home: splash1(),
      routes: {
        'userLists':(context)=>UsersLists()
      },
    );
  }
}


