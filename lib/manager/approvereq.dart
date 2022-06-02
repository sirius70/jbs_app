import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../admin/more.dart';
import 'viewusers.dart';

class Approve_req extends StatefulWidget {
  const Approve_req({Key? key}) : super(key: key);

  @override
  State<Approve_req> createState() => _Approve_reqState();
}

class _Approve_reqState extends State<Approve_req> {


  handleDismiss(BuildContext context, DismissDirection direction, int index) {
    // Get a reference to the swiped item
    approve deletedItem = approveItems.removeAt(index);

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(" Do you want to undo?"),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
            label: "Undo",
            textColor: Colors.yellow,
            onPressed: () {
              setState(() => approveItems.insert(index, deletedItem));
            }),
      ),
    )
        .closed
        .then((reason) {
      if (reason != SnackBarClosedReason.action) {
        // The SnackBar was dismissed by some other means
        // that's not clicking of action button
        // Make API call to backend

      }

    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return Center(
    //       child: Container(
    //         padding: EdgeInsets.all(20),
    //         height: 65,
    //         width: MediaQuery.of(context).size.width * 0.9,
    //         decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(20),
    //             boxShadow: [new BoxShadow(
    //               color: Colors.grey,
    //               blurRadius: 5.0,
    //             ),]
    //         ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text("Approve the request", textAlign: TextAlign.center,
    //               style: TextStyle( fontSize: 15,
    //               ),),
    //
    //             Row(
    //               children: [
    //                 VerticalDividerWidget(),
    //
    //                 FlatButton(
    //                   onPressed: () {
    //                     var copiedEmail = approve.copy(swipedEmail);
    //
    //                     setState((){
    //                       approveItems.insert(index, copiedEmail);
    //                     });
    //                   },
    //                   child: const Text("Undo"),
    //                 ),
    //               ],
    //             )
    //
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );




    });
  }

  bool _myBool = false;
  bool _mybool = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: BottomAppBar(
                child: Container(
              height: 65,
              color: HexColor('#d8d8d9'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        LineIcon(
                          LineIcons.home,
                          size: 30,
                          color: HexColor('#818081'),
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              color: HexColor('#818081'), fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        LineIcon(
                          LineIcons.barChart,
                          size: 30,
                          color: HexColor('#818081'),
                        ),
                        Text(
                          'Stats',
                          style: TextStyle(
                              color: HexColor('#818081'), fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.qr_code,
                        color: HexColor('#818081'),
                        size: 50,
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Users();
                      }));
                    },
                    child: Column(
                      children: [
                        LineIcon(
                          LineIcons.bookOpen,
                          size: 30,
                          color: HexColor('#818081'),
                        ),
                        Text(
                          'User',
                          style: TextStyle(
                              color: HexColor('#818081'), fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return More();
                      }));
                    },
                    child: Column(
                      children: [
                        LineIcon(
                          LineIcons.boxes,
                          size: 30,
                          color: HexColor('#818081'),
                        ),
                        Text(
                          'More',
                          style: TextStyle(
                              color: HexColor('#818081'), fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: Row(
                  children: [
                    Icon(Icons.arrow_left_sharp, color: Colors.blue),
                    Text(
                      'back',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                title: Text(
                  'Approve requests',
                  style: TextStyle(color: Colors.blue.shade900),
                ),
                centerTitle: true,
                flexibleSpace: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 260,
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() => _myBool = !_myBool);
                            showMaterialModalBottomSheet(
                                expand: false,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(18),
                                              topRight: Radius.circular(18))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Approve all',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 15),
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Deny all',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ))
                                        ],
                                      ),
                                    ));
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                    height: 20.0,
                                    width: 20.0,
                                    child: GestureDetector(
                                      onTap: () {
                                        showMaterialModalBottomSheet(
                                            expand: false,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) => Container(
                                                  height: 150,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(18),
                                                              topRight: Radius
                                                                  .circular(
                                                                      18))),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            'Approve all',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontSize: 15),
                                                          )),
                                                      Divider(
                                                        thickness: 0.5,
                                                        color: Colors.grey,
                                                      ),
                                                      TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            'Deny all',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue),
                                                          ))
                                                    ],
                                                  ),
                                                ));
                                      },
                                      child: Checkbox(
                                          value: _myBool,
                                          onChanged: (value) {
                                            setState(() => _myBool = value!);
                                          }),
                                    )),
                                SizedBox(width: 5.0),
                                Text(
                                  "Select all",
                                  style: TextStyle(color: Colors.lightBlue),
                                )
                              ])),
                    ],
                  ),
                )),
            body: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                      itemCount: denyItems.length,
                        itemBuilder: (context, idx){
                        return Dismissible(
                          key: Key(denyItems[idx].index.toString()),
                          direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              setState(() {
                                denyItems.removeAt(idx);
                              });
                            },
                            confirmDismiss: (DismissDirection direction) async {
                              return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      height: MediaQuery.of(context).size.width * 0.5,
                                      width: MediaQuery.of(context).size.width * 0.75,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [new BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 5.0,
                                          ),]
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Are you sure you want this \nrequest?", textAlign: TextAlign.center,
                                          style: TextStyle( fontSize: 20,
                                            color: Color(0xff005993)
                                          ),),

                                          SizedBox(height: 20,),

                                          Divider(),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              FlatButton(
                                                onPressed: () => Navigator.of(context).pop(false),
                                                child: const Text("Dismiss"),
                                              ),

                                  VerticalDividerWidget(),

                                              FlatButton(
                                                  onPressed: () => Navigator.of(context).pop(true),
                                                  child: const Text("Deny")
                                              ),

                                            ],
                                          ),


                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          background: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFE6E6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Spacer(),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage("https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/afbdefed9ed20c76cbb6a4fbe3bf0ba25d3e246c/assets/icons/Trash.svg"),
                                      fit: BoxFit.fill
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            color: Color(0xffFF3E01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage("lib/images/face.png"),
                                    ),
                                    SizedBox(width: 8,),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 100,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),

                                        Container(
                                          height: 10,
                                          width: 150,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),

                                        Container(
                                          height: 10,
                                          width: 150,
                                          color: Colors.white,
                                        ),
                                      ],
                                    )
                                  ],
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(left:20, right: 20),
                                  child: Container(
                                      child: Text("Denied", style: TextStyle(
                                        color: Colors.white
                                      ),)
                                  ),
                                )
                              ],
                            ),
                          )
                        );
                        }

                    ),

                ),


                Expanded(
                  child: ListView.builder(
                      itemCount: approveItems.length,
                      itemBuilder: (context, idx){
                        return Dismissible(
                            key: Key(approveItems[idx].index.toString()),
                            direction: DismissDirection.startToEnd,
                            // onDismissed: (direction) {
                            //   handleDismiss(context, direction, idx);
                            // },

                            onDismissed: (direction) {
                              setState(() {
                                // added this block
                                approve deletedItem = approveItems.removeAt(idx);

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    Future.delayed(Duration(seconds: 3), () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return Center(
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        height: 65,
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [new BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 5.0,
                                            ),]
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Approve the request", textAlign: TextAlign.center,
                                              style: TextStyle( fontSize: 15,
                                              ),),

                                            Row(
                                              children: [
                                                VerticalDividerWidget(),

                                                FlatButton(
                                                    onPressed: () {

                                                      setState(() => approveItems.insert(idx, deletedItem));
                                                      Navigator.pop(context);
                                                    },
                                                  child: const Text("Undo"),
                                                ),
                                              ],
                                            )

                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );




                                // ScaffoldMessenger.of(context)
                                //   ..removeCurrentSnackBar()
                                //   ..showSnackBar(
                                //     SnackBar(
                                //       content: Text("Deleted \"${deletedItem}\""),
                                //       action: SnackBarAction(
                                //           label: "UNDO",
                                //           onPressed: () => setState(() => approveItems.insert(idx, deletedItem),) // this is what you needed
                                //       ),
                                //     ),
                                //   );
                              });
                            },
                            // confirmDismiss: (DismissDirection direction) async {
                            //   return await showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return Center(
                            //         child: Container(
                            //           padding: EdgeInsets.all(20),
                            //           height: 65,
                            //           width: MediaQuery.of(context).size.width * 0.9,
                            //           decoration: BoxDecoration(
                            //               color: Colors.white,
                            //               borderRadius: BorderRadius.circular(20),
                            //               boxShadow: [new BoxShadow(
                            //                 color: Colors.grey,
                            //                 blurRadius: 5.0,
                            //               ),]
                            //           ),
                            //           child: Row(
                            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               Text("Approve the request", textAlign: TextAlign.center,
                            //                 style: TextStyle( fontSize: 15,
                            //                 ),),
                            //
                            //               Row(
                            //                 children: [
                            //                   VerticalDividerWidget(),
                            //
                            //                   FlatButton(
                            //                     onPressed: () => Navigator.of(context).pop(false),
                            //                     child: const Text("Undo"),
                            //                   ),
                            //                 ],
                            //               )
                            //
                            //             ],
                            //           ),
                            //         ),
                            //       );
                            //     },
                            //   );
                            // },
                            background: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFE6E6),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Spacer(),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage("https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/afbdefed9ed20c76cbb6a4fbe3bf0ba25d3e246c/assets/icons/Trash.svg"),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              color: Color(0xff0EAF00),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(left:20, right: 20),
                                    child: Container(
                                        child: Text("Approve", style: TextStyle(
                                            color: Colors.white
                                        ),)
                                    ),
                                  ),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage("lib/images/face.png"),
                                      ),
                                      SizedBox(width: 8,),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 100,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),

                                          Container(
                                            height: 10,
                                            width: 150,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),

                                          Container(
                                            height: 10,
                                            width: 150,
                                            color: Colors.white,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),




                                ],
                              ),
                            )
                        );
                      }

                  ),

                ),



                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    image: AssetImage('lib/images/face3.png'),
                    height: 60,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                        width: 120,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 80,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 100,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 65,
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    image: AssetImage('lib/images/face3.png'),
                    height: 60,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                        width: 120,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 80,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 100,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 65,
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    image: AssetImage('lib/images/face3.png'),
                    height: 60,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                        width: 120,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 80,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 100,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 65,
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    image: AssetImage('lib/images/face3.png'),
                    height: 60,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                        width: 120,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 80,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 100,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 65,
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    image: AssetImage('lib/images/face3.png'),
                    height: 60,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                        width: 120,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 80,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 100,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 65,
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    image: AssetImage('lib/images/face3.png'),
                    height: 60,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                        width: 120,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 80,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 100,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 65,
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    image: AssetImage('lib/images/face3.png'),
                    height: 60,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                        width: 120,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 80,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 100,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 65,
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Checkbox(
                      value: _mybool,
                      onChanged: (value) {
                        setState(() => _mybool = value!);
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    image: AssetImage('lib/images/face3.png'),
                    height: 60,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                        width: 120,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 150,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 80,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 10,
                        width: 100,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 65,
                  ),
                ]),
              ],
            )));
  }
}

class VerticalDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 1,
      color: Color(0xffEBEBEB),
    );
  }
}




class deny{
  final Color color;
  final int index;
  
  deny({required this.color, required this.index});
}

List<deny> denyItems = [deny(color: Color(0xffFF3E01), index: 0)];



class approve {
  final int index;

  approve({ required this.index});

  approve.copy(approve other)
      : this.index = other.index;
}

List<approve> approveItems = [approve(index: 0)];

