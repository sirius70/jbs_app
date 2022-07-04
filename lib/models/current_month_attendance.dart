class CurrentMonthAttendance {
  CurrentMonthAttendance({
    required this.status,
    required this.success,
    required this.message,
    required this.present,
    required this.absent,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<Present> present;
  late final List<Absent> absent;

  CurrentMonthAttendance.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    present = List.from(json['present']).map((e)=>Present.fromJson(e)).toList();
    absent = List.from(json['absent']).map((e)=>Absent.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['present'] = present.map((e)=>e.toJson()).toList();
    _data['absent'] = absent.map((e)=>e.toJson()).toList();
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