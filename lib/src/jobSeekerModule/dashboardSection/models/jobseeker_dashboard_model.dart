// To parse this JSON data, do
//
//     final jobSeekerDashBoardModel = jobSeekerDashBoardModelFromJson(jsonString);

import 'dart:convert';

JobSeekerDashBoardModel jobSeekerDashBoardModelFromJson(String str) =>
    JobSeekerDashBoardModel.fromJson(json.decode(str));

String jobSeekerDashBoardModelToJson(JobSeekerDashBoardModel data) =>
    json.encode(data.toJson());

class JobSeekerDashBoardModel {
  Data? data;

  JobSeekerDashBoardModel({
    this.data,
  });

  factory JobSeekerDashBoardModel.fromJson(Map<String, dynamic> json) =>
      JobSeekerDashBoardModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  List<RecentJob>? recentJobs;
  List<dynamic>? bestMatch;
  List<Applied>? applied;

  Data({
    this.recentJobs,
    this.bestMatch,
    this.applied,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        recentJobs: json["recentJobs"] == null
            ? []
            : List<RecentJob>.from(
                json["recentJobs"]!.map((x) => RecentJob.fromJson(x))),
        bestMatch: json["bestMatch"] == null
            ? []
            : List<dynamic>.from(json["bestMatch"]!.map((x) => x)),
        applied: json["applied"] == null
            ? []
            : List<Applied>.from(
                json["applied"]!.map((x) => Applied.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recentJobs": recentJobs == null
            ? []
            : List<dynamic>.from(recentJobs!.map((x) => x.toJson())),
        "bestMatch": bestMatch == null
            ? []
            : List<dynamic>.from(bestMatch!.map((x) => x)),
        "applied": applied == null
            ? []
            : List<dynamic>.from(applied!.map((x) => x.toJson())),
      };
}

class Applied {
  String? id;
  String? bidAmount;
  String? time;
  bool? checkIn;
  String? recruiterId;
  String? checkInOccurrence;
  String? jobSeekerId;
  String? coverLetter;
  String? jobId;
  String? type;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? cId;
  RecentJob? jobDetails;

  Applied({
    this.id,
    this.bidAmount,
    this.time,
    this.checkIn,
    this.recruiterId,
    this.checkInOccurrence,
    this.jobSeekerId,
    this.coverLetter,
    this.jobId,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.cId,
    this.jobDetails,
  });

  factory Applied.fromJson(Map<String, dynamic> json) => Applied(
        id: json["_id"],
        bidAmount: json["bidAmount"],
        time: json["time"],
        checkIn: json["checkIn"],
        recruiterId: json["recruiterId"],
        checkInOccurrence: json["checkInOccurrence"],
        jobSeekerId: json["jobSeekerId"],
        coverLetter: json["coverLetter"],
        jobId: json["jobId"],
        type: json["type"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        cId: json["c_id"],
        jobDetails: json["jobDetails"] == null
            ? null
            : RecentJob.fromJson(json["jobDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "bidAmount": bidAmount,
        "time": time,
        "checkIn": checkIn,
        "recruiterId": recruiterId,
        "checkInOccurrence": checkInOccurrence,
        "jobSeekerId": jobSeekerId,
        "coverLetter": coverLetter,
        "jobId": jobId,
        "type": type,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "c_id": cId,
        "jobDetails": jobDetails?.toJson(),
      };
}

class RecentJob {
  String? id;
  String? status;
  String? title;
  dynamic dates;
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

  RecentJob({
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

  factory RecentJob.fromJson(Map<String, dynamic> json) => RecentJob(
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
        postedBy: json["postedBy"] == null
            ? null
            : PostedBy.fromJson(json["postedBy"]),
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
        "postedBy": postedBy?.toJson(),
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
  DateTime? expireAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? token;

  PostedBy({
    this.id,
    this.name,
    this.phoneNumber,
    this.phoneVerified,
    this.email,
    this.type,
    this.stars,
    this.expireAt,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
  });

  factory PostedBy.fromJson(Map<String, dynamic> json) => PostedBy(
        id: json["_id"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        phoneVerified: json["phoneVerified"],
        email: json["email"],
        type: json["type"],
        stars:
            Map.from(json["stars"]!).map((k, v) => MapEntry<String, int>(k, v)),
        expireAt:
            json["expireAt"] == null ? null : DateTime.parse(json["expireAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        token: json["token"],
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
        "expireAt": expireAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "token": token,
      };
}
