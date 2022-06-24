import 'package:jbs_app/employee_screens/guest_register_2.dart';

import '../storage.dart';
import 'NetworkHelper.dart';

class access {
  static String base_url =
      'https://stg.visitormanager.net/v1/';


  Future<dynamic> login(String email,password) async {
    NetworkHelper helper = NetworkHelper(base_url + "login/email",);
    var data = await helper.login(email,password);
    return data;
  }

  Future<dynamic> employeeList(String name) async {
    NetworkHelper helper = NetworkHelper(base_url + "admin/search/employee",);
    var data = await helper.employeeList(name);
    return data;
  }

  Future<dynamic> createEmployee(String name, String phoneNo, String email, String Manager) async {
    NetworkHelper helper = NetworkHelper(base_url + "admin/create/employee",);
    var data = await helper.createEmployee(name, phoneNo, email, Manager);
    return data;
  }

  Future<dynamic> usersList() async {

    NetworkHelper helper = NetworkHelper(base_url + "listEmployee?");
    var data = await helper.usersList();
    return data;
  }

  Future<dynamic> attendanceList() async {

    NetworkHelper helper = NetworkHelper(base_url + "show?");
    var data = await helper.attendanceList();
    return data;
  }

  Future<dynamic> managerReqLeave() async {

    NetworkHelper helper = NetworkHelper(base_url + "manager/request/leave");
    var data = await helper.managerReqLeave();
    return data;
  }

  Future<dynamic> profile() async {

    NetworkHelper helper = NetworkHelper(base_url + "profile");
    var data = await helper.profile();
    return data;
  }

  Future<dynamic> deliveryTodayCount() async {

    NetworkHelper helper = NetworkHelper(base_url + "totalDeliveriesToday");
    var data = await helper.deliveryTodayCount();
    return data;
  }

  Future<dynamic> contractorTodayCount() async {

    NetworkHelper helper = NetworkHelper(base_url + "contractorTodayDetails");
    var data = await helper.contractorTodayCount();
    return data;
  }

  Future<dynamic> visitorTodayCount() async {

    NetworkHelper helper = NetworkHelper(base_url + "visitorTodayDetails");
    var data = await helper.visitorTodayCount();
    return data;
  }

  Future<dynamic> loginPhone(String phone_Number) async {
    NetworkHelper helper = NetworkHelper(base_url + "verify/phone");
    var data = await helper.loginPhone(phone_Number);
    return data;
  }

  Future<dynamic> loginPhone2(String phone_Number, String idToken) async {
    NetworkHelper helper = NetworkHelper(base_url + "login/phone");
    var data = await helper.loginPhone2(phone_Number, idToken);
    return data;
  }

  Future<dynamic> disableEmployee(String locId, String empId) async {
    NetworkHelper helper = NetworkHelper(base_url + "disableEmployee");
    var data = await helper.disableEmployee(locId, empId);
    return data;
  }

  Future<dynamic> deleteEmployee(String locId, String empId) async {
    NetworkHelper helper = NetworkHelper(base_url + "deleteEmployee");
    var data = await helper.deleteEmployee(locId, empId);
    return data;
  }

  Future<dynamic> enableEmployee(String locId, String empId) async {
    NetworkHelper helper = NetworkHelper(base_url + "enableEmployee");
    var data = await helper.enableEmployee(locId, empId);
    return data;
  }

  Future<dynamic> regDevToken(String devToken) async {
    NetworkHelper helper = NetworkHelper(base_url + "register/device/token");
    var data = await helper.regDevToken(devToken);
    return data;
  }

  Future<dynamic> empAttendanceSummary(String startDate, endDate) async {
    NetworkHelper helper = NetworkHelper(base_url + "employee/attedance/summary");
    var data = await helper.empAttendanceSummary(startDate, endDate);
    return data;
  }

  Future<dynamic> empAttendanceLeave(String date, String reason) async {
    NetworkHelper helper = NetworkHelper(base_url + "employee/attendance/leave");
    var data = await helper.empAttendanceLeave(date, reason);
    return data;
  }

