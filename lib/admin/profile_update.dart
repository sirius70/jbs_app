import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jbs_app/admin/usersList.dart';

import '../api/access.dart';
import '../models/admin_users_list_model.dart';
import '../models/emp_profile_admin.dart';
import '../storage.dart';

class updateProfileAdmin extends StatefulWidget {
   updateProfileAdmin({Key? key, required this.id}) : super(key: key);
 int id;
  @override
  State<updateProfileAdmin> createState() => _updateProfileAdminState();
}

class _updateProfileAdminState extends State<updateProfileAdmin> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = true;
  GetEmpProfileAdmin? getProfile;
   late TextEditingController nameController = TextEditingController(text:getProfile!.data[0].name );
   late TextEditingController emailController = TextEditingController(text:getProfile!.data[0].email);
   late TextEditingController phoneController = TextEditingController(text:getProfile!.data[0].phoneNumber!.
   substring(3,getProfile!.data[0].phoneNumber.length));
   late TextEditingController addressController = TextEditingController(text:getProfile!.data[0].address);
   late TextEditingController deptController = TextEditingController(text:getProfile!.data[0].department);

  late bool valuefirst = getProfile!.data[0].isManager==1?true:false;


  @override
  void initState(){
    super.initState();
    loading = false;


    access().getEmpProfile(widget.id).then((value) {
      print("value: $value");
      setState(() {
        getProfile = GetEmpProfileAdmin.fromJson(value);
      });
      loading = false;
    });
  }

  SharedPreferencesInit() async {
    await Storage.init();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(left:3.0),
                child: GestureDetector(
                  onTap: (){
                    Get.to(UsersLists());
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
          'Edit profile',
          style: TextStyle(color: Color(0xff005993)),
        ),
        centerTitle: true,
      ),
      body: loading? Center(child: CircularProgressIndicator(),):
          SingleChildScrollView(
            child: Container(
              child: getProfile == null?
              Center(child: Text("No records found"),):
              Column(

                children: [

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name:"),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          onSaved: (value){
                            nameController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          controller: nameController,
                          decoration: InputDecoration(
                            //  label: Text("Name"),
                              hintText: '${getProfile!.data[0].name}'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone no:"),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          onSaved: (value){
                            phoneController.text = value!;
                          },
                          controller: phoneController,
                          decoration: InputDecoration(
                              // label: Text("Phone no"),
                              hintText: '${getProfile!.data![0].phoneNumber!.substring(
                                  getProfile!.data![0].phoneNumber!.indexOf("+91")+1).trim()}'
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("E-mail:"),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                             // label: Text("E-mail"),
                              hintText: '${getProfile!.data[0].email}'),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value){
                            emailController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Department:"),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          onSaved: (value){
                            deptController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          controller:deptController,
                          decoration: InputDecoration(
                              // label: Text("Department"),
                              hintText: '${getProfile!.data[0].department}'),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address:"),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          onSaved: (value){
                            addressController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          controller: addressController,
                          decoration: InputDecoration(
                            // label: Text("Address"),
                              hintText: '${getProfile!.data[0].address}'),
                        ),
                      ],
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

                  SizedBox(height: 20,),

                  TextButton(
                    onPressed: () {
                      Get.to(UsersLists());
                      access().updateProfileAdmin(nameController.text,
                          emailController.text, "+91"+phoneController.text.trim(),
                          addressController.text, widget.id,
                          deptController.text, valuefirst==true?1:0).then((value){
                            if(value["success"]){

                              Fluttertoast.showToast(
                                  msg: "Updation done",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green.shade400,
                                  textColor: Colors.white,
                                  fontSize: 16.0);

                            } else{
                              Fluttertoast.showToast(
                                  msg: "Updation not done",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red.shade300,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                      });

                    },
                    child: Text('Update',
                        style: TextStyle(color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width*0.0375)),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(
                            Color(0xff005993))),
                  ),

                ],
              ),
            ),
          )
    );
  }
}
