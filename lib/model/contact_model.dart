// To parse this JSON data, do
//
//     final contactModel = contactModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ContactModel contactModelFromMap(String str) =>
    ContactModel.fromMap(json.decode(str));

String contactModelToMap(ContactModel data) => json.encode(data.toMap());

class ContactModel {
  final int? userid;
  final String? firstName;
  final String? lastName;
  final String? primaryMobileNo;
  final String? secondoryNo;
  final String? email;
  final String? specialNote;

  ContactModel({
    this.userid,
    this.firstName,
    this.lastName,
    this.primaryMobileNo,
    this.secondoryNo,
    this.email,
    this.specialNote,
  });

  factory ContactModel.fromMap(Map<String, dynamic> json) => ContactModel(
        userid: json["userid"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        primaryMobileNo: json["primaryMobileNo"],
        secondoryNo: json["secondoryNo"],
        email: json["email"],
        specialNote: json["specialNote"],
      );

  Map<String, dynamic> toMap() => {
        "userid": userid,
        "firstName": firstName,
        "lastName": lastName,
        "primaryMobileNo": primaryMobileNo,
        "secondoryNo": secondoryNo,
        "email": email,
        "specialNote": specialNote,
      };
}