  Future<dynamic> managerApproveLeave(bool approvalStatus, reqId) async {
    NetworkHelper helper = NetworkHelper(base_url + "manager/request/approval/leave");
    var data = await helper.managerApproveLeave(approvalStatus, reqId);
    return data;
  }

  Future<dynamic> managerApproveRegularization(String approvalStatus, reqId) async {
    NetworkHelper helper = NetworkHelper(base_url + "manager/request/approval/regularisation");
    var data = await helper.managerApproveRegularization(approvalStatus, reqId);
    return data;
  }


  Future<dynamic> empRegularizationTime(String attId, time, reason) async {
    NetworkHelper helper = NetworkHelper(base_url + "employee/attedance/regularisationTime");
    var data = await helper.empRegularizationTime(attId, time, reason);
    return data;
  }

  Future<dynamic> empRegularizationAttend(String attId, reason) async {
    NetworkHelper helper = NetworkHelper(base_url + "employee/attedance/regularisationAttendance");
    var data = await helper.empRegularizationAttend(attId, reason);
    return data;
  }



  Future<dynamic> empAbsPres() async {
    NetworkHelper helper = NetworkHelper(base_url + "employee/attendance/date");
    var data = await helper.empAbsPres();
    return data;
  }

  Future<dynamic> guestRegister(String name , String phNo, email, companyName, ndaSign,date, time) async {
    NetworkHelper helper = NetworkHelper(base_url + "visit/preRegister");
    var data = await helper.guestRegister(name ,  phNo, email, companyName, ndaSign, date, time);
    return data;
  }

  Future<dynamic> empSerReq(String adminId , issueSec, issueReason) async {
    NetworkHelper helper = NetworkHelper(base_url + "employee/serviceRequest");
    var data = await helper.empSerReq(adminId , issueSec, issueReason);
    return data;
  }

  Future<dynamic> adminIssuesList() async {
    NetworkHelper helper = NetworkHelper(base_url + "get/service/request");
    var data = await helper.adminIssuesList();
    return data;
  }

  //
  // Future<dynamic> uploadVisitorImage(String path) async {
  //   NetworkHelper helper = NetworkHelper(base_url + "upload/img/VisitorImg",);
  //   var data=await helper.uploadVisitorImage(path);
  //   return data;
  //
  // }
  //
  // Future<dynamic> visitor(String visitorName, String visitorEmail, String visitorPhone, String company, int employeeId, String? imageurl) async {
  //   NetworkHelper helper = NetworkHelper(base_url + "visit",);
  //   var data=await helper.visitor(visitorName,visitorEmail,visitorPhone,company,employeeId,imageurl);
  //   return data;
  // }
  //
  // Future<dynamic> delivery(String deliveryPersonName, String deliverPersonPhone, String deliverCompany, int employeeID) async {
  //   NetworkHelper helper = NetworkHelper(base_url + "delivery",);
  //   var data=await helper.delivery(deliveryPersonName,deliverPersonPhone,deliverCompany,employeeID);
  //   return data;
  // }
  //
  // Future<dynamic> contractor(String visitorName, String visitorEmail, String visitorPhone, String company, int employeeId, String? imageurl) async {
  //   NetworkHelper helper = NetworkHelper(base_url + "contractor",);
  //   var data=await helper.contractor(visitorName,visitorEmail,visitorPhone,company,employeeId,imageurl);
  //   return data;
  // }
  //
  // Future<dynamic>signout(String? code) async{
  //   NetworkHelper helper = NetworkHelper(base_url + "signout",);
  //   var data=await helper.signout(code);
  //   return data;
  // }
  //
  // Future<dynamic>attendance(String employeeId, String? imageurl)async {
  //   NetworkHelper helper = NetworkHelper(base_url + "employee/attendance/mark",);
  //   var data=await helper.attendance(employeeId,imageurl);
  //   return data;
  // }



}
