
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../api/access.dart';
import '../models/admin_issues_list.dart';
import '../storage.dart';

class adminServiceRequests extends StatefulWidget {
  const adminServiceRequests({Key? key}) : super(key: key);

  @override
  State<adminServiceRequests> createState() => _adminServiceRequestsState();
}

class _adminServiceRequestsState extends State<adminServiceRequests> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = true;
  AdminIssuesList? issuesList;
  TextEditingController feedbackController = TextEditingController();

  @override
  void initState(){
    super.initState();
    loading = false;
    feedbackController.text = '';

    access().getIssuesList().then((value) async{
      print("value: $value");
      setState(() {
        issuesList = AdminIssuesList.fromJson(value);
      });
      loading = false;
      print("issues list: ${issuesList!.data[0]}");

    });

  }

  SharedPreferencesInit() async {
    await Storage.init();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.only(left:3.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: const[
                          Icon(Icons.arrow_back_ios,
                              color: Color(0xff005993), size: 12),
                          Text("back",
                            style: TextStyle(
                              fontSize: 12,
                                color: Color(0xff005993)
                            ),)
                        ],
                      ),
                    ),
                  );
                }
            ),
            title: const Text(
              'Service Requests',
              style: TextStyle(color: Color(0xff005993)),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: loading?
          Center(child: CircularProgressIndicator(),):
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    issuesList==null?
                    Center(child:Text("No requests"),): issuesList!.data.length==0?
                    Center(child: Text("No requests")):

                    Expanded(
                        child: ListView.separated(
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: 20,
                              );
                            },
                            itemCount: issuesList!.data.length,
                            itemBuilder: (context, index){
                              return Container(
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image(
                                                image: AssetImage('lib/images/face3.png'),
                                                height: MediaQuery.of(context).size.width*0.16,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width*0.025,
                                              ),

                                              Container(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(issuesList!.data[index].name.toString(), style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: MediaQuery.of(context).size.width*0.0375,
                                                        backgroundColor: Colors.grey.shade300
                                                    ),),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text("Employee", style: TextStyle(
                                                        fontSize: MediaQuery.of(context).size.width*0.0375,
                                                        backgroundColor: Colors.grey.shade300
                                                    ),),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text("App-QR error", style: TextStyle(
                                                        fontSize: MediaQuery.of(context).size.width*0.0375,
                                                        backgroundColor: Colors.grey.shade300
                                                    ),),

                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),

                                          TextButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                                          content: Container(
                                                            //padding: EdgeInsets.all(10),
                                                            width: MediaQuery.of(context).size.width,
                                                            height: MediaQuery.of(context).size.height*0.5,
                                                            decoration:const BoxDecoration(
                                                              shape: BoxShape.rectangle,
                                                              color:  Color(0xFFFFFF),
                                                            ),
                                                            child: SingleChildScrollView(
                                                              child: Center(
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child: Column(
                                                                            mainAxisSize: MainAxisSize.min,
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text("${issuesList!.data[index].name}",
                                                                                style: TextStyle(
                                                                                  color: Color(0xff005993),
                                                                                  fontSize:  MediaQuery.of(context).size.width*0.045,
                                                                                ),),
                                                                              SizedBox(height: 4,),
                                                                              Text("Employee", style:TextStyle(
                                                                                  fontSize: MediaQuery.of(context).size.width*0.03
                                                                              )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child: Align(
                                                                            alignment: Alignment.topRight,
                                                                            child: Text("App-QR error",style:TextStyle(
                                                                                fontSize: MediaQuery.of(context).size.width*0.05
                                                                            )),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),

                                                                    SizedBox(height: 20,),

                                                                    Text("Description",
                                                                      style: TextStyle(
                                                                        fontSize: MediaQuery.of(context).size.width*0.04,
                                                                      ),),
                                                                    SizedBox(height: 10,),

                                                                    Text(issuesList!.data[index].issueElaboration,
                                                                        textAlign: TextAlign.justify,
                                                                        style:  TextStyle(
                                                                            fontSize: MediaQuery.of(context).size.width*0.0375
                                                                        )),

                                                                    SizedBox(height: 20,),

                                                                    // Row(
                                                                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                    //   children: [
                                                                    //     Row(
                                                                    //       children: [
                                                                    //         Container(
                                                                    //           height: MediaQuery.of(context).size.width*0.045,
                                                                    //           width: MediaQuery.of(context).size.width*0.045,
                                                                    //           decoration: BoxDecoration(
                                                                    //               shape: BoxShape.circle,
                                                                    //               border: Border.all(color: Color(0xff005993),
                                                                    //                   width: 4
                                                                    //               )
                                                                    //           ),
                                                                    //         ),
                                                                    //
                                                                    //         SizedBox(width: MediaQuery.of(context).size.width*0.0175,),
                                                                    //
                                                                    //         Text("Pending",
                                                                    //           style: TextStyle(
                                                                    //               fontSize: MediaQuery.of(context).size.width*0.04
                                                                    //           ),)
                                                                    //       ],
                                                                    //     ),
                                                                    //     Row(
                                                                    //       children: [
                                                                    //         Container(
                                                                    //           height: MediaQuery.of(context).size.width*0.045,
                                                                    //           width: MediaQuery.of(context).size.width*0.045,
                                                                    //           decoration: BoxDecoration(
                                                                    //               shape: BoxShape.circle,
                                                                    //               border: Border.all(color: Color(0xff005993),
                                                                    //                   width: 4
                                                                    //               )
                                                                    //           ),
                                                                    //         ),
                                                                    //
                                                                    //         SizedBox(width: MediaQuery.of(context).size.width*0.0175,),
                                                                    //
                                                                    //         Text("Resolved",
                                                                    //           style: TextStyle(
                                                                    //               fontSize: MediaQuery.of(context).size.width*0.04
                                                                    //           ),)
                                                                    //       ],
                                                                    //     ),
                                                                    //   ],
                                                                    // ),
                                                                    SizedBox(height: 20,),
                                                                    Text("Send Feedback",
                                                                      style: TextStyle(
                                                                          fontSize: MediaQuery.of(context).size.width*0.0425
                                                                      ),),
                                                                    Padding(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(20),
                                                                        ),
                                                                        child: TextFormField(
                                                                          controller: feedbackController,
                                                                          textInputAction: TextInputAction.newline,
                                                                          keyboardType: TextInputType.multiline,
                                                                          minLines: null,
                                                                          maxLines: 6,
                                                                          cursorColor: Color(0xff031627),
                                                                          decoration: InputDecoration(
                                                                            contentPadding: const EdgeInsets.all(10.0),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Color(0xffF3F3F3)),
                                                                            ),
                                                                            focusedBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Color(0xffF3F3F3)),
                                                                            ),
                                                                            focusColor: Color(0xff031627),
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                              borderSide: BorderSide(color: Color(0xffF3F3F3)),
                                                                            ),
                                                                            filled: true,
                                                                            fillColor: Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    SizedBox(height: 15,),

                                                                    Container(
                                                                      width: MediaQuery.of(context).size.width,
                                                                      child: ElevatedButton(
                                                                        onPressed: (){
                                                                          print(issuesList!.data[index].id);
                                                                          access().respondServiceReq(feedbackController.text,
                                                                              issuesList!.data[index].id.toString()).then((value) {
                                                                            if (value["success"]){
                                                                              print(issuesList!.data[index].id);

                                                                              setState((){
                                                                                issuesList!.data.removeAt(index);
                                                                              });

                                                                              Navigator.pop(context);

                                                                              Fluttertoast.showToast(
                                                                                  msg: "${"Response sent as resolved"}",
                                                                                  toastLength: Toast.LENGTH_SHORT,
                                                                                  gravity: ToastGravity.BOTTOM,
                                                                                  timeInSecForIosWeb: 1,
                                                                                  backgroundColor: Colors.green.shade400,
                                                                                  textColor: Colors.white,
                                                                                  fontSize: 16.0);

                                                                              setState((){
                                                                                feedbackController.clear();
                                                                              });
                                                                            } else{
                                                                              Navigator.pop(context);
                                                                              Fluttertoast.showToast(
                                                                                  msg: "${"Response sent as pending"}",
                                                                                  toastLength: Toast.LENGTH_SHORT,
                                                                                  gravity: ToastGravity.BOTTOM,
                                                                                  timeInSecForIosWeb: 1,
                                                                                  backgroundColor: Colors.red.shade400,
                                                                                  textColor: Colors.white,
                                                                                  fontSize: 16.0);

                                                                              setState((){
                                                                                feedbackController.clear();
                                                                              });
                                                                            }
                                                                          });
                                                                        },
                                                                        child: Text("Update", style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontSize: 16
                                                                        ),),
                                                                        style: ButtonStyle(
                                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                                RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(25),
                                                                                    side: BorderSide(color: Color(0xff00A3FF))
                                                                                )
                                                                            ),
                                                                            backgroundColor: MaterialStateProperty.all(Color(0xff00A3FF),)
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ));
                                                    });
                                              },
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xff525252),
                                                size: MediaQuery.of(context).size.width*0.05,
                                              ))
                                        ]),

                                  ],
                                ),
                              );
                            }
                        )
                    ),


                  ],
                ),
              ),
            ),
          ),
        ));
  }


}
