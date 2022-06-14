import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jbs_app/api/access.dart';
import 'package:jbs_app/models/create_employee_model.dart';

import '../storage.dart';

class Create_user extends StatefulWidget {
  const Create_user({Key? key}) : super(key: key);

  @override
  State<Create_user> createState() => _Create_userState();
}

class _Create_userState extends State<Create_user> {
  bool valuefirst = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var isManager;

  SharedPreferencesInit() async {
    await Storage.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        title: Text(
          'Add user',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Create User\nAccount',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xff005993),
                  fontSize: 35),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(hintText: 'Phone No'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'E-mail'),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Is he a manager?"),
                Checkbox(
                  checkColor: Colors.greenAccent,
                  activeColor: Colors.red,
                  value: this.valuefirst,
                  onChanged: (bool? value) {
                    setState(() {
                      this.valuefirst = value!;
                      print(valuefirst);
                    });
                  },
                ),
              ],
            ),
          ),

          Center(
            child: TextButton(
              onPressed: () {
                if(nameController.text.isNotEmpty && phoneController.text.isNotEmpty
                && emailController.text.isNotEmpty){

                  if (valuefirst.toString() == "true"){
                    isManager = "1";
                  }
                  else if (valuefirst.toString() == "false"){
                    isManager = "0";
                  }
                  access().createEmployee(nameController.text, ("+91"+phoneController.text).toString(),
                      emailController.text, isManager).then((value) async{
                        print(value["success"]);
                        if (value["success"]){
                          CreateEmpRes createEmpRes = await CreateEmpRes.fromJson(value);
                          final msg = createEmpRes.message;
                          Fluttertoast.showToast(
                              msg: "${msg}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green.shade400,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          nameController.clear();
                          emailController.clear();
                          phoneController.clear();
                          valuefirst = false;
                          setState((){

                          });
                        } else {
                          CreateEmpRes createEmpRes = await CreateEmpRes.fromJson(value);
                          final msg = createEmpRes.message;
                          print("msg: $msg");
                          Fluttertoast.showToast(
                              msg: "${msg}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red.shade400,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          nameController.clear();
                          emailController.clear();
                          phoneController.clear();
                          valuefirst = false;
                          setState((){

                          });
                        }
                  } );
                }else{
                  Fluttertoast.showToast(
                      msg: "${"Fields cannot be empty"}",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }

              },
              child: Text('Done', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xff005993))),
            ),
          )
        ],
      ),
    );
  }
}


