import 'package:flutter/material.dart';
import 'package:jbs_app/api/access.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/search_emp_model.dart';
import '../storage.dart';
class searchEmployee extends StatefulWidget {
  const searchEmployee({Key? key}) : super(key: key);

  @override
  State<searchEmployee> createState() => _searchEmployeeState();
}

class _searchEmployeeState extends State<searchEmployee> {
  TextEditingController nameController = TextEditingController();

  SharedPreferencesInit() async {
    await Storage.init();
  }

  List empList = [];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(

                  onChanged: (value){
                    if(nameController.text.length>=3){
                      access().employeeList(nameController.text)
                          .then((value) async {
                        SearchEmpRes searchEmpRes = await SearchEmpRes.fromJson(value);
                        final emp = searchEmpRes.employee!;
                        setState((){
                          empList = emp;
                          print(empList[0].employeeId);
                        });

                      });
                    }

                    },
                  controller: nameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Name',
                  ),
                ),


              ),
            ),

        Expanded(child: empList ==null?
        Text('no results found'):
        ListView.builder(
          itemCount: empList.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration:BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),

                      ),
                    ),

                    SizedBox(height:10),

                    Column(
                      children: [
                       Text(empList[index].name.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(empList[index].employeeId.toString(), style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
        )

        // Expanded(
        //   child:
        // ),

          ]
        )
      ),
    );
  }

  Widget searchEmpList(SearchEmpRes searchEmpRes){
    return  Expanded(
      child: ListView.builder(
        itemCount: searchEmpRes.employee!.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration:BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),

                    ),
                  ),

                  SizedBox(height:10),

                  Column(
                    children: [
                      Text("Name", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("email", style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );

  }
}


class SearchUser extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {

  }

  @override
  Widget? buildLeading(BuildContext context) {

  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("search emps");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   return Center(
     child: Text("seasrch emps"),
   );
  }}