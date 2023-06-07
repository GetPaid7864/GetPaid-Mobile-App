// To parse this JSON data, do
//
//     final getRecruiterProfileModel = getRecruiterProfileModelFromJson(jsonString);

import 'dart:convert';

GetRecruiterProfileModel getRecruiterProfileModelFromJson(String str) =>
    GetRecruiterProfileModel.fromJson(json.decode(str));

String getRecruiterProfileModelToJson(GetRecruiterProfileModel data) =>
    json.encode(data.toJson());

class GetRecruiterProfileModel {
  List<RecruiterProfileDatum>? data;

  GetRecruiterProfileModel({
    this.data,
  });

  factory GetRecruiterProfileModel.fromJson(Map<String, dynamic> json) =>
      GetRecruiterProfileModel(
        data: json["data"] == null
            ? []
            : List<RecruiterProfileDatum>.from(
                json["data"]!.map((x) => RecruiterProfileDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class RecruiterProfileDatum {
  String? id;
  String? name;
  String? password;
  String? phoneNumber;
  bool? phoneVerified;
  String? email;
  String? type;
  Map<String, int>? stars;
  String? otp;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? token;
  DateTime? expireAt;
  String? urId;
  List<Review>? reviews;
  int? totalReviews;

  RecruiterProfileDatum({
    this.id,
    this.name,
    this.password,
    this.phoneNumber,
    this.phoneVerified,
    this.email,
    this.type,
    this.stars,
    this.otp,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
    this.expireAt,
    this.urId,
    this.reviews,
    this.totalReviews,
  });

  factory RecruiterProfileDatum.fromJson(Map<String, dynamic> json) =>
      RecruiterProfileDatum(
        id: json["_id"],
        name: json["name"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        phoneVerified: json["phoneVerified"],
        email: json["email"],
        type: json["type"],
        stars:
            Map.from(json["stars"]!).map((k, v) => MapEntry<String, int>(k, v)),
        otp: json["otp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        token: json["token"],
        expireAt:
            json["expireAt"] == null ? null : DateTime.parse(json["expireAt"]),
        urId: json["ur_id"],
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
        totalReviews: json["totalReviews"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "password": password,
        "phoneNumber": phoneNumber,
        "phoneVerified": phoneVerified,
        "email": email,
        "type": type,
        "stars":
            Map.from(stars!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "otp": otp,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "token": token,
        "expireAt": expireAt?.toIso8601String(),
        "ur_id": urId,
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "totalReviews": totalReviews,
      };
}

class Review {
  String? id;
  String? revieweeId;
  String? reviewerId;
  int? rating;
  String? comment;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? cId;
  Jobseekers? jobseekers;

  Review({
    this.id,
    this.revieweeId,
    this.reviewerId,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.cId,
    this.jobseekers,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["_id"],
        revieweeId: json["revieweeId"],
        reviewerId: json["reviewerId"],
        rating: json["rating"],
        comment: json["comment"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        cId: json["c_id"],
        jobseekers: json["jobseekers"] == null
            ? null
            : Jobseekers.fromJson(json["jobseekers"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "revieweeId": revieweeId,
        "reviewerId": reviewerId,
        "rating": rating,
        "comment": comment,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "c_id": cId,
        "jobseekers": jobseekers?.toJson(),
      };
}

class Jobseekers {
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

  Jobseekers({
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

  factory Jobseekers.fromJson(Map<String, dynamic> json) => Jobseekers(
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
