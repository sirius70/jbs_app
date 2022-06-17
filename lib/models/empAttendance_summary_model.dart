class EmpAttendanceSummary {
  EmpAttendanceSummary({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final Data data;

  EmpAttendanceSummary.fromJson(Map<String, dynamic> json){
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
    required this.Absent,
    required this.Present,
    required this.absentLogs,
    required this.presentLogs,
  });
  late final int Absent;
  late final int Present;
  late final List<AbsentLogs> absentLogs;
  late final List<PresentLogs> presentLogs;

  Data.fromJson(Map<String, dynamic> json){
    Absent = json['Absent'];
    Present = json['Present'];
    absentLogs = List.from(json['Absent_logs']).map((e)=>AbsentLogs.fromJson(e)).toList();
    presentLogs = List.from(json['Present_logs']).map((e)=>PresentLogs.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Absent'] = Absent;
    _data['Present'] = Present;
    _data['Absent_logs'] = absentLogs.map((e)=>e.toJson()).toList();
    _data['Present_logs'] = presentLogs.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class AbsentLogs {
  AbsentLogs({
    required this.id,
    required this.marked,
    required this.DateTime,
  });
  late final int id;
  late final int marked;
  late final String DateTime;

  AbsentLogs.fromJson(Map<String, dynamic> json){
    id = json['id'];
    marked = json['marked'];
    DateTime = json['DateTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['marked'] = marked;
    _data['DateTime'] = DateTime;
    return _data;
  }
}

class PresentLogs {
  PresentLogs({
    required this.id,
    required this.marked,
    required this.DateTime,
  });
  late final int id;
  late final int marked;
  late final String DateTime;

  PresentLogs.fromJson(Map<String, dynamic> json){
    id = json['id'];
    marked = json['marked'];
    DateTime = json['DateTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['marked'] = marked;
    _data['DateTime'] = DateTime;
    return _data;
  }
}