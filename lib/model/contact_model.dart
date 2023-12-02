import 'dart:convert';

ContactModel contactModelFromMap(String str) =>
    ContactModel.fromMap(json.decode(str));

String contactModelToMap(ContactModel data) => json.encode(data.toMap());

class ContactModel {
  final int? userid;
  final String? firstName;
  final String? lastName;
  final String? mobileNo;
  final String? email;

  ContactModel({
    this.userid,
    this.firstName,
    this.lastName,
    this.mobileNo,
    this.email,
  });

  factory ContactModel.fromMap(Map<String, dynamic> json) => ContactModel(
        userid: json["userid"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobileNo: json["mobileNo"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "userid": userid,
        "firstName": firstName,
        "lastName": lastName,
        "mobileNo": mobileNo,
        "email": email,
      };
}
