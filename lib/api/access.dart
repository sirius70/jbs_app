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

  Future<dynamic> createEmployee(String name, String phoneNo, String email, String Manager,
      int controllerId, String dept, String address) async {
    NetworkHelper helper = NetworkHelper(base_url + "admin/create/employee",);
    var data = await helper.createEmployee(name, phoneNo, email, Manager, controllerId, dept, address );
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

    NetworkHelper helper = NetworkHelper(base_url + "loginProfile");
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

  Future<dynamic> getRegularizationManager() async {
    NetworkHelper helper = NetworkHelper(base_url + "manager/request/regularisation");
    var data = await helper.getRegularizationManager();
    return data;
  }

  Future<dynamic> managerRequestLeave() async {
    NetworkHelper helper = NetworkHelper(base_url + "manager/request/leave");
    var data = await helper.managerRequestLeave();
    return data;
  }

  Future<dynamic> getIssuesList() async {
    NetworkHelper helper = NetworkHelper(base_url + "get/service/request");
    var data = await helper.getIssuesList();
    return data;
  }

  Future<dynamic> getGuestsReportList() async {
    NetworkHelper helper = NetworkHelper(base_url + "reportsTodayGuests");
    var data = await helper.getGuestsReportList();
    return data;
  }

  Future<dynamic> getContractorsReportList() async {
    NetworkHelper helper = NetworkHelper(base_url + "reportsTodayContractors");
    var data = await helper.getContractorsReportList();
    return data;
  }

  Future<dynamic> getDeliveriesReportList() async {
    NetworkHelper helper = NetworkHelper(base_url + "reportsTodayDeleveries");
    var data = await helper.getDeliveriesReportList();
    return data;
  }

  Future<dynamic> getAttendanceinAdmin() async {
    NetworkHelper helper = NetworkHelper(base_url+"attendance/show?EmployeeId=0000${Storage.get_empID()}&startDate=2022-06-01&endDate=2022-06-31&location_Id=0000${Storage.get_locationID()}");
    var data = await helper.getAttendanceinAdmin();
    return data;
  }

  Future<dynamic> disabledEmployees() async {
    NetworkHelper helper = NetworkHelper(base_url+"totalDisaledEmployees");
    var data = await helper.disabledEmployees();
    return data;
  }

  Future<dynamic> visitorData(String startDate, endDate) async {
    NetworkHelper helper = NetworkHelper(base_url+"visitor/history");
    var data = await helper.visitorData(startDate, endDate);
    return data;
  }

  Future<dynamic> respondServiceReq(String feedback, String serviceID) async {
    NetworkHelper helper = NetworkHelper(base_url+"respond/serviceRequest");
    var data = await helper.respondServiceReq(feedback, serviceID);
    return data;
  }

  Future<dynamic> getEmpProfile(int empID) async {
    NetworkHelper helper = NetworkHelper(base_url+"employeeProfile");
    var data = await helper.getEmpProfile(empID);
    return data;
  }

  Future<dynamic> pendingReqCount() async {
    NetworkHelper helper = NetworkHelper(base_url+"manager/count/pendingRequest");
    var data = await helper.pendingReqCount();
    return data;
  }

  Future<dynamic> visitorCount() async {
    NetworkHelper helper = NetworkHelper(base_url+"totalGuest/todaywithYou");
    var data = await helper.visitorCount();
    return data;
  }

  Future<dynamic> updateProfileAdmin(String name, email, phoneNo,
      address, empId, dept, int isManager) async {
    NetworkHelper helper = NetworkHelper(base_url+"update/byAdmin");
    var data = await helper.updateProfileAdmin( name, email, phoneNo,
        address, empId, dept, isManager);
    return data;
  }

  Future<dynamic> attendanceMark() async {
    NetworkHelper helper = NetworkHelper(base_url+"update/byAdmin");
    var data = await helper.attendanceMark();
    return data;
  }

  Future<dynamic> currMonthAttendance() async {
    NetworkHelper helper = NetworkHelper(base_url+"currentMonth/Attendance");
    var data = await helper.currMonthAttendance();
    return data;
  }

  Future<dynamic> updateEmpProfile(String name, email, phoneNo,address) async {
    NetworkHelper helper = NetworkHelper(base_url+"update");
    var data = await helper.updateEmpProfile(name, email, phoneNo,address);
    return data;
  }

  Future<dynamic> logout() async {
    NetworkHelper helper = NetworkHelper(base_url+"logout");
    var data = await helper.logout();
    return data;
  }


}
