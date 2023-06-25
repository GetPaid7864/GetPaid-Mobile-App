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
  List<String>? skills;
  String? type;
  Map<String, int>? stars;
  dynamic expireAt;
  List<Language>? languages;
  List<Education>? education;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? photo;
  PersonalInfo? personalInfo;
  Contact? contact;
  String? token;
  String? urId;
  List<Review>? reviews;
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
    this.photo,
    this.personalInfo,
    this.contact,
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
            : List<String>.from(json["skills"]!.map((x) => x)),
        type: json["type"],
        stars:
            Map.from(json["stars"]!).map((k, v) => MapEntry<String, int>(k, v)),
        expireAt: json["expireAt"],
        languages: json["languages"] == null
            ? []
            : List<Language>.from(
                json["languages"]!.map((x) => Language.fromJson(x))),
        education: json["education"] == null
            ? []
            : List<Education>.from(
                json["education"]!.map((x) => Education.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        photo: json["photo"],
        personalInfo: json["personalInfo"] == null
            ? null
            : PersonalInfo.fromJson(json["personalInfo"]),
        contact:
            json["contact"] == null ? null : Contact.fromJson(json["contact"]),
        token: json["token"],
        urId: json["ur_id"],
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
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
            : List<dynamic>.from(languages!.map((x) => x.toJson())),
        "education": education == null
            ? []
            : List<dynamic>.from(education!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "photo": photo,
        "personalInfo": personalInfo?.toJson(),
        "contact": contact?.toJson(),
        "token": token,
        "ur_id": urId,
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "totalReviews": totalReviews,
      };
}

class Contact {
  String? phoneNumber;
  String? email;
  String? city;
  String? state;
  String? zipCode;

  Contact({
    this.phoneNumber,
    this.email,
    this.city,
    this.state,
    this.zipCode,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zipCode"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "email": email,
        "city": city,
        "state": state,
        "zipCode": zipCode,
      };
}

class Education {
  String? institute;
  String? title;
  String? start;
  String? end;
  String? id;

  Education({
    this.institute,
    this.title,
    this.start,
    this.end,
    this.id,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        institute: json["institute"],
        title: json["title"],
        start: json["start"],
        end: json["end"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "institute": institute,
        "title": title,
        "start": start,
        "end": end,
        "_id": id,
      };
}

class Language {
  String? level;
  String? language;
  String? id;

  Language({
    this.level,
    this.language,
    this.id,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        level: json["level"],
        language: json["language"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "level": level,
        "language": language,
        "_id": id,
      };
}

class PersonalInfo {
  String? firstName;
  String? lastName;
  DateTime? dob;
  String? jobTitle;

  PersonalInfo({
    this.firstName,
    this.lastName,
    this.dob,
    this.jobTitle,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
        firstName: json["firstName"],
        lastName: json["lastName"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        jobTitle: json["jobTitle"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "dob": dob?.toIso8601String(),
        "jobTitle": jobTitle,
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
  Recruiters? recruiters;

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
    this.recruiters,
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
        recruiters: json["recruiters"] == null
            ? null
            : Recruiters.fromJson(json["recruiters"]),
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
        "recruiters": recruiters?.toJson(),
      };
}

class Recruiters {
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

  Recruiters({
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
  });

  factory Recruiters.fromJson(Map<String, dynamic> json) => Recruiters(
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
      };
}
