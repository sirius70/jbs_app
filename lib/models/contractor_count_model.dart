class ContractorTodaysCount {
  ContractorTodaysCount({
    required this.status,
    required this.success,
    required this.message,
    required this.contractorInside,
    required this.totalContractorVisited,
  });
  late final String status;
  late final bool success;
  late final String message;
  late final List<ContractorInside> contractorInside;
  late final List<TotalContractorVisited> totalContractorVisited;

  ContractorTodaysCount.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    message = json['message'];
    contractorInside = List.from(json['Contractor_Inside']).map((e)=>ContractorInside.fromJson(e)).toList();
    totalContractorVisited = List.from(json['Total_Contractor_Visited']).map((e)=>TotalContractorVisited.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['message'] = message;
    _data['Contractor_Inside'] = contractorInside.map((e)=>e.toJson()).toList();
    _data['Total_Contractor_Visited'] = totalContractorVisited.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ContractorInside {
  ContractorInside({
  required this.COUNT,
});
late final int COUNT;

ContractorInside.fromJson(Map<String, dynamic> json){
COUNT = json['count(id)'];
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['count(id)'] = COUNT;
  return _data;
}
}

class TotalContractorVisited {
  TotalContractorVisited({
  required this.COUNT,
});
late final int COUNT;

TotalContractorVisited.fromJson(Map<String, dynamic> json){
COUNT = json['count(id)'];
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['count(id)'] = COUNT;
  return _data;
}
}