// class User {
//   User({
//     required this.id,
//     required this.college,
//     required this.fName,
//     required this.sName,
//     required this.email,
//     required this.password,
//     required this.profilePic,
//     required this.aadhaarNo,
//     required this.mobileNo,
//   });

//   late final String id;
//   late final Map college;
//   late final String fName;
//   late final String sName;
//   late final String email;
//   late final String password;
//   late final String profilePic;
//   late final int aadhaarNo;
//   late final String mobileNo;

//   User.fromJson(Map<String, dynamic> json) {
//     id = json["id"] ?? '';
//     college = json["college"] ?? '';
//     fName = json["first_name"] ?? '';
//     sName = json["second_name"] ?? '';
//     email = json["email"] ?? '';
//     password = json["password"] ?? '';
//     profilePic = json["profilePic"] ?? '';
//     aadhaarNo = json["adhaar_no"] ?? '';
//     mobileNo = json["mobile_no"] ?? '';
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data["id"] = id;
//     data["college"] = college;
//     data["first_name"] = fName;
//     data["second_name"] = sName;
//     data["email"] = email;
//     data["password"] = password;
//     data["profilePic"] = profilePic;
//     data["adhaar_no"] = aadhaarNo;
//     data["mobile_no"] = mobileNo;
//     return data;
//   }

//   // List<dynamic> toList() {
//   //   List list = [];

//   //   list.add(id);
//   //   list.add(aadhaarNo);
//   //   list.add(college);
//   //   list.add(email);
//   //   list.add(fName);
//   //   list.add(mobileNo);
//   //   list.add(password);
//   //   list.add(profilePic);
//   //   return list;
//   // }
// }

// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

List<User> studentFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String studentToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.college,
    required this.firstName,
    required this.secondName,
    required this.email,
    required this.password,
    required this.profilePic,
    required this.adhaarNo,
    required this.mobileNo,
  });

  String id;
  College college;
  String firstName;
  String secondName;
  String email;
  String password;
  String profilePic;
  int adhaarNo;
  String mobileNo;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        college: College.fromJson(json["college"]),
        firstName: json["first_name"],
        secondName: json["second_name"],
        email: json["email"],
        password: json["password"],
        profilePic: json["profilePic"],
        adhaarNo: json["adhaar_no"],
        mobileNo: json["mobile_no"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "college": college.toJson(),
        "first_name": firstName,
        "second_name": secondName,
        "email": email,
        "password": password,
        "profilePic": profilePic,
        "adhaar_no": adhaarNo,
        "mobile_no": mobileNo,
      };
}

class College {
  College({
    required this.id,
    required this.name,
    required this.profilePic,
    required this.about,
    required this.address,
    required this.email,
  });

  String id;
  String name;
  String profilePic;
  String about;
  String address;
  String email;

  factory College.fromJson(Map<String, dynamic> json) => College(
        id: json["id"],
        name: json["name"],
        profilePic: json["profilePic"],
        about: json["about"],
        address: json["address"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profilePic": profilePic,
        "about": about,
        "address": address,
        "email": email,
      };
}
