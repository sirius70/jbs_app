class DisabledEmployeesList {
  String? status;
  bool? success;
  String? message;
  List<Employees>? employees;

  DisabledEmployeesList(
      {this.status, this.success, this.message, this.employees});

  DisabledEmployeesList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(new Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.employees != null) {
      data['employees'] = this.employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employees {
  String? email;
  String? phoneNumber;
  int? employeeId;
  String? name;

  Employees({this.email, this.phoneNumber, this.employeeId, this.name});

  Employees.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phoneNumber = json['phone_Number'];
    employeeId = json['employee_Id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone_Number'] = this.phoneNumber;
    data['employee_Id'] = this.employeeId;
    data['name'] = this.name;
    return data;
  }
}
