class ContractorsInsideReport {
  String? status;
  bool? success;
  String? message;
  List<ContractorsReportsToday>? contractorsReportsToday;

  ContractorsInsideReport(
      {this.status, this.success, this.message, this.contractorsReportsToday});

  ContractorsInsideReport.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    if (json['Contractors_Reports_Today'] != null) {
      contractorsReportsToday = <ContractorsReportsToday>[];
      json['Contractors_Reports_Today'].forEach((v) {
        contractorsReportsToday!.add(new ContractorsReportsToday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.contractorsReportsToday != null) {
      data['Contractors_Reports_Today'] =
          this.contractorsReportsToday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContractorsReportsToday {
  int? checkOut;
  String? checkOutTime;
  String? cONTRACTORSENTRYTIME;
  String? cONTRACTORNAME;
  String? cONTRACTOREMAIL;
  String? cONTRACTORPHOTO;
  int? nDASign;
  String? cONTRACTORPHONENUMBER;
  String? cONTRACTORCOMPANYNAME;
  String? eMPLOYEENAME;
  String? eMPLOYEEEMAIL;
  String? eMPLOYEEPHONENUMBER;

  ContractorsReportsToday(
      {this.checkOut,
        this.checkOutTime,
        this.cONTRACTORSENTRYTIME,
        this.cONTRACTORNAME,
        this.cONTRACTOREMAIL,
        this.cONTRACTORPHOTO,
        this.nDASign,
        this.cONTRACTORPHONENUMBER,
        this.cONTRACTORCOMPANYNAME,
        this.eMPLOYEENAME,
        this.eMPLOYEEEMAIL,
        this.eMPLOYEEPHONENUMBER});

  ContractorsReportsToday.fromJson(Map<String, dynamic> json) {
    checkOut = json['check_Out'];
    checkOutTime = json['check_Out_Time'];
    cONTRACTORSENTRYTIME = json['CONTRACTORS_ENTRY_TIME'];
    cONTRACTORNAME = json['CONTRACTOR_NAME'];
    cONTRACTOREMAIL = json['CONTRACTOR_EMAIL'];
    cONTRACTORPHOTO = json['CONTRACTOR_PHOTO'];
    nDASign = json['NDA_sign'];
    cONTRACTORPHONENUMBER = json['CONTRACTOR_PHONE_NUMBER'];
    cONTRACTORCOMPANYNAME = json['CONTRACTOR_COMPANY_NAME'];
    eMPLOYEENAME = json['EMPLOYEE_NAME'];
    eMPLOYEEEMAIL = json['EMPLOYEE_EMAIL'];
    eMPLOYEEPHONENUMBER = json['EMPLOYEE_PHONE_NUMBER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['check_Out'] = this.checkOut;
    data['check_Out_Time'] = this.checkOutTime;
    data['CONTRACTORS_ENTRY_TIME'] = this.cONTRACTORSENTRYTIME;
    data['CONTRACTOR_NAME'] = this.cONTRACTORNAME;
    data['CONTRACTOR_EMAIL'] = this.cONTRACTOREMAIL;
    data['CONTRACTOR_PHOTO'] = this.cONTRACTORPHOTO;
    data['NDA_sign'] = this.nDASign;
    data['CONTRACTOR_PHONE_NUMBER'] = this.cONTRACTORPHONENUMBER;
    data['CONTRACTOR_COMPANY_NAME'] = this.cONTRACTORCOMPANYNAME;
    data['EMPLOYEE_NAME'] = this.eMPLOYEENAME;
    data['EMPLOYEE_EMAIL'] = this.eMPLOYEEEMAIL;
    data['EMPLOYEE_PHONE_NUMBER'] = this.eMPLOYEEPHONENUMBER;
    return data;
  }
}
