class TotalVisitors {
  TotalVisitors({
    required this.status,
    required this.success,
    required this.message,
    required this.totalGuestsVisitedWithYou,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<TotalGuestsVisitedWithYou> totalGuestsVisitedWithYou;

  TotalVisitors.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    totalGuestsVisitedWithYou = List.from(json['Total_Guests_Visited_With_You']).map((e)=>TotalGuestsVisitedWithYou.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['Total_Guests_Visited_With_You'] = totalGuestsVisitedWithYou.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class TotalGuestsVisitedWithYou {
  TotalGuestsVisitedWithYou({
    required this.count,
  });
  late final int count;

  TotalGuestsVisitedWithYou.fromJson(Map<String, dynamic> json){
    count= json['count(id)'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count(id)'] = count;
    return _data;
  }
}