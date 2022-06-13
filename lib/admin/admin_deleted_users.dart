import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../models/deleted_employees_model.dart';
import '../storage.dart';
import 'package:http/http.dart'  as http;

class DeletedUsers extends StatefulWidget {
  const DeletedUsers({Key? key}) : super(key: key);

  @override
  State<DeletedUsers> createState() => _DeletedUsersState();
}

class _DeletedUsersState extends State<DeletedUsers> {
  bool _myBool = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Row(
            children: [
              Icon(Icons.arrow_left_sharp, color: Colors.black),
              Text(
                'back',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          title: Text(
            'Deleted Users',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          flexibleSpace: Center(
            child: Row(
              children: [
                SizedBox(
                  width: 260,
                ),
                TextButton(
                    onPressed: () => setState(() => _myBool = !_myBool),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: Checkbox(
                                  value: _myBool,
                                  onChanged: (value) {
                                    setState(() => _myBool = value!);
                                  })),
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
          SizedBox(height: 10,),
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot != null){
                DeletedEmployeesList _deletedEmp = snapshot.data as DeletedEmployeesList ;
                if (_deletedEmp == null){
                  return Center(child: CircularProgressIndicator(),);
                }
                else{
                  return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: _deletedEmp.employees.length,
                          itemBuilder: (context, index){
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage('lib/images/face3.png'),
                                      height: 60,
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(_deletedEmp.employees[index].name.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              backgroundColor: Colors.grey.shade300
                                          ),),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(_deletedEmp.employees[index].phoneNumber.toString(),
                                          style: TextStyle(
                                              backgroundColor: Colors.grey.shade300
                                          ),),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(_deletedEmp.employees[index].email.toString(),
                                          style: TextStyle(
                                              backgroundColor: Colors.grey.shade300
                                          ),),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {
                                      getDeletedEmployeesList();
                                      showMaterialModalBottomSheet(
                                        expand: false,
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) => Container(
                                          padding: EdgeInsets.all(10),
                                          height: 300,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(40),
                                                  topLeft: Radius.circular(40))),
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 50,
                                                      child: Image(
                                                        image: AssetImage('lib/images/face.png'),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          height: 15,
                                                          width: 70,
                                                          child: Text(
                                                            'Caroline Forbes',
                                                            style:
                                                            TextStyle(color: Colors.lightBlue),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Container(
                                                          height: 15,
                                                          width: 120,
                                                          child: Text(
                                                            '+91 744xxxxxxx',
                                                            style:
                                                            TextStyle(color: Colors.lightBlue),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Container(
                                                          height: 15,
                                                          width: 150,
                                                          child: Text('carolineforbes@gmail.com',
                                                              style: TextStyle(
                                                                  color: Colors.lightBlue)),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 20),
                                                Container(
                                                  height: 100,
                                                  width: 280,
                                                  color: Colors.grey.shade500,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text('Delete',
                                                          style: TextStyle(color: Colors.white)),
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                          MaterialStateProperty.all(
                                                              Colors.blue.shade900)),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text('Disable',
                                                          style: TextStyle(color: Colors.white)),
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                          MaterialStateProperty.all(
                                                              Colors.blue.shade900)),
                                                    )
                                                  ],
                                                )
                                              ]),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.arrow_right_sharp,
                                      size: 35,
                                    ))
                              ]),
                              SizedBox(
                                height: 15,
                              ),

                            ],
                          );
                          },


                      )
                  );


                }}
              else{
                return CircularProgressIndicator();
              }
            },

            future: getDeletedEmployeesList(),
          ),
        ],
      ),


    ));
  }
}

Future getDeletedEmployeesList() async {

  var headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}'};


  var url = Uri.parse('https://stg.visitormanager.net/v1/totalDeletedEmployees?location_Id=${Storage.get_locationID()}');

  final response = await http.get(url, headers: headers);
  print(response.body);

  if (response.statusCode == 200) {
    return deletedEmployeesListFromJson(response.body);
  } else {
    print("Failed to fetch data");
  }

}