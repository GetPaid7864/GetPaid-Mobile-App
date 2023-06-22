// To parse this JSON data, do
//
//     final recruiterContractDetailsModel = recruiterContractDetailsModelFromJson(jsonString);

import 'dart:convert';

RecruiterContractDetailsModel recruiterContractDetailsModelFromJson(String str) => RecruiterContractDetailsModel.fromJson(json.decode(str));

String recruiterContractDetailsModelToJson(RecruiterContractDetailsModel data) => json.encode(data.toJson());

class RecruiterContractDetailsModel {
  List<Datum>? data;

  RecruiterContractDetailsModel({
    this.data,
  });

  factory RecruiterContractDetailsModel.fromJson(Map<String, dynamic> json) => RecruiterContractDetailsModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? recruiterId;
  String? jobId;
  String? jobSeekerId;
  List<Timesheet>? timesheets;
  bool? checkedOut;
  int? v;
  JobDetails? jobDetails;
  ProposedBy? proposedBy;
  PostedBy? postedBy;

  Datum({
    this.id,
    this.recruiterId,
    this.jobId,
    this.jobSeekerId,
    this.timesheets,
    this.checkedOut,
    this.v,
    this.jobDetails,
    this.proposedBy,
    this.postedBy,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    recruiterId: json["recruiterId"],
    jobId: json["jobId"],
    jobSeekerId: json["jobSeekerId"],
    timesheets: json["timesheets"] == null ? [] : List<Timesheet>.from(json["timesheets"]!.map((x) => Timesheet.fromJson(x))),
    checkedOut: json["checkedOut"],
    v: json["__v"],
    jobDetails: json["jobDetails"] == null ? null : JobDetails.fromJson(json["jobDetails"]),
    proposedBy: json["proposedBy"] == null ? null : ProposedBy.fromJson(json["proposedBy"]),
    postedBy: json["postedBy"] == null ? null : PostedBy.fromJson(json["postedBy"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "recruiterId": recruiterId,
    "jobId": jobId,
    "jobSeekerId": jobSeekerId,
    "timesheets": timesheets == null ? [] : List<dynamic>.from(timesheets!.map((x) => x.toJson())),
    "checkedOut": checkedOut,
    "__v": v,
    "jobDetails": jobDetails?.toJson(),
    "proposedBy": proposedBy?.toJson(),
    "postedBy": postedBy?.toJson(),
  };
}

class JobDetails {
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
  List<String>? skills;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  JobDetails({
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
    skills: json["skills"] == null ? [] : List<String>.from(json["skills"]!.map((x) => x)),
    description: json["description"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
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
    "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
    "description": description,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class PostedBy {
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
    name: json["name"],
    phoneNumber: json["phoneNumber"],
    phoneVerified: json["phoneVerified"],
    email: json["email"],
    type: json["type"],
    stars: Map.from(json["stars"]!).map((k, v) => MapEntry<String, int>(k, v)),
    expireAt: json["expireAt"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phoneNumber": phoneNumber,
    "phoneVerified": phoneVerified,
    "email": email,
    "type": type,
    "stars": Map.from(stars!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "expireAt": expireAt,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "token": token,
  };
}

class ProposedBy {
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
  String? token;
  PersonalInfo? personalInfo;
  Contact? contact;
  String? photo;

  ProposedBy({
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
    this.personalInfo,
    this.contact,
    this.photo,
  });

  factory ProposedBy.fromJson(Map<String, dynamic> json) => ProposedBy(
    phoneNumber: json["phoneNumber"],
    phoneVerified: json["phoneVerified"],
    email: json["email"],
    skills: json["skills"] == null ? [] : List<String>.from(json["skills"]!.map((x) => x)),
    type: json["type"],
    stars: Map.from(json["stars"]!).map((k, v) => MapEntry<String, int>(k, v)),
    expireAt: json["expireAt"],
    languages: json["languages"] == null ? [] : List<Language>.from(json["languages"]!.map((x) => Language.fromJson(x))),
    education: json["education"] == null ? [] : List<Education>.from(json["education"]!.map((x) => Education.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    token: json["token"],
    personalInfo: json["personalInfo"] == null ? null : PersonalInfo.fromJson(json["personalInfo"]),
    contact: json["contact"] == null ? null : Contact.fromJson(json["contact"]),
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "phoneNumber": phoneNumber,
    "phoneVerified": phoneVerified,
    "email": email,
    "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
    "type": type,
    "stars": Map.from(stars!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "expireAt": expireAt,
    "languages": languages == null ? [] : List<dynamic>.from(languages!.map((x) => x.toJson())),
    "education": education == null ? [] : List<dynamic>.from(education!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "token": token,
    "personalInfo": personalInfo?.toJson(),
    "contact": contact?.toJson(),
    "photo": photo,
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

class Timesheet {
  String? id;
  DateTime? date;
  int? totalHours;
  bool? verified;
  String? contractId;
  int? v;

  Timesheet({
    this.id,
    this.date,
    this.totalHours,
    this.verified,
    this.contractId,
    this.v,
  });

  factory Timesheet.fromJson(Map<String, dynamic> json) => Timesheet(
    id: json["_id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    totalHours: json["totalHours"],
    verified: json["verified"],
    contractId: json["contractId"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "date": date?.toIso8601String(),
    "totalHours": totalHours,
    "verified": verified,
    "contractId": contractId,
    "__v": v,
  };
}
