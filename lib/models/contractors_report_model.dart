class ContractorsInsideReport {
  ContractorsInsideReport({
    required this.status,
    required this.success,
    required this.message,
    required this.contractorsReportsToday,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<ContractorsReportsToday> contractorsReportsToday;

  ContractorsInsideReport.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    contractorsReportsToday = List.from(json['Contractors_Reports_Today']).map((e)=>ContractorsReportsToday.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['Contractors_Reports_Today'] = contractorsReportsToday.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ContractorsReportsToday {
  ContractorsReportsToday({
    required this.checkOut,
    this.checkOutTime,
    required this.contractorsEntryTime,
    required this.contractorsName,
    required this.contractorsEmail,
    required this.contractorsPhoto,
    required this.contractorsNdaSign,
    required this.contractorsPhoneNumber,
    required this.contractorsCompanyName,
    required this.employeeName,
    required this.employeeEmail,
    required this.employeeId,
    required this.employeePhoneNumber,
  });
  late final int checkOut;
  late final String? checkOutTime;
  late final String contractorsEntryTime;
  late final String contractorsName;
  late final String contractorsEmail;
  late final String contractorsPhoto;
  late final int contractorsNdaSign;
  late final String contractorsPhoneNumber;
  late final String contractorsCompanyName;
  late final String employeeName;
  late final String employeeEmail;
  late final int employeeId;
  late final String employeePhoneNumber;

  ContractorsReportsToday.fromJson(Map<String, dynamic> json){
    checkOut = json['check_Out'];
    checkOutTime = null;
    contractorsEntryTime = json['contractors_Entry_Time'];
    contractorsName = json['contractors_Name'];
    contractorsEmail = json['contractors_Email'];
    contractorsPhoto = json['contractors_Photo'];
    contractorsNdaSign = json['contractors_Nda_Sign'];
    contractorsPhoneNumber = json['contractors_Phone_Number'];
    contractorsCompanyName = json['contractors_Company_Name'];
    employeeName = json['employee_Name'];
    employeeEmail = json['employee_Email'];
    employeeId = json['employee_Id'];
    employeePhoneNumber = json['employee_Phone_Number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['check_Out'] = checkOut;
    _data['check_Out_Time'] = checkOutTime;
    _data['contractors_Entry_Time'] = contractorsEntryTime;
    _data['contractors_Name'] = contractorsName;
    _data['contractors_Email'] = contractorsEmail;
    _data['contractors_Photo'] = contractorsPhoto;
    _data['contractors_Nda_Sign'] = contractorsNdaSign;
    _data['contractors_Phone_Number'] = contractorsPhoneNumber;
    _data['contractors_Company_Name'] = contractorsCompanyName;
    _data['employee_Name'] = employeeName;
    _data['employee_Email'] = employeeEmail;
    _data['employee_Id'] = employeeId;
    _data['employee_Phone_Number'] = employeePhoneNumber;
    return _data;
  }
}