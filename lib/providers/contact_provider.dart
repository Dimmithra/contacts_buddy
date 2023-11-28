import 'package:contacts_buddy/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:developer' as dev;
import '../utils/db_helper.dart';

class ContactProvider extends ChangeNotifier {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController get getfirstNameController => firstNameController;

  TextEditingController lastnameController = TextEditingController();
  TextEditingController get getlastnameController => lastnameController;

  TextEditingController mobileNoController = TextEditingController();
  TextEditingController get getmobileNoController => mobileNoController;

  TextEditingController emailController = TextEditingController();
  TextEditingController get getemailController => emailController;

  // createContact
}
