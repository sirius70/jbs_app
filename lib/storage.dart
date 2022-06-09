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