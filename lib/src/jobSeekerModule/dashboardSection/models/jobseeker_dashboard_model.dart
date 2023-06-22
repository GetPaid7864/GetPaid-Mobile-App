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
  List<BestMatch>? recentJobs;
  List<BestMatch>? bestMatch;
  Applied? applied;

  Data({
    this.recentJobs,
    this.bestMatch,
    this.applied,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        recentJobs: json["recentJobs"] == null
            ? []
            : List<BestMatch>.from(
                json["recentJobs"]!.map((x) => BestMatch.fromJson(x))),
        bestMatch: json["bestMatch"] == null
            ? []
            : List<BestMatch>.from(
                json["bestMatch"]!.map((x) => BestMatch.fromJson(x))),
        applied:
            json["applied"] == null ? null : Applied.fromJson(json["applied"]),
      );

  Map<String, dynamic> toJson() => {
        "recentJobs": recentJobs == null
            ? []
            : List<dynamic>.from(recentJobs!.map((x) => x.toJson())),
        "bestMatch": bestMatch == null
            ? []
            : List<dynamic>.from(bestMatch!.map((x) => x.toJson())),
        "applied": applied?.toJson(),
      };
}

class Applied {
  List<All>? all;
  List<dynamic>? shortlisted;
  List<All>? saved;

  Applied({
    this.all,
    this.shortlisted,
    this.saved,
  });

  factory Applied.fromJson(Map<String, dynamic> json) => Applied(
        all: json["all"] == null
            ? []
            : List<All>.from(json["all"]!.map((x) => All.fromJson(x))),
        shortlisted: json["shortlisted"] == null
            ? []
            : List<dynamic>.from(json["shortlisted"]!.map((x) => x)),
        saved: json["saved"] == null
            ? []
            : List<All>.from(json["saved"]!.map((x) => All.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "all":
            all == null ? [] : List<dynamic>.from(all!.map((x) => x.toJson())),
        "shortlisted": shortlisted == null
            ? []
            : List<dynamic>.from(shortlisted!.map((x) => x)),
        "saved": saved == null
            ? []
            : List<dynamic>.from(saved!.map((x) => x.toJson())),
      };
}

class All {
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
  BestMatch? jobDetails;

  All({
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

  factory All.fromJson(Map<String, dynamic> json) => All(
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
            : BestMatch.fromJson(json["jobDetails"]),
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

class BestMatch {
  String? id;
  String? status;
  String? title;
  DateTime? dates;
  String? recruiterId;
  String? time;
  bool? checkIn;
  String? checkInOccurrence;
  String? salary;
  String? salaryFrequency;
  String? jobLocation;
  String? workplace;
  List<Skill>? skills;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  PostedBy? postedBy;

  BestMatch({
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

  factory BestMatch.fromJson(Map<String, dynamic> json) => BestMatch(
        id: json["_id"],
        status: json["status"],
        title: json["title"],
        dates: json["dates"] == null ? null : DateTime.parse(json["dates"]),
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
            : List<Skill>.from(json["skills"]!.map((x) => skillValues.map[x]!)),
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
        "dates": dates?.toIso8601String(),
        "recruiterId": recruiterId,
        "time": time,
        "checkIn": checkIn,
        "checkInOccurrence": checkInOccurrence,
        "salary": salary,
        "salaryFrequency": salaryFrequency,
        "jobLocation": jobLocation,
        "workplace": workplace,
        "skills": skills == null
            ? []
            : List<dynamic>.from(skills!.map((x) => skillValues.reverse[x])),
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
  dynamic expireAt;
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
        expireAt: json["expireAt"],
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
        "expireAt": expireAt,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "token": token,
      };
}

enum Skill { DART, JAVA, C, PYTHON }

final skillValues = EnumValues({
  "c++": Skill.C,
  "dart": Skill.DART,
  "java": Skill.JAVA,
  "python": Skill.PYTHON
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
