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
    required this.CONTRACTORSENTRYTIME,
    required this.CONTRACTORNAME,
    required this.CONTRACTOREMAIL,
    required this.CONTRACTORPHOTO,
    required this.NDASign,
    required this.CONTRACTORPHONENUMBER,
    required this.CONTRACTORCOMPANYNAME,
    required this.EMPLOYEENAME,
    required this.EMPLOYEEEMAIL,
    required this.EMPLOYEEPHONENUMBER,
  });
  late final int checkOut;
  late final Null checkOutTime;
  late final String CONTRACTORSENTRYTIME;
  late final String CONTRACTORNAME;
  late final String CONTRACTOREMAIL;
  late final String CONTRACTORPHOTO;
  late final int NDASign;
  late final String CONTRACTORPHONENUMBER;
  late final String CONTRACTORCOMPANYNAME;
  late final String EMPLOYEENAME;
  late final String EMPLOYEEEMAIL;
  late final String EMPLOYEEPHONENUMBER;

  ContractorsReportsToday.fromJson(Map<String, dynamic> json){
    checkOut = json['check_Out'];
    checkOutTime = null;
    CONTRACTORSENTRYTIME = json['CONTRACTORS_ENTRY_TIME'];
    CONTRACTORNAME = json['CONTRACTOR_NAME'];
    CONTRACTOREMAIL = json['CONTRACTOR_EMAIL'];
    CONTRACTORPHOTO = json['CONTRACTOR_PHOTO'];
    NDASign = json['NDA_sign'];
    CONTRACTORPHONENUMBER = json['CONTRACTOR_PHONE_NUMBER'];
    CONTRACTORCOMPANYNAME = json['CONTRACTOR_COMPANY_NAME'];
    EMPLOYEENAME = json['EMPLOYEE_NAME'];
    EMPLOYEEEMAIL = json['EMPLOYEE_EMAIL'];
    EMPLOYEEPHONENUMBER = json['EMPLOYEE_PHONE_NUMBER'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['check_Out'] = checkOut;
    _data['check_Out_Time'] = checkOutTime;
    _data['CONTRACTORS_ENTRY_TIME'] = CONTRACTORSENTRYTIME;
    _data['CONTRACTOR_NAME'] = CONTRACTORNAME;
    _data['CONTRACTOR_EMAIL'] = CONTRACTOREMAIL;
    _data['CONTRACTOR_PHOTO'] = CONTRACTORPHOTO;
    _data['NDA_sign'] = NDASign;
    _data['CONTRACTOR_PHONE_NUMBER'] = CONTRACTORPHONENUMBER;
    _data['CONTRACTOR_COMPANY_NAME'] = CONTRACTORCOMPANYNAME;
    _data['EMPLOYEE_NAME'] = EMPLOYEENAME;
    _data['EMPLOYEE_EMAIL'] = EMPLOYEEEMAIL;
    _data['EMPLOYEE_PHONE_NUMBER'] = EMPLOYEEPHONENUMBER;
    return _data;
  }
}