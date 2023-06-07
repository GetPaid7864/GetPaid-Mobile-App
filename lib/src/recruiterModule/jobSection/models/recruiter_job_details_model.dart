// To parse this JSON data, do
//
//     final recruiterJobDetailsModel = recruiterJobDetailsModelFromJson(jsonString);

import 'dart:convert';

RecruiterJobDetailsModel recruiterJobDetailsModelFromJson(String str) =>
    RecruiterJobDetailsModel.fromJson(json.decode(str));

String recruiterJobDetailsModelToJson(RecruiterJobDetailsModel data) =>
    json.encode(data.toJson());

class RecruiterJobDetailsModel {
  Data? data;

  RecruiterJobDetailsModel({
    this.data,
  });

  factory RecruiterJobDetailsModel.fromJson(Map<String, dynamic> json) =>
      RecruiterJobDetailsModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  String? id;
  String? status;
  String? title;
  String? dates;
  String? recruiterId;
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

  Data({
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
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        status: json["status"],
        title: json["title"],
        dates: json["dates"],
        recruiterId: json["recruiterId"],
        time: json["time"],
        checkIn: json["checkIn"],
        checkInOccurrence: json["checkInOccurrence"],
        salary: json["salary"],
        salaryFrequency: json["salaryFrequency"],
        jobLocation: json["jobLocation"],
        workplace: json["workplace"],
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
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "title": title,
        "dates": dates,
        "recruiterId": recruiterId,
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
      };
}
