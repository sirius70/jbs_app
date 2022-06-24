import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import '../models/disable_emp_model.dart';
import '../models/empAttendance_summary_model.dart';
import '../models/emp_regularization_model.dart';
import '../models/login_model.dart';
import '../models/search_emp_model.dart';
import '../storage.dart';



class NetworkHelper {
  final url;


  NetworkHelper(this.url);

  Dio? dio;
  BaseOptions option1 = BaseOptions(connectTimeout: 10000, receiveTimeout: 10000, headers: {
    'Content-Type': 'application/json',
  });
  BaseOptions option =
  BaseOptions(connectTimeout: 10000, receiveTimeout: 10000, headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Storage.get_accessToken()}',
  });



  Future login(String email, password) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: {'email': email, 'password': password});
      // LoginApi loginApiRes=LoginApi.fromJson(response?.data);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        //
        // print("access:${loginApiRes.tokens!.accessToken}");
        // print("refresh:${loginApiRes.tokens!.refreshToken}");

        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future employeeList(String name) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: {'name': name,'location_Id':Storage.get_locationID()});


      if (response?.statusCode == 200 || response?.statusCode == 201) {


        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future createEmployee(String name, String phoneNo, String email, String Manager) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: {'name': name,
        "phone_Number": phoneNo,
        "email": email,
        "is_Manager":Manager,
        'location_Id':Storage.get_locationID()});


      if (response?.statusCode == 200 || response?.statusCode == 201) {


        print(response?.data);

        return response?.data;
      } else if(response?.statusCode == 409){
        return(response?.data);
      }
      else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future usersList() async {
    dio = Dio(option);
    try {
      var queryParams = {
        'pageNo': 2,
        'locationId': Storage.get_locationID()
      };

      Response? response = await dio?.get(url, queryParameters: queryParams);


      if (response?.statusCode == 200 || response?.statusCode == 201) {


        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future attendanceList() async {
    dio = Dio(option);
    try {
      Map<String, String> queryParams = {
        "EmployeeId": Storage.get_empID().toString(),
        "startDate": "1-6-2022",
        "endDate": "30-6-2022",
        "location_Id": "1"
      };


      Response? response = await dio?.get(url, queryParameters: queryParams);


      if (response?.statusCode == 200 || response?.statusCode == 201) {


        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future managerReqLeave() async {
    dio = Dio(option);
    try {
      Response? response = await dio?.get(url);


      if (response?.statusCode == 200 || response?.statusCode == 201) {


        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }


  Future profile() async {
    dio = Dio(option);
    try {

      Response? response = await dio?.get(url);


      if (response?.statusCode == 200 || response?.statusCode == 201) {


        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future deliveryTodayCount() async {
    dio = Dio(option);
    try {

      Response? response = await dio?.get(url,
          queryParameters: {
        "location_Id": Storage.get_locationID(),
          "startDate": "${DateFormat("yyyy-MM-dd").format(DateTime.now())}",
          "endDate": "${DateFormat("yyyy-MM-dd").format(DateTime.now())}"
          });


      if (response?.statusCode == 200 || response?.statusCode == 201) {


        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future contractorTodayCount() async {
    dio = Dio(option);
    try {

      Response? response = await dio?.get(url, queryParameters: {
        "location_Id": Storage.get_locationID(),
        "startDate": "${DateFormat("yyyy-MM-dd").format(DateTime.now())}",
        "endDate": "${DateFormat("yyyy-MM-dd").format(DateTime.now())}"
      });


      if (response?.statusCode == 200 || response?.statusCode == 201) {


        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future visitorTodayCount() async {
    dio = Dio(option);
    try {

      Response? response = await dio?.get(url,
          queryParameters: {
            "location_Id": Storage.get_locationID(),
            "startDate": "${DateFormat("yyyy-MM-dd").format(DateTime.now())}",
            "endDate": "${DateFormat("yyyy-MM-dd").format(DateTime.now())}"
      });


      if (response?.statusCode == 200 || response?.statusCode == 201) {


        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future loginPhone(String phone_Number) async {
    dio = Dio(option1);
    try {

      Response? response = await dio?.post(url, data: {"phone_Number": phone_Number});


      if (response?.statusCode == 200 || response?.statusCode == 201) {


        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }


  Future loginPhone2(String phone_Number, String idToken) async {
    dio = Dio(option1);
    try {

      Response? response = await dio?.post(url, data: {"phone_Number": phone_Number
      , "idToken": idToken});


      if (response?.statusCode == 200 || response?.statusCode == 201) {


        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future disableEmployee(String locId, empId) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: {'location_Id': locId, 'employee_Id': empId});

      if (response?.statusCode == 200 || response?.statusCode == 201) {

        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future deleteEmployee(String locId, empId) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: {'location_Id': locId, 'employee_Id': empId});

      if (response?.statusCode == 200 || response?.statusCode == 201) {

        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future enableEmployee(String locId, empId) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: {'location_Id': locId, 'employee_Id': empId});

      if (response?.statusCode == 200 || response?.statusCode == 201) {

        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future regDevToken(String devToken) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: {'device_Token': devToken});

      if (response?.statusCode == 200 || response?.statusCode == 201) {

        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future empAttendanceSummary(String startDate, endDate) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: {
        "startDate": "05-05-2022",
        "endDate": "05-06-2022"
      });

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        print(response?.data);
        //return EmpAttendanceSummary.fromJson(jsonDecode(response?.data));
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }


  Future empAttendanceLeave(String date, String reason) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: {'date': date, 'reason': reason});

      if (response?.statusCode == 200 || response?.statusCode == 201) {

        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future empRegularizationTime(String attId, time, reason) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: {"attendance_id": attId,"time": time,"reason":reason});

      if (response?.statusCode == 200 || response?.statusCode == 201) {

        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future empRegularizationAttend(String attId, reason) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: {"attendance_id": attId,"reason":reason});

      if (response?.statusCode == 200 || response?.statusCode == 201) {

        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }




  Future managerApproveLeave(bool approvalStatus, String reqId) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: { "approval_status": approvalStatus,
        "req_id": reqId});

      if (response?.statusCode == 200 || response?.statusCode == 201) {

        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }


  Future managerApproveRegularization(String approvalStatus, String reqId) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: { "approval_status": approvalStatus,
        "req_id": reqId});

      if (response?.statusCode == 200 || response?.statusCode == 201) {

        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }



  Future guestRegister(String name , String phNo, email, companyName, ndaSign, date, time) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: {
        "visitorName":name,
        "phoneNo":phNo,
        "email":email,
        "visitorCompany":companyName,
        "NDA_sign": ndaSign,
        "location_Id":Storage.get_locationID(),
        "date":date,
        "time": time
      });

      if (response?.statusCode == 200 || response?.statusCode == 201) {

        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future empAbsPres() async {
    dio = Dio(option);
    try {
      Response? response = await dio?.get(url);


      if (response?.statusCode == 200 || response?.statusCode == 201) {


        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future adminIssuesList() async {
    dio = Dio(option);
    try {
      Response? response = await dio?.get(url, queryParameters: {"location_Id": Storage.get_locationID()});


      if (response?.statusCode == 200 || response?.statusCode == 201) {


        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }

  Future empSerReq(String adminId , issueSec, issueReason) async {
    dio = Dio(option);
    try {
      Response? response =
      await dio?.post(url, data: {
        "admin_Id":adminId,
        "location_Id":Storage.get_locationID(),
        "issue_Level":issueSec,
        "issue_Elaboration": issueReason
      });

      if (response?.statusCode == 200 || response?.statusCode == 201) {

        print(response?.data);

        return response?.data;
      } else {
        return {'success': false, 'message': 'Failed'};
      }
    } on DioError catch (e) {
      print(e.message.toString());
      return {'success': false, 'message': e.message};
    }
  }


  //
  // Future uploadVisitorImage(String path) async {
  //   String fileName = path.split('/').last;
  //   FormData formData = FormData.fromMap({"visitor_img":
  //   await MultipartFile.fromFile(path, filename:fileName,contentType: new MediaType("image", "jpeg")),});
  //   dio = Dio(option);
  //   try {
  //     Response? response =
  //     await dio?.post(url, queryParameters:{'phone_number':7223844546},data: formData);
  //
  //     if (response?.statusCode == 200 || response?.statusCode == 201) {
  //
  //
  //
  //       print(response?.data);
  //
  //       return response?.data;
  //     } else {
  //       print(response?.data);
  //       return {'success': false, 'message': 'Failed'};
  //     }
  //   } on Error catch (e) {
  //     print(e.toString());
  //     return {'success': false, 'message': e.toString()};
  //   }
  // }
  //
  // Future visitor(String visitorName, String visitorEmail, String visitorPhone, String company, int employeeId, String? imageurl) async{
  //   dio = Dio(option);
  //   try {
  //     Response? response =
  //     await dio?.post(url, data: {'visitorName': visitorName,'phoneNo':visitorPhone,'email':visitorPhone,'visitorCompany':company,'employee_Id':employeeId,'visitorPhoto':imageurl,'location_Id':Storage.get_locationID()});
  //
  //
  //     if (response?.statusCode == 200 || response?.statusCode == 201) {
  //
  //
  //       print(response?.data);
  //
  //       return response?.data;
  //     } else {
  //       return {'success': false, 'message': 'Failed'};
  //     }
  //   } on DioError catch (e) {
  //     print(e.message.toString());
  //     return {'success': false, 'message': e.message};
  //   }
  // }
  //
  // Future delivery(String deliveryPersonName, String deliverPersonPhone, String deliverCompany, int employeeID) async {
  //   dio = Dio(option);
  //   try {
  //     Response? response =
  //     await dio?.post(url, data: {'deliveryName': deliveryPersonName,'phoneNo':deliverPersonPhone,'deliveryCompany':deliverCompany,'employee_Id':employeeID,'location_Id':Storage.get_locationID()});
  //
  //
  //     if (response?.statusCode == 200 || response?.statusCode == 201) {
  //
  //
  //       print(response?.data);
  //
  //       return response?.data;
  //     } else {
  //       return {'success': false, 'message': 'Failed'};
  //     }
  //   } on DioError catch (e) {
  //     print(e.message.toString());
  //     return {'success': false, 'message': e.message};
  //   }
  // }
  //
  // Future contractor(String visitorName, String visitorEmail, String visitorPhone, String company, int employeeId, String? imageurl,) async{
  //   dio = Dio(option);
  //
  //   try {
  //     Response? response =
  //     await dio?.post(url, data: {
  //       'contractorName': visitorName,
  //       'phoneNo': visitorPhone,
  //       'email': visitorEmail,
  //       'contractorCompany': company,
  //       'employee_Id': employeeId.toString(),
  //       'contractorPhoto': imageurl,
  //       'location_Id': Storage.get_locationID()
  //     });
  //
  //
  //     if (response?.statusCode == 200 || response?.statusCode == 201) {
  //       print(response?.data);
  //
  //       return response?.data;
  //     } else {
  //       return {'success': false, 'message': 'Failed'};
  //     }
  //   }on DioError catch (e) {
  //     print(e.message.toString());
  //     return {'success': false, 'message': e.message};
  //   }
  //
  // }
  //
  // Future signout(String? code)async {
  //   dio = Dio(option);
  //
  //   try {
  //     Response? response =
  //     await dio?.post(url,
  //         data: {'entry_Id': code, 'location_Id': Storage.get_locationID()});
  //
  //
  //     if (response?.statusCode == 200 || response?.statusCode == 201) {
  //       print(response?.data);
  //
  //       return response?.data;
  //     } else {
  //       return {'success': false, 'message': 'Failed'};
  //     }
  //   }on DioError catch (e) {
  //     print(e.message.toString());
  //     return {'success': false, 'message': e.message};
  //   }
  //
  // }
  //
  // Future attendance(String employeeId, String? imageurl)async {
  //   dio = Dio(option);
  //
  //   try {
  //     Response? response =
  //     await dio?.post(url,
  //         data: {'employee_Id': employeeId,"photo_link":"https://phaico-vistor-manager.s3.us-east-1.amazonaws.com/Employee-Img/87-1654540832054.jpg", 'location_Id': Storage.get_locationID()});
  //
  //
  //     if (response?.statusCode == 200 || response?.statusCode == 201) {
  //       print(response?.data);
  //
  //       return response?.data;
  //     } else {
  //       return {'success': false, 'message': 'Failed'};
  //     }
  //   }on DioError catch (e) {
  //     print(e.message.toString());
  //     return {'success': false, 'message': e.message};
  //   }
  // }








}

