import 'dart:convert';

ContractorsInsideReport disabledEmployeesListFromJson(String str) => ContractorsInsideReport.fromJson(json.decode(str));

String disabledEmployeesListToJson(ContractorsInsideReport data) => json.encode(data.toJson());

class ContractorsInsideReport {
  String status;
  bool success;
  String message;
  List<ContractorsReportsToday> contractorsReportsToday;

  ContractorsInsideReport(
      {required this.status, required this.success, required this.message, required this.contractorsReportsToday});

  factory ContractorsInsideReport.fromJson(Map<String, dynamic> json) => ContractorsInsideReport(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    contractorsReportsToday: List<ContractorsReportsToday>.from(json["employees"].map((x) => ContractorsReportsToday.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "contractorsReportsToday": List<dynamic>.from(contractorsReportsToday.map((x) => x.toJson())),
  };
}


class Employee {
  Employee({
    required this.email,
    required this.phoneNumber,
    required this.employeeId,
    required this.name,
  });

  String email;
  String phoneNumber;
  int employeeId;
  String name;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    email: json["email"],
    phoneNumber: json["phone_Number"],
    employeeId: json["employee_Id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "phone_Number": phoneNumber,
    "employee_Id": employeeId,
    "name": name,
  };
}

class ContractorsReportsToday {
  int checkOut;
  String checkOutTime;
  String cONTRACTORSENTRYTIME;
  String cONTRACTORNAME;
  String cONTRACTOREMAIL;
  String cONTRACTORPHOTO;
  int nDASign;
  String cONTRACTORPHONENUMBER;
  String cONTRACTORCOMPANYNAME;
  String eMPLOYEENAME;
  String eMPLOYEEEMAIL;
  String eMPLOYEEPHONENUMBER;

  ContractorsReportsToday(
      {required this.checkOut,
        required this.checkOutTime,
        required this.cONTRACTORSENTRYTIME,
        required this.cONTRACTORNAME,
        required this.cONTRACTOREMAIL,
        required this.cONTRACTORPHOTO,
        required this.nDASign,
        required this.cONTRACTORPHONENUMBER,
        required this.cONTRACTORCOMPANYNAME,
        required this.eMPLOYEENAME,
        required this.eMPLOYEEEMAIL,
        required this.eMPLOYEEPHONENUMBER});


  factory ContractorsReportsToday.fromJson(Map<String, dynamic> json) => ContractorsReportsToday(
      checkOut: json["checkOut"],
      checkOutTime: json["checkOutTime"],
      cONTRACTORSENTRYTIME: json["cONTRACTORSENTRYTIME"],
      cONTRACTORNAME: json["cONTRACTORNAME"],
      cONTRACTOREMAIL: json["cONTRACTOREMAIL"],
      cONTRACTORPHOTO: json["cONTRACTORPHOTO"],
      nDASign: json["nDASign"],
      cONTRACTORPHONENUMBER: json["cONTRACTORPHONENUMBER"],
      cONTRACTORCOMPANYNAME: json["cONTRACTORCOMPANYNAME"],
      eMPLOYEENAME: json["eMPLOYEENAME"],
      eMPLOYEEEMAIL: json["eMPLOYEEEMAIL"],
      eMPLOYEEPHONENUMBER: json["eMPLOYEEPHONENUMBER"]);


  Map<String, dynamic> toJson() =>{
    'check_Out': checkOut,
    'check_Out_Time': checkOutTime,
    'CONTRACTORS_ENTRY_TIME' : cONTRACTORSENTRYTIME,
    'CONTRACTOR_NAME': cONTRACTORNAME,
    'CONTRACTOR_EMAIL': cONTRACTOREMAIL,
    'CONTRACTOR_PHOTO': cONTRACTORPHOTO,
    'NDA_sign':  nDASign,
    'CONTRACTOR_PHONE_NUMBER': cONTRACTORPHONENUMBER,
    'CONTRACTOR_COMPANY_NAME': cONTRACTORCOMPANYNAME,
    'EMPLOYEE_NAME': eMPLOYEENAME,
    'EMPLOYEE_EMAIL': eMPLOYEEEMAIL,
    'EMPLOYEE_PHONE_NUMBER': eMPLOYEEPHONENUMBER,
  };
}
