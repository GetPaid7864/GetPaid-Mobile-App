// To parse this JSON data, do
//
//     final recruiterAllJobsModel = recruiterAllJobsModelFromJson(jsonString);

import 'dart:convert';

RecruiterAllJobsModel recruiterAllJobsModelFromJson(String str) =>
    RecruiterAllJobsModel.fromJson(json.decode(str));

String recruiterAllJobsModelToJson(RecruiterAllJobsModel data) =>
    json.encode(data.toJson());

class RecruiterAllJobsModel {
  List<RecruiterAllJobsDatum>? data;

  RecruiterAllJobsModel({
    this.data,
  });

  factory RecruiterAllJobsModel.fromJson(Map<String, dynamic> json) =>
      RecruiterAllJobsModel(
        data: List<RecruiterAllJobsDatum>.from(
            json["data"].map((x) => RecruiterAllJobsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class RecruiterAllJobsDatum {
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
  PostedBy? postedBy;

  RecruiterAllJobsDatum({
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
    this.postedBy,
  });

  factory RecruiterAllJobsDatum.fromJson(Map<String, dynamic> json) =>
      RecruiterAllJobsDatum(
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
        skills: List<String>.from(json["skills"].map((x) => x)),
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        postedBy: PostedBy.fromJson(json["postedBy"]),
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
        "skills": List<dynamic>.from(skills!.map((x) => x)),
        "description": description,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "postedBy": postedBy!.toJson(),
      };
}

class PostedBy {
  String? id;
  String? name;
  String? phoneNumber;
  bool? phoneVerified;
  String? email;
  String? type;
  Map<String, int>? stars;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? token;
  DateTime? expireAt;

  PostedBy({
    this.id,
    this.name,
    this.phoneNumber,
    this.phoneVerified,
    this.email,
    this.type,
    this.stars,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
    this.expireAt,
  });

  factory PostedBy.fromJson(Map<String, dynamic> json) => PostedBy(
        id: json["_id"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        phoneVerified: json["phoneVerified"],
        email: json["email"],
        type: json["type"],
        stars:
            Map.from(json["stars"]).map((k, v) => MapEntry<String, int>(k, v)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        token: json["token"],
        expireAt: DateTime.parse(json["expireAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phoneNumber": phoneNumber,
        "phoneVerified": phoneVerified,
        "email": email,
        "type": type,
        "stars":
            Map.from(stars!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "token": token,
        "expireAt": expireAt!.toIso8601String(),
      };
}
