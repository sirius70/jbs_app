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
  bool valuesecond = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController deptController = TextEditingController();

  bool loading = true;

  var isManager;
  var isAdmin;

  SharedPreferencesInit() async {
    await Storage.init();
  }

  @override
  void initState(){
    super.initState();
    loading = false;
    SharedPreferencesInit();
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
      body: loading? Center(child: CircularProgressIndicator(),):
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding:  EdgeInsets.all(15.0),
              child: Text(
                'Create User\nAccount',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff005993),
                    fontSize: 35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                validator: (value){
                  RegExp regex = new RegExp(r'^.{3,}$');
                  if(value!.isEmpty){
                    return("Name is required");
                  }
                  if(!regex.hasMatch(value)){
                    return("Please enter valid name(Min. 3 characters)");
                  }
                  return null;
                },
                onSaved: (value){
                  nameController.text = value!;
                },
                textInputAction: TextInputAction.next,
                controller: nameController,
                decoration: InputDecoration(hintText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                maxLength: 10,
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value!.isEmpty){
                    return("Please enter phone number");
                  }
                  if(!RegExp("^[0-9]").hasMatch(value)){
                    return("Please enter valid phone number");
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onSaved: (value){
                  phoneController.text = value!;
                },
                controller: phoneController,
                decoration: InputDecoration(hintText: 'Phone No'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if(value!.isEmpty){
                    return("Please enter email");
                  }
                  if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                    return("Please enter valid email");
                  }
                  return null;
                },
                onSaved: (value){
                  emailController.text = value!;
                },
                textInputAction: TextInputAction.next,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                validator: (value){
                  RegExp regex = new RegExp(r'^.{3,}$');
                  if(value!.isEmpty){
                    return("Department is required");
                  }
                  if(!regex.hasMatch(value)){
                    return("Please enter valid name(Min. 3 characters)");
                  }
                  return null;
                },
                onSaved: (value){
                  deptController.text = value!;
                },
                textInputAction: TextInputAction.next,
                controller:deptController,
                decoration: InputDecoration(hintText: 'Department'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                validator: (value){
                  RegExp regex = new RegExp(r'^.{3,}$');
                  if(value!.isEmpty){
                    return("Address is required");
                  }
                  if(!regex.hasMatch(value)){
                    return("Please enter valid name(Min. 3 characters)");
                  }
                  return null;
                },
                onSaved: (value){
                  addressController.text = value!;
                },
                textInputAction: TextInputAction.next,
                controller: addressController,
                decoration: InputDecoration(hintText: 'Address'),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: TextFormField(
            //     keyboardType: TextInputType.name,
            //     validator: (value){
            //       RegExp regex = new RegExp(r'^.{3,}$');
            //       if(value!.isEmpty){
            //         return("location is required for sign up");
            //       }
            //       if(!regex.hasMatch(value)){
            //         return("Please enter valid name(Min. 3 characters)");
            //       }
            //       return null;
            //     },
            //     onSaved: (value){
            //       locationController.text = value!;
            //     },
            //     textInputAction: TextInputAction.next,
            //     controller: locationController,
            //     decoration: InputDecoration(hintText: 'Location'),
            //   ),
            // ),

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

            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("Is he a admin?"),
            //       Checkbox(
            //         checkColor: Colors.greenAccent,
            //         activeColor: Colors.red,
            //         value: this.valuesecond,
            //         onChanged: (bool? value) {
            //           setState(() {
            //             this.valuesecond = value!;
            //             print(valuesecond);
            //           });
            //         },
            //       ),
            //     ],
            //   ),
            // ),

            Center(
              child: TextButton(
                onPressed: () {
                  if(nameController.text.isNotEmpty && phoneController.text.isNotEmpty
                  && emailController.text.isNotEmpty && deptController.text.isNotEmpty
                  && addressController.text.isNotEmpty){

                    if (valuefirst.toString() == "true"){
                      isManager = "1";
                    }
                    else if (valuefirst.toString() == "false"){
                      isManager = "0";
                    }

                    // if (valuesecond.toString() == "true"){
                    //   isAdmin = "1";
                    // }
                    // else if (valuefirst.toString() == "false"){
                    //   isAdmin = "0";
                    // }

                    valuesecond.toString() == "true"?isAdmin = "1":isAdmin = "0";
                    print(isAdmin);

                    access().createEmployee(nameController.text, ("+91"+phoneController.text).toString(),
                        emailController.text, valuefirst==true?"1":"0",
                    6, deptController.text, addressController.text).then((value) async{
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

                            setState((){
                              nameController.clear();
                              emailController.clear();
                              phoneController.clear();
                              deptController.clear();
                              addressController.clear();
                              valuefirst = false;
                              valuesecond = false;
                            });

                          } else {
                            // CreateEmpRes createEmpRes = await CreateEmpRes.fromJson(value);
                            // final msg = createEmpRes.message;
                            print("msg: ${value["message"]}");
                            Fluttertoast.showToast(
                                msg: "${value["message"]}",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red.shade400,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            nameController.clear();
                            emailController.clear();
                            phoneController.clear();
                            deptController.clear();
                            addressController.clear();
                            valuefirst = false;
                            valuesecond = false;

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
      ),
    );
  }
}


