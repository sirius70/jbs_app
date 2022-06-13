// To parse this JSON data, do
//
//     final contractorTodaysCount = contractorTodaysCountFromJson(jsonString);

import 'dart:convert';

ContractorTodaysCount contractorTodaysCountFromJson(String str) => ContractorTodaysCount.fromJson(json.decode(str));

String contractorTodaysCountToJson(ContractorTodaysCount data) => json.encode(data.toJson());

class ContractorTodaysCount {
  ContractorTodaysCount({
    required this.status,
    required this.success,
    required this.message,
    required this.contractorInsideToday,
    required this.totalContractorVisitedToday,
  });

  String status;
  bool success;
  String message;
  List<Today> contractorInsideToday;
  List<Today> totalContractorVisitedToday;

  factory ContractorTodaysCount.fromJson(Map<String, dynamic> json) => ContractorTodaysCount(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    contractorInsideToday: List<Today>.from(json["Contractor_Inside_Today"].map((x) => Today.fromJson(x))),
    totalContractorVisitedToday: List<Today>.from(json["Total_Contractor_Visited_Today"].map((x) => Today.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "Contractor_Inside_Today": List<dynamic>.from(contractorInsideToday.map((x) => x.toJson())),
    "Total_Contractor_Visited_Today": List<dynamic>.from(totalContractorVisitedToday.map((x) => x.toJson())),
  };
}

class Today {
  Today({
    required this.count,
  });

  int count;

  factory Today.fromJson(Map<String, dynamic> json) => Today(
    count: json["COUNT(*)"],
  );

  Map<String, dynamic> toJson() => {
    "COUNT(*)": count,
  };
}
