// To parse this JSON data, do
//
//     final jobSeekerProfileModel = jobSeekerProfileModelFromJson(jsonString);

import 'dart:convert';

JobSeekerProfileModel jobSeekerProfileModelFromJson(String str) =>
    JobSeekerProfileModel.fromJson(json.decode(str));

String jobSeekerProfileModelToJson(JobSeekerProfileModel data) =>
    json.encode(data.toJson());

class JobSeekerProfileModel {
  List<Datum>? data;

  JobSeekerProfileModel({
    this.data,
  });

  factory JobSeekerProfileModel.fromJson(Map<String, dynamic> json) =>
      JobSeekerProfileModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? password;
  String? phoneNumber;
  bool? phoneVerified;
  String? email;
  List<dynamic>? skills;
  String? type;
  Map<String, int>? stars;
  dynamic expireAt;
  List<dynamic>? languages;
  List<dynamic>? education;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? token;
  String? urId;
  List<dynamic>? reviews;
  int? totalReviews;

  Datum({
    this.id,
    this.password,
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
    this.token,
    this.urId,
    this.reviews,
    this.totalReviews,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        phoneVerified: json["phoneVerified"],
        email: json["email"],
        skills: json["skills"] == null
            ? []
            : List<dynamic>.from(json["skills"]!.map((x) => x)),
        type: json["type"],
        stars:
            Map.from(json["stars"]!).map((k, v) => MapEntry<String, int>(k, v)),
        expireAt: json["expireAt"],
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
        token: json["token"],
        urId: json["ur_id"],
        reviews: json["reviews"] == null
            ? []
            : List<dynamic>.from(json["reviews"]!.map((x) => x)),
        totalReviews: json["totalReviews"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "password": password,
        "phoneNumber": phoneNumber,
        "phoneVerified": phoneVerified,
        "email": email,
        "skills":
            skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "type": type,
        "stars":
            Map.from(stars!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "expireAt": expireAt,
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x)),
        "education": education == null
            ? []
            : List<dynamic>.from(education!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "token": token,
        "ur_id": urId,
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "totalReviews": totalReviews,
      };
}
