import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jbs_app/employee_screens/profile_page_3.dart';
import 'package:jbs_app/employee_screens/scan_qr.dart';
import 'package:jbs_app/employee_screens/widgets/calendar_guest.dart';

import '../api/access.dart';
import '../storage.dart';
import 'employee_welcome_1.dart';
import 'my_attendance.dart';

class guestRegister extends StatefulWidget {
  const guestRegister({Key? key}) : super(key: key);

  @override
  State<guestRegister> createState() => _guestRegisterState();
}

class _guestRegisterState extends State<guestRegister> {
  var items = ['Phaico',
    'Accenture', 'Amazon',
    'Phai-one'];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController companyName = TextEditingController();
  String? _selectedTime;

  Future<void> _show() async {
    final TimeOfDay? result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  var nda;
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
            color: Colors.white,
            child: BottomAppBar(
              shape: CircularNotchedRectangle(),
              color: Colors.transparent,
              elevation: 0,
              child: SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        children: [
                          IconButton(
                              onPressed: (){
                                Navigator
                                    .of(context)
                                    .push(MaterialPageRoute(builder:
                                    (BuildContext context) => employeeWelcome()));
                              },
                              icon: Icon(CupertinoIcons.home, size: 30,
                                  color: Color(0xff717171))),

                          Text("Home",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff717171)
                            ),)
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            //padding: EdgeInsets.only(left:10),
                              onPressed: (){
                                Icon(Icons.ac_unit, color :Colors.teal);
                                Navigator
                                    .of(context)
                                    .pushReplacement(MaterialPageRoute(builder:
                                    (BuildContext context) => guestRegister()));
                              },
                              icon: Icon(CupertinoIcons.person_crop_circle_fill_badge_plus,
                                  size: 30,
                                  color: Color(0xff0093CB))),
                          Text("Add guest",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff0093CB)
                            ),)
                        ],
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffE8F9FF)
                        ),
                        child: IconButton(
                          //padding: EdgeInsets.only(left:10),
                            onPressed: (){
                              Navigator
                                  .of(context)
                                  .push(MaterialPageRoute(builder:
                                  (BuildContext context) => scanQr()));
                            },
                            icon: Icon(CupertinoIcons.qrcode_viewfinder,  size: 40,
                                color: Color(0xff717171))),
                      ),
                      Column(
                        children: [
                          IconButton(
                            //padding: EdgeInsets.only(left:10),
                              onPressed: (){
                                Navigator
                                    .of(context)
                                    .push(MaterialPageRoute(builder:
                                    (BuildContext context) => myAttendance()));
                              },
                              icon: Icon(CupertinoIcons.chart_bar, size: 30,
                                  color: Color(0xff717171))),
                          Text("Attendance",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff717171)
                            ),)
                        ],
                      ),

                      Column(
                        children: [
                          IconButton(
                            //padding: EdgeInsets.only(left:10),
                              onPressed: (){
                                Navigator
                                    .of(context)
                                    .push(MaterialPageRoute(builder:
                                    (BuildContext context) => employeeProfile()));
                              },
                              icon: Icon(Icons.more_horiz_rounded, size: 30,
                                  color: Color(0xff717171))),
                          Text("Menu",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff717171)
                            ),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 15,),
                    onPressed: (){
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context)=>otpVerify()));
                    },
                    label: Text("Cancel", style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(color: Color(0xff005993))
                            )
                        ),
                        backgroundColor: MaterialStateProperty.all(Color(0xff005993),)
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [new BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 5.0,
                          ),]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Pre-register a guest",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff005993)
                            ),),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text("Enter guest details.",
                                  style: TextStyle(
                                    color: Color(0xff000388)
                                  ),),
                                ),
                                
                                SizedBox(height: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [new BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 5.0,
                                  ),]
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Name"),
                                      Flexible(
                                        child: Container(
                                          height: 35,
                                          width: 200,
                                          child: TextFormField(
                                            controller: nameController,
                                            cursorColor: Color(0xff031627),
                                            decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.all(10.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              focusColor: Color(0xff031627),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 18,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Company"),
                                      Flexible(
                                        child: Container(
                                          height: 35,
                                          width: 200,
                                          child: TextFormField(
                                            controller: companyName,
                                            cursorColor: Color(0xff031627),
                                            decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.all(10.0),
                                              suffixIcon: Container(
                                                //margin: EdgeInsets.only(left: 10),
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                      left: BorderSide(color: Colors.grey),
                                                    )
                                                ),
                                                child: PopupMenuButton<String>(
                                                  icon: const Icon(Icons.arrow_drop_down),
                                                  onSelected: (String value) {
                                                    companyName.text = value;
                                                  },
                                                  itemBuilder: (BuildContext context) {
                                                    return items
                                                        .map<PopupMenuItem<String>>((String value) {
                                                      return new PopupMenuItem(
                                                          child: new Text(value), value: value);
                                                    }).toList();
                                                  },
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              focusColor: Color(0xff031627),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 18,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Phone"),
                                      Flexible(
                                        child: Container(
                                          height: 35,
                                          width: 200,
                                          child: TextFormField(
                                            controller: phoneController,
                                            cursorColor: Color(0xff031627),
                                            decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.all(10.0),
                                              prefixIcon: Container(
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.only(right: 10),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    right: BorderSide(color: Colors.grey),
                                                  )
                                                ),
                                                child: Text("+91"),
                                              ),

                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              focusColor: Color(0xff031627),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 18,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Email"),
                                      Flexible(
                                        child: Container(
                                          height: 35,
                                          width: 200,
                                          child: TextFormField(
                                            controller: emailController,
                                            cursorColor: Color(0xff031627),
                                            decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.all(10.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              focusColor: Color(0xff031627),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),




                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Nda Sign?"),
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

                                ],
                              ),
                            ),


                                SizedBox(height: 20,),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Add more +', textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff00A3FF),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                
                                Padding(
                                  padding: const EdgeInsets.only(top: 10, left: 5),
                                  child: Text("Enter date & time", style:
                                    TextStyle(
                                      color: Color(0xff092F52)
                                    ),),
                                ),

                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [new BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              blurRadius: 5.0,
                            ),]
                        ),
                      child: Column(
                        children: [
                          MyHomePage(title: "hello"),
                          SizedBox(height: 20,),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("at", style: TextStyle(
                                  fontSize: 16
                                ),),


                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: _show, icon: const Icon(Icons.punch_clock)),
                                    Text(
                                      _selectedTime != null ? _selectedTime! : 'No time selected!',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),


                                // Row(
                                //   children: [
                                //     Column(
                                //       children: const [
                                //         Icon(Icons.keyboard_arrow_up, color: Color(0xff2980B9),),
                                //         Text("11", style: TextStyle(
                                //             fontSize: 16
                                //         ),),
                                //         Icon(Icons.keyboard_arrow_down, color: Color(0xff2980B9),)
                                //       ],
                                //     ),
                                //
                                //     Text(":"),
                                //     Column(
                                //       children:const [
                                //         Icon(Icons.keyboard_arrow_up, color: Color(0xff2980B9)),
                                //         Text("38", style: TextStyle(
                                //             fontSize: 16
                                //         ),),
                                //         Icon(Icons.keyboard_arrow_down, color: Color(0xff2980B9))
                                //       ],
                                //     ),
                                //   ],
                                // ),



                                // Row(
                                //   children: [
                                //     Container(
                                //       padding: EdgeInsets.all(10),
                                //       decoration: BoxDecoration(
                                //           color: Color(0xff9FE6FF),
                                //           borderRadius: BorderRadius.circular(10)
                                //       ),
                                //       child: Text("AM", style: TextStyle(
                                //           fontSize:16
                                //       ),),
                                //     ),
                                //
                                //     SizedBox(width: 10,),
                                //
                                //     Container(
                                //       padding: EdgeInsets.all(10),
                                //       decoration: BoxDecoration(
                                //           color: Colors.white,
                                //           borderRadius: BorderRadius.circular(10)
                                //       ),
                                //       child: Text("PM", style: TextStyle(
                                //           fontSize:16
                                //       ),),
                                //     )
                                //   ],
                                // )



                              ],
                            ),
                          )
                        ],
                      )
                      ),

                                SizedBox(
                                  height: 20,
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 10, left: 10),
                                  child: Text("Purpose of visit", style:
                                  TextStyle(
                                      color: Color(0xff000388)
                                  ),),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: TextField(
                                      textInputAction: TextInputAction.newline,
                                      keyboardType: TextInputType.multiline,
                                      minLines: null,
                                      maxLines: 6,
                                      cursorColor: Color(0xff031627),
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(10.0),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        focusColor: Color(0xff031627),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                         borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),

                SizedBox(height: 30,),
                Container(
                  // decoration: BoxDecoration(
                  //   color: Color(0xffFF0000)
                  // ),
                  height: MediaQuery.of(context).size.width*0.14,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: (){
                      if (valuefirst.toString() == "true"){
                        nda = "1";
                      }
                      else if (valuefirst.toString() == "false"){
                        nda = "0";
                      }

                      if(nameController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty && emailController.text.isNotEmpty &&
                      companyName.text.isNotEmpty &&
                          Storage.get_date().toString().isNotEmpty && _selectedTime!.isNotEmpty){
                        access().guestRegister(nameController.text,
                            ("+91"+phoneController.text), emailController.text,
                            companyName.text, nda, Storage.get_date().toString(), _selectedTime).then((value) {
                              if(value["success"]){
                                Fluttertoast.showToast(
                                    msg: "${"Register done"}",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                nameController.clear();
                                phoneController.clear();
                                emailController.clear();
                                companyName.clear();
                                _selectedTime = '';
                                valuefirst = false;
                              } else{
                                Fluttertoast.showToast(
                                    msg: "${"Error registering"}",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                        });
                      } else{
                        Fluttertoast.showToast(
                            msg: "${"Fields cannot be empty"}",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }


                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context)=>scanQr()));
                    },
                    child: Text("Confirm"),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: BorderSide(color: Color(0xff2980B9))
                            )
                        ),
                        backgroundColor: MaterialStateProperty.all(Color(0xff2980B9),)
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
