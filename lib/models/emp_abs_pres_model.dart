class EmpAbsPresentRes {
  EmpAbsPresentRes({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final Data data;

  EmpAbsPresentRes.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.presentDates,
    required this.absentDates,
  });
  late final List<PresentDates> presentDates;
  late final List<AbsentDates> absentDates;

  Data.fromJson(Map<String, dynamic> json){
    presentDates = List.from(json['Present_Dates']).map((e)=>PresentDates.fromJson(e)).toList();
    absentDates = List.from(json['Absent_Dates']).map((e)=>AbsentDates.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Present_Dates'] = presentDates.map((e)=>e.toJson()).toList();
    _data['Absent_Dates'] = absentDates.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PresentDates {
  PresentDates({
    required this.DateTime,
  });
  late final String DateTime;

  PresentDates.fromJson(Map<String, dynamic> json){
    DateTime = json['DateTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['DateTime'] = DateTime;
    return _data;
  }
}

class AbsentDates {
  AbsentDates({
    required this.DateTime,
  });
  late final String DateTime;

  AbsentDates.fromJson(Map<String, dynamic> json){
    DateTime = json['DateTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['DateTime'] = DateTime;
    return _data;
  }
}