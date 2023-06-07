// To parse this JSON data, do
//
//     final recruiterDashBoardModel = recruiterDashBoardModelFromJson(jsonString);

import 'dart:convert';

RecruiterDashBoardModel recruiterDashBoardModelFromJson(String str) =>
    RecruiterDashBoardModel.fromJson(json.decode(str));

String recruiterDashBoardModelToJson(RecruiterDashBoardModel data) =>
    json.encode(data.toJson());

class RecruiterDashBoardModel {
  DashboardData? dashboardData;

  RecruiterDashBoardModel({
    this.dashboardData,
  });

  factory RecruiterDashBoardModel.fromJson(Map<String, dynamic> json) =>
      RecruiterDashBoardModel(
        dashboardData:
            json["data"] == null ? null : DashboardData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": dashboardData?.toJson(),
      };
}

class DashboardData {
  List<Active>? all;
  List<Active>? active;
  List<Active>? expired;
  int? activeJobs;
  int? activeContracts;

  DashboardData({
    this.all,
    this.active,
    this.expired,
    this.activeJobs,
    this.activeContracts,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) => DashboardData(
        all: json["all"] == null
            ? []
            : List<Active>.from(json["all"]!.map((x) => Active.fromJson(x))),
        active: json["active"] == null
            ? []
            : List<Active>.from(json["active"]!.map((x) => Active.fromJson(x))),
        expired: json["expired"] == null
            ? []
            : List<Active>.from(
                json["expired"]!.map((x) => Active.fromJson(x))),
        activeJobs: json["activeJobs"],
        activeContracts: json["activeContracts"],
      );

  Map<String, dynamic> toJson() => {
        "all":
            all == null ? [] : List<dynamic>.from(all!.map((x) => x.toJson())),
        "active": active == null
            ? []
            : List<dynamic>.from(active!.map((x) => x.toJson())),
        "expired": expired == null
            ? []
            : List<dynamic>.from(expired!.map((x) => x.toJson())),
        "activeJobs": activeJobs,
        "activeContracts": activeContracts,
      };
}

class Active {
  String? id;
  String? status;
  String? title;
  String? dates;
  RecruiterId? recruiterId;
  String? time;
  bool? checkIn;
  String? checkInOccurrence;
  String? salary;
  String? salaryFrequency;
  String? jobLocation;
  String? workplace;
  List<String>? skills;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? jobId;
  int? totalProposals;
  List<dynamic>? contracts;
  int? totalShortlisted;

  Active({
    this.id,
    this.status,
    this.title,
    this.dates,
    this.recruiterId,
    this.time,
    this.checkIn,
    this.checkInOccurrence,
    this.salary,
    this.salaryFrequency,
    this.jobLocation,
    this.workplace,
    this.skills,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.jobId,
    this.totalProposals,
    this.contracts,
    this.totalShortlisted,
  });

  factory Active.fromJson(Map<String, dynamic> json) => Active(
        id: json["_id"],
        status: json["status"]!,
        title: json["title"],
        dates: json["dates"],
        recruiterId: recruiterIdValues.map[json["recruiterId"]]!,
        time: json["time"],
        checkIn: json["checkIn"],
        checkInOccurrence: json["checkInOccurrence"],
        salary: json["salary"],
        salaryFrequency: json["salaryFrequency"],
        jobLocation: json["jobLocation"]!,
        workplace: json["workplace"]!,
        skills: json["skills"] == null
            ? []
            : List<String>.from(json["skills"]!.map((x) => x)),
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        jobId: json["_jobId"],
        totalProposals: json["totalProposals"],
        contracts: json["contracts"] == null
            ? []
            : List<dynamic>.from(json["contracts"]!.map((x) => x)),
        totalShortlisted: json["totalShortlisted"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "title": title,
        "dates": dates,
        "recruiterId": recruiterIdValues.reverse[recruiterId],
        "time": time,
        "checkIn": checkIn,
        "checkInOccurrence": checkInOccurrence,
        "salary": salary,
        "salaryFrequency": salaryFrequency,
        "jobLocation": jobLocation,
        "workplace": workplace,
        "skills":
            skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "_jobId": jobId,
        "totalProposals": totalProposals,
        "contracts": contracts == null
            ? []
            : List<dynamic>.from(contracts!.map((x) => x)),
        "totalShortlisted": totalShortlisted,
      };
}

enum RecruiterId { THE_6472183_B656_AA37_A8_B8_EB011 }

final recruiterIdValues = EnumValues({
  "6472183b656aa37a8b8eb011": RecruiterId.THE_6472183_B656_AA37_A8_B8_EB011
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
