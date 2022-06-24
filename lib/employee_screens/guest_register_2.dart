import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
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
  TextEditingController _time1 = TextEditingController();
  TextEditingController _time2 = TextEditingController();

  bool isChecked = false;
  String? _selectedTime;
  int? _selectedValueIndex;

  List<String> buttonText = ["AM", "PM"];


  @override
  void initState() {//set the initial value of text field
    super.initState();
    _time1.text = "6";
    _time2.text = "30";
    _selectedValueIndex = 0;
  }


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
              shape: const CircularNotchedRectangle(),
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
                                    (BuildContext context) => const employeeWelcome()));
                              },
                              icon: const Icon(CupertinoIcons.home, size: 30,
                                  color: Color(0xff717171))),

                          const Text("Home",
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
                                const Icon(Icons.ac_unit, color :Colors.teal);
                                Navigator
                                    .of(context)
                                    .pushReplacement(MaterialPageRoute(builder:
                                    (BuildContext context) => const guestRegister()));
                              },
                              icon: const Icon(CupertinoIcons.person_crop_circle_fill_badge_plus,
                                  size: 30,
                                  color: Color(0xff0093CB))),
                         const Text("Add guest",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff0093CB)
                            ),)
                        ],
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffE8F9FF)
                        ),
                        child: IconButton(
                          //padding: EdgeInsets.only(left:10),
                            onPressed: (){
                              Navigator
                                  .of(context)
                                  .push(MaterialPageRoute(builder:
                                  (BuildContext context) => const scanQr()));
                            },
                            icon: const Icon(CupertinoIcons.qrcode_viewfinder,  size: 40,
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
                                    (BuildContext context) => const myAttendance()));
                              },
                              icon: const Icon(CupertinoIcons.chart_bar, size: 30,
                                  color: Color(0xff717171))),
                          const Text("Attendance",
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
                                    (BuildContext context) => const employeeProfile()));
                              },
                              icon: const Icon(Icons.more_horiz_rounded, size: 30,
                                  color: Color(0xff717171))),
                          const Text("Menu",
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
                ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 15,),
                  onPressed: (){
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context)=>otpVerify()));
                  },
                  label: const Text("Cancel", style: TextStyle(
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
                                    Column(
                                      children:  [
                                        GestureDetector(
                                            onTap:(){
                                              int currentValue = int.parse(_time1.text);
                                              setState(() {
                                                currentValue++;
                                                _time1.text = (currentValue < 12? currentValue : 12)
                                                    .toString(); // incrementing value
                                              });
                                            },
                                            child: Icon(Icons.keyboard_arrow_up,
                                              color: Color(0xff2980B9),)),
                                        // Container(
                                        //   height:40,
                                        //   width: 50,
                                        //   child: TextFormField(
                                        //     keyboardType: TextInputType.numberWithOptions(
                                        //       decimal: false,
                                        //       signed: true,
                                        //     ),
                                        //
                                        //     textAlign: TextAlign.center,
                                        //     decoration: InputDecoration(
                                        //       contentPadding: EdgeInsets.all(4.0),
                                        //       enabledBorder: OutlineInputBorder(
                                        //         borderSide: BorderSide(color: Colors.white),
                                        //       ),
                                        //       focusedBorder: OutlineInputBorder(
                                        //         borderSide: BorderSide(color: Colors.white),
                                        //       ),
                                        //       focusColor: Color(0xff031627),
                                        //       border: OutlineInputBorder(
                                        //         borderRadius: BorderRadius.circular(10.0),
                                        //         borderSide: BorderSide(color: Colors.white),
                                        //       ),
                                        //     ),
                                        //     controller: _time1,
                                        //     style: TextStyle(
                                        //       fontSize: 16
                                        //   ),),
                                        // ),

                                        Text(_time1.text,
                                          style: TextStyle(
                                              fontSize: 16
                                          ),),

                                        GestureDetector(
                                            onTap:(){
                                              int currentValue = int.parse(_time1.text);
                                              setState(() {
                                                print("Setting state");
                                                currentValue--;
                                                _time1.text =
                                                    (currentValue > 1 ? currentValue : 1)
                                                        .toString(); // decrementing value
                                              });
                                            },
                                            child: Icon(Icons.keyboard_arrow_down, color: Color(0xff2980B9),))
                                      ],
                                    ),

                                    Text(":"),
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap:(){
                                              int currentValue = int.parse(_time2.text);
                                              setState(() {
                                                currentValue++;
                                                _time2.text = (currentValue < 59? currentValue : 59)
                                                    .toString(); // incrementing value
                                              });
                                            },
                                            child: Icon(Icons.keyboard_arrow_up,
                                              color: Color(0xff2980B9),)),
                                        // Container(
                                        //   height:40,
                                        //   width: 50,
                                        //   child: TextFormField(
                                        //     keyboardType: TextInputType.numberWithOptions(
                                        //       decimal: false,
                                        //       signed: true,
                                        //     ),
                                        //
                                        //     textAlign: TextAlign.center,
                                        //     decoration: InputDecoration(
                                        //       contentPadding: EdgeInsets.all(4.0),
                                        //       enabledBorder: OutlineInputBorder(
                                        //         borderSide: BorderSide(color: Colors.white),
                                        //       ),
                                        //       focusedBorder: OutlineInputBorder(
                                        //         borderSide: BorderSide(color: Colors.white),
                                        //       ),
                                        //       focusColor: Color(0xff031627),
                                        //       border: OutlineInputBorder(
                                        //         borderRadius: BorderRadius.circular(10.0),
                                        //         borderSide: BorderSide(color: Colors.white),
                                        //       ),
                                        //     ),
                                        //     controller: _time1,
                                        //     style: TextStyle(
                                        //       fontSize: 16
                                        //   ),),
                                        // ),

                                        Text(_time2.text,
                                          style: TextStyle(
                                              fontSize: 16
                                          ),),

                                        GestureDetector(
                                            onTap:(){
                                              int currentValue = int.parse(_time2.text);
                                              setState(() {
                                                print("Setting state");
                                                currentValue--;
                                                _time2.text =
                                                    (currentValue >  00? currentValue : 00)
                                                        .toString(); // decrementing value
                                              });
                                            },
                                            child: Icon(Icons.keyboard_arrow_down,
                                              color: Color(0xff2980B9),))
                                      ],
                                    ),
                                  ],
                                ),


                                Row(
                                  children: [
                                    ...List.generate(
                                      buttonText.length,
                                          (index) => button(
                                        index: index,
                                        text: buttonText[index],
                                      ),
                                    )
                                  ],
                                ),

                            // Row(
                            //   children: [
                            //
                            //     // Row(
                            //     //   children: [
                            //     //     IconButton(
                            //     //         onPressed: _show, icon: const Icon(Icons.punch_clock)),
                            //     //     Text(
                            //     //       _selectedTime != null ? _selectedTime! : 'No time selected!',
                            //     //       style: const TextStyle(fontSize: 20),
                            //     //     ),
                            //     //   ],
                            //     // ),
                            //
                            //
                            //   ],
                            // ),


                          ])
                          )],
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
                          Storage.get_date().toString().isNotEmpty ){
                        var df =  DateFormat("h:mma");
                        var dt = df.parse("${_time1.text}:${_time2.text}${_selectedValueIndex==0?"AM":"PM"}");
                        print(DateFormat('H:m:s').format(dt));
                      //  print(DateTime(Storage.get_date().year.toString()))
                        access().guestRegister(nameController.text,
                            ("+91"+phoneController.text), emailController.text,
                            companyName.text, nda, Storage.get_date().toString(),
                            "${DateFormat('H:m:s').format(dt)}").then((value) {
                              if(value["success"]){
                                Fluttertoast.showToast(
                                    msg: "${"Register done"}",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green.shade300,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                setState((){
                                  nameController.clear();
                                  phoneController.clear();
                                  emailController.clear();
                                  companyName.clear();
                                  _selectedTime = '';
                                  valuefirst = false;
                                  _time1.text = "6";
                                  _time2.text = "30";
                                });
                              } else{
                                Fluttertoast.showToast(
                                    msg: "${"Error registering"}",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red.shade300,
                                    textColor: Colors.white,
                                    fontSize: 16.0);

                                setState((){
                                  nameController.clear();
                                  phoneController.clear();
                                  emailController.clear();
                                  companyName.clear();
                                  _selectedTime = '';
                                  valuefirst = false;
                                  _time1.text = "6";
                                  _time2.text = "30";
                                });
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

  Widget button({required String text, required int index}) {
    return InkWell(
      splashColor: Colors.cyanAccent,
      onTap: () {
        setState(() {
          _selectedValueIndex = index;
          print(_selectedValueIndex);
          print(_selectedValueIndex==0?"AM":"PM");
        });
      },
      child: Container(

        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: index == _selectedValueIndex ? Color(0xff9FE6FF) : Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        //color: index == _selectedValueIndex ? Colors.blue : Colors.white,
        child: Text(
          text,
          style: TextStyle( fontSize:16,
            color: index == _selectedValueIndex ? Colors.black : Colors.black,
          ),
        ),
      ),
    );
  }

}


class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}