import 'package:intl/intl.dart';
import 'package:jbs_app/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage{
  static SharedPreferences? sharedPreferences;
  static const _isLoggedIn="isLoggedIn";
  static const _accessToken="accessToken";
  static const  _refreshToken=" refreshTokenVal";
  static const _location_ID="locationID";
  static const _employee_Id = "employeeId";
  static const _adminEmp_Id = "adminEmpId";
  static const _location = "location";
  static const _managerEmp_Id = "managerEmpId";
  static const _name = "name";
  static const _deliveryCount = "deliveryCount";
  static const _contractorCount = "contractorCount";
  static const _visitorCount = "visitorCount";
  static const _totalContractorCount = "totalContractorCount2";
  static const _totalVisitorCount = "totalVisitorCount";
  static const _reqId = "reqId";
  static const _date = "date";
  static const _reguAdminId = "reguAdminId";
  static const _isAdmin = "isadmin";
  static const _isManager = "ismanager";
  static const _attId = "attId";
  static const _attMark = "attMark";
  static const _startDateVisitor = "startDateVisitor";
  static const _endDateVisitor = "endDateVisitor";

  static Future init() async{
    sharedPreferences = await SharedPreferences.getInstance();

  }

  static Future set_isLoggedIn(bool isLoggedIn)async=>await sharedPreferences!.setBool(_isLoggedIn, isLoggedIn);
  static bool? get_isLoggedIn()=>sharedPreferences!.getBool(_isLoggedIn)??false;

  static Future set_accessToken(String accessToken)async=>await sharedPreferences!.setString(_accessToken, accessToken);
  static String? get_accessToken()=>sharedPreferences!.getString(_accessToken)??"";

  static Future set_refreshToken(String refreshToken)async=>await sharedPreferences!.setString(_refreshToken, refreshToken);
  static String? get_refreshToken()=>sharedPreferences!.getString(_refreshToken)??"";

  static Future set_locationID(String locationID)async=>await sharedPreferences!.setString(_location_ID, locationID);
  static String? get_locationID()=>sharedPreferences!.getString(_location_ID)??"";

  static Future set_empID(String employeeId)async=>await sharedPreferences!.setString(_employee_Id, employeeId);
  static String? get_empID()=>sharedPreferences!.getString(_employee_Id)??"";

  static Future set_location(String location)async=>await sharedPreferences!.setString(_location, location);
  static String? get_location()=>sharedPreferences!.getString(_location)??"";

  static Future set_adminEmpID(String adminEmpId)async=>await sharedPreferences!.setString(_adminEmp_Id, adminEmpId);
  static String? get_adminEmpID()=>sharedPreferences!.getString(_adminEmp_Id)??"";

  static Future set_managerEmpID(String managerEmpId)async=>await sharedPreferences!.setString(_managerEmp_Id, managerEmpId);
  static String? get_managerEmpID()=>sharedPreferences!.getString(_managerEmp_Id)??"";

  static Future set_name(String name)async=>await sharedPreferences!.setString(_name, name);
  static String? get_name()=>sharedPreferences!.getString(_name)??"";

  static Future set_deliveryCount(String deliveryCount)async=>await sharedPreferences!.setString(_deliveryCount, deliveryCount);
  static String? get_deliveryCount()=>sharedPreferences!.getString(_deliveryCount)??"";

  static Future set_visitorCount(String visitorCount)async=>await sharedPreferences!.setString(_visitorCount, visitorCount);
  static String? get_visitorCount()=>sharedPreferences!.getString(_visitorCount)??"";

  static Future set_totalVisitorCount(String totalVisitorCount)async=>await sharedPreferences!.setString(_totalVisitorCount, totalVisitorCount);
  static String? get_totalVisitorCount()=>sharedPreferences!.getString(_totalVisitorCount)??"";

  static Future set_contractorCount(String contractorCount)async=>await sharedPreferences!.setString(_contractorCount, contractorCount);
  static String? get_contractorCount()=>sharedPreferences!.getString(_contractorCount)??"";

  static Future set_totalContractorCount(String totalContractorCount)async=>await sharedPreferences!.setString(_totalContractorCount, totalContractorCount);
  static String? get_totalContractorCount()=>sharedPreferences!.getString(_totalContractorCount)??"";

  static Future set_reqId(String reqId)async=>await sharedPreferences!.setString(_reqId, reqId);
  static String? get_reqId()=>sharedPreferences!.getString(_reqId)??"";

  static Future set_date(String date)async=>await sharedPreferences!.setString(_date, date);
  static String? get_date()=>sharedPreferences!.getString(_date)??"";

  static Future set_reguAdminId(String reguAdminId)async=>await sharedPreferences!.setString(_reguAdminId, reguAdminId);
  static String? get_reguAdminId()=>sharedPreferences!.getString(_reguAdminId)??"";

  static Future set_isAdmin(String isadmin)async=>await sharedPreferences!.setString(_isAdmin, isadmin);
  static String? get_isAdmin()=>sharedPreferences!.getString(_isAdmin)??"";

  static Future set_isManager(String ismanager)async=>await sharedPreferences!.setString(_isManager, ismanager);
  static String? get_isManager()=>sharedPreferences!.getString(_isManager)??"";

  static Future set_attendanceId(String attId)async=>await sharedPreferences!.setString(_attId, attId);
  static String? get_attendanceId()=>sharedPreferences!.getString(_attId)??"";

  static Future set_attendanceMark(String attMark)async=>await sharedPreferences!.setString(_attMark, attMark);
  static String? get_attendanceMark()=>sharedPreferences!.getString(_attMark)??"";

  static Future set_startDateVisitor(String startDateVisitor)async=>await sharedPreferences!.setString(_startDateVisitor, DateFormat("yyyy-MM-dd").format(DateTime.now()));
  static String? get_startDateVisitor()=>sharedPreferences!.getString(_startDateVisitor)??"";

  static Future set_endDateVisitor(String endDateVisitor)async=>await sharedPreferences!.setString(_endDateVisitor, DateFormat("yyyy-MM-dd").format(DateTime.now()));
  static String? get_endDateVisitor()=>sharedPreferences!.getString(_endDateVisitor)??"";

}


// class SharedPrefrence {
//   Future<bool> setToken(String token) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.setString("token", token);
//   }
//
//   Future<String> getToken() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("token") ?? '';
//   }
// }