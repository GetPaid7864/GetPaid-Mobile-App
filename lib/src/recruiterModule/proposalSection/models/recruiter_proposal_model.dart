// To parse this JSON data, do
//
//     final recruiterProposalModel = recruiterProposalModelFromJson(jsonString);

import 'dart:convert';

RecruiterProposalModel recruiterProposalModelFromJson(String str) =>
    RecruiterProposalModel.fromJson(json.decode(str));

String recruiterProposalModelToJson(RecruiterProposalModel data) =>
    json.encode(data.toJson());

class RecruiterProposalModel {
  RecruiterProposalData? data;

  RecruiterProposalModel({
    this.data,
  });

  factory RecruiterProposalModel.fromJson(Map<String, dynamic> json) =>
      RecruiterProposalModel(
        data: json["data"] == null
            ? null
            : RecruiterProposalData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class RecruiterProposalData {
  List<All>? all;
  List<All>? shortlisted;
  List<All>? saved;

  RecruiterProposalData({
    this.all,
    this.shortlisted,
    this.saved,
  });

  factory RecruiterProposalData.fromJson(Map<String, dynamic> json) =>
      RecruiterProposalData(
        all: json["all"] == null
            ? []
            : List<All>.from(json["all"]!.map((x) => All.fromJson(x))),
        shortlisted: json["shortlisted"] == null
            ? []
            : List<All>.from(json["shortlisted"]!.map((x) => All.fromJson(x))),
        saved: json["saved"] == null
            ? []
            : List<All>.from(json["saved"]!.map((x) => All.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "all":
            all == null ? [] : List<dynamic>.from(all!.map((x) => x.toJson())),
        "shortlisted": shortlisted == null
            ? []
            : List<dynamic>.from(shortlisted!.map((x) => x.toJson())),
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
  JobDetails? jobDetails;
  ProposedBy? proposedBy;

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
    this.proposedBy,
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
            : JobDetails.fromJson(json["jobDetails"]),
        proposedBy: json["proposedBy"] == null
            ? null
            : ProposedBy.fromJson(json["proposedBy"]),
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
        "proposedBy": proposedBy?.toJson(),
      };
}

class JobDetails {
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
  List<Skill>? skills;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  JobDetails({
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

  factory JobDetails.fromJson(Map<String, dynamic> json) => JobDetails(
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
        // skills: json["skills"] == null
        //     ? []
        //     : List<Skill>.from(json["skills"]!.map((x) => skillValues.map[x]!)),
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
        "skills": skills == null
            ? []
            : List<dynamic>.from(skills!.map((x) => skillValues.reverse[x])),
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

enum Skill { CIVIL, ENGINEERS, BUILDING }

final skillValues = EnumValues({
  "building ": Skill.BUILDING,
  "civil ": Skill.CIVIL,
  "engineers": Skill.ENGINEERS
});

class ProposedBy {
  String? id;
  String? photo;
  String? phoneNumber;
  bool? phoneVerified;
  String? email;
  List<dynamic>? skills;
  String? type;
  Map<String, int>? stars;
  DateTime? expireAt;
  List<dynamic>? languages;
  List<dynamic>? education;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ProposedBy({
    this.id,
    this.photo,
    this.phoneNumber,
    this.phoneVerified,
    this.email,
    this.skills,
    this.type,
    this.stars,
    this.expireAt,
    this.languages,
    this.education,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ProposedBy.fromJson(Map<String, dynamic> json) => ProposedBy(
        id: json["_id"],
        photo: json["photo"],
        phoneNumber: json["phoneNumber"],
        phoneVerified: json["phoneVerified"],
        email: json["email"],
        skills: json["skills"] == null
            ? []
            : List<dynamic>.from(json["skills"]!.map((x) => x)),
        type: json["type"],
        stars:
            Map.from(json["stars"]!).map((k, v) => MapEntry<String, int>(k, v)),
        expireAt:
            json["expireAt"] == null ? null : DateTime.parse(json["expireAt"]),
        languages: json["languages"] == null
            ? []
            : List<dynamic>.from(json["languages"]!.map((x) => x)),
        education: json["education"] == null
            ? []
            : List<dynamic>.from(json["education"]!.map((x) => x)),
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
        "photo": photo,
        "phoneNumber": phoneNumber,
        "phoneVerified": phoneVerified,
        "email": email,
        "skills":
            skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "type": type,
        "stars":
            Map.from(stars!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "expireAt": expireAt?.toIso8601String(),
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x)),
        "education": education == null
            ? []
            : List<dynamic>.from(education!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
