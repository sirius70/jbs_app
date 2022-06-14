import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jbs_app/api/access.dart';
import 'package:jbs_app/models/login_model.dart';
import 'package:jbs_app/screens/onboarding_4.dart';
import 'package:pinput/pinput.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../admin/admin_profile.dart';
import '../manager/more.dart';
import '../employee_screens/employee_welcome_1.dart';
import '../models/contractor_count_model.dart';
import '../models/delivery_count_model.dart';
import '../models/profile_model.dart';
import '../models/visitor_count_model.dart';
import '../storage.dart';

class otpVerify extends StatefulWidget {
   otpVerify({Key? key, required this.phoneNo}) : super(key: key);
  final String phoneNo;

  @override
  State<otpVerify> createState() => _otpVerifyState();
}

class _otpVerifyState extends State<otpVerify> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOtpController = TextEditingController();
  final FocusNode _pinOtpFocus = FocusNode();
  String? verificationCode;
  FirebaseMessaging? messaging = FirebaseMessaging.instance;


  final BoxDecoration pinOtpCodeDecoration = BoxDecoration(
      color: Color(0xff005993),
      borderRadius: BorderRadius.circular(12)
  );

  @override
  void initState(){
    super.initState();

    verifyPhoneNumber();
  }

  verifyPhoneNumber() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${widget.phoneNo}",
        verificationCompleted: (PhoneAuthCredential credential) async{
          await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
            if(value.user != null){

              Fluttertoast.showToast(
                  msg: "${"Invalid OTP"}",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red.shade400,
                  textColor: Colors.white,
                  fontSize: 16.0);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>onBoarding()));
            }
          });
        },
        verificationFailed: (FirebaseAuthException e){
          Fluttertoast.showToast(
              msg: "${"Invalid OTP"}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red.shade400,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        codeSent: (String vid, int? resendToken){
          setState((){
            verificationCode = vid;
          });
        },
        codeAutoRetrievalTimeout: (String vid){
          setState((){
            verificationCode = vid;
          });
        },
      timeout: Duration(seconds: 60)
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 130,),
            GradientText(
              'JBS', textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 75.0,
                fontWeight: FontWeight.bold
              ),
              colors: [
                Color(0xff005993).withOpacity(0.6),
                Color(0xff005993)
              ],
            ),
           // Image.asset("assets/images/jbs.jpg"),

            SizedBox(height: MediaQuery.of(context).size.height*0.08,),
            Padding(padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("OTP VERIFICATION",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15, letterSpacing: 1
                    ),),

                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter the OTP sent to - ",
                        style: TextStyle(
                            fontSize: 12.5,
                        ),),
                      Text("+91-${widget.phoneNo}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.5,
                        ),),
                    ],
                  ),
                ],
              ),
            ),

            Padding(padding: EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 20),
            child: Pinput(
              length: 6,
              controller: _pinOtpController,
              focusNode: _pinOtpFocus,
              followingPinTheme: PinTheme(
                width: 55,
                height: 55,
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(12)
                ),
              ),
              submittedPinTheme: PinTheme(
                width: 55,
                height: 55,
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(12)
                ),
              ),
              defaultPinTheme:  PinTheme(
                width: 55,
                height: 55,
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(12)
                ),
            ),

              onSubmitted: (pin) async{
                print("pin:$pin");
              },
            ),
            ),

            SizedBox(height: 10,),
            Text("00:20 Sec", style: TextStyle(
                color: Color(0xff464646),
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't receive code? ", style: TextStyle(
                    color: Color(0xff5A5A5A)
                ),),
                GestureDetector(
                  onTap: (){
                    verifyPhoneNumber();
                  },
                  child: Text("Re-send",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2980B9)
                    ),),
                )
              ],
            ),

            SizedBox(height: 50,),

            Container(
              height: MediaQuery.of(context).size.width*0.14,
              width: MediaQuery.of(context).size.width*0.8,
              child: ElevatedButton(
                onPressed: () async{
                  var deviceToken = await messaging!.getToken();
                  print("dev token: $deviceToken");
                  access().regDevToken(deviceToken.toString());
                  print(_pinOtpController.text);
                  try{
                    await FirebaseAuth.instance.signInWithCredential(
                        PhoneAuthProvider.credential(verificationId: verificationCode!,
                            smsCode: _pinOtpController.text)).then((value) async{
                      var tokenId = await value.user!.getIdToken();

                      print("tokenId:$tokenId");
                      if(value.user != null) {
                        print("+91"+widget.phoneNo);
                        access().loginPhone2(("+91"+widget.phoneNo).toString(), tokenId).then((value) async{
                          if (value["success"]) {
                            LoginApi loginApiRes = await LoginApi.fromJson(value);
                            final empId = loginApiRes.data!.employeeId;
                            final location = loginApiRes.data!.locations[0].name;
                            final token = loginApiRes.tokens!.accessToken;
                            final isAdmin = loginApiRes.data!.isAdmin;
                            final isManager = loginApiRes.data!.isManager;
                            final locationID = loginApiRes.data!.locations![0].locationId;
                            Storage.set_locationID(locationID.toString());

                            Storage.set_accessToken(token.toString());

                            Storage.set_adminEmpID(empId.toString());

                            Storage.set_location(location.toString());


                            Fluttertoast.showToast(
                                msg: "${"Logged in successfully"}",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green.shade400,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return Scaffold(
                                        backgroundColor: Colors.white,
                                        body: Center(
                                          child:
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [


                                              Text("Select Mode", style: TextStyle(
                                                  color: Color(0xff005993), letterSpacing: 1,
                                                  fontSize: 18
                                              ),),

                                              SizedBox(height: 40,),


                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder:
                                                          (context)=>employeeWelcome()));
                                                },
                                                child: Text("Employee", style: TextStyle(
                                                    color: Color(0xff005993), letterSpacing: 1,
                                                    fontSize: 40
                                                ),),
                                              ),
                                              SizedBox(height: 30,),

                                              if(isManager == 1)...[
                                                GestureDetector(
                                                  onTap: () {
                                                    access().profile().then((value) async{
                                                      if(value["success"]) {
                                                        ProfileApi profile = await ProfileApi.fromJson(value);
                                                        final name = profile.data.name;
                                                        Storage.set_name(name);
                                                      }
                                                    });

                                                    access().deliveryTodayCount().then((value) async{
                                                      if(value["success"]){
                                                        DeliveryTodaysCount deliveryCount = await DeliveryTodaysCount.fromJson(value);
                                                        final deliCount = deliveryCount.data[0].count;
                                                        print(deliCount);
                                                        Storage.set_deliveryCount(deliCount.toString());
                                                      }
                                                    });

                                                    access().visitorTodayCount().then((value) async{
                                                      if(value["success"]){
                                                        VisitorTodaysCount visitorCount = await VisitorTodaysCount.fromJson(value);
                                                        final visitCount = visitorCount.visitorInsideToday[0].count;
                                                        final totalVisitCount = visitorCount.totalVisitorVisitedToday[0].count;
                                                        print("${visitCount}, ${totalVisitCount }");
                                                        Storage.set_visitorCount(visitCount.toString());
                                                        Storage.set_totalVisitorCount(totalVisitCount.toString());
                                                      }
                                                    });

                                                    access().contractorTodayCount().then((value) async{
                                                      if(value["success"]){
                                                        ContractorTodaysCount contractorCount = await ContractorTodaysCount.fromJson(value);
                                                        final contracCount = contractorCount.contractorInsideToday[0].count;
                                                        final totalContracCount = contractorCount.totalContractorVisitedToday[0].count;
                                                        print("${contracCount}, ${totalContracCount }");
                                                        Storage.set_contractorCount(contracCount.toString());
                                                        Storage.set_totalContractorCount(totalContracCount.toString());
                                                      }
                                                    });
                                                    Navigator.push(context,
                                                        MaterialPageRoute(builder:
                                                            (context) =>
                                                            More()
                                                          //   Home2(empId: Storage.get_adminEmpID().toString(),
                                                          // location: Storage.get_location().toString(),)
                                                        ));

                                                  },
                                                  child: Text("Manager", style: TextStyle(
                                                      color: Color(0xff005993), letterSpacing: 1,
                                                      fontSize: 50,
                                                      fontWeight: FontWeight.bold
                                                  ),),
                                                ),
                                              ],

                                              SizedBox(height: 30,),

                                              if(isAdmin == 1)...[
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(builder:
                                                            (context) => adminProfile()));
                                                  },
                                                  child: Text("Admin", style: TextStyle(
                                                      color: Color(0xff005993), letterSpacing: 1,
                                                      fontSize: 40
                                                  ),),
                                                ),
                                              ],
                                            ],
                                          ),
                                        )
                                    );
                                  }));
                            });
                          } else{
                            Fluttertoast.showToast(
                                msg: "${"Invalid credentials"}",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red.shade400,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          // Fluttertoast.showToast(
                          //     msg: "${"Logged in successfully"}",
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.BOTTOM,
                          //     timeInSecForIosWeb: 1,
                          //     backgroundColor: Colors.green.shade400,
                          //     textColor: Colors.white,
                          //     fontSize: 16.0);

                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context)=>onBoarding()));
                        });



                      }
                    });

                  }catch(e){
                    FocusScope.of(context).unfocus();
                    Fluttertoast.showToast(
                        msg: "${"Invalid OTP"}",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red.shade400,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }

                },
                child: Text("Submit"),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(color: Color(0xff005993))
                        )
                    ),
                    backgroundColor: MaterialStateProperty.all(Color(0xff005993),)
                ),
              ),
            )

            ],
        ),
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: Color(0xffEFEFEF),
          borderRadius: BorderRadius.circular(12)
      ),
      width: 55,
      child: TextField(
        // autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: true,
        readOnly: false,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          fillColor: Color(0xffEFEFEF),
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Color(0xffEFEFEF)),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Color(0xffEFEFEF)),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}




