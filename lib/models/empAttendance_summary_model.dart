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
    required this.absent,
    required this.present,
  });
  late final List<Absent> absent;
  late final List<Present> present;

  Data.fromJson(Map<String, dynamic> json){
    absent = List.from(json['Absent']).map((e)=>Absent.fromJson(e)).toList();
    present = List.from(json['Present']).map((e)=>Present.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Absent'] = absent.map((e)=>e.toJson()).toList();
    _data['Present'] = present.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Absent {
  Absent({
    required this.COUNT,
  });
  late final int COUNT;

  Absent.fromJson(Map<String, dynamic> json){
    COUNT = json['COUNT(marked)'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['COUNT(marked)'] = COUNT;
    return _data;
  }
}

class Present {
  Present({
    required this.COUNT,
  });
  late final int COUNT;

  Present.fromJson(Map<String, dynamic> json){
    COUNT = json['COUNT(marked)'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['COUNT(marked)'] = COUNT;
    return _data;
  }
}