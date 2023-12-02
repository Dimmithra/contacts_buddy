import 'package:contacts_buddy/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:developer' as dev;

class DataBaseHelper {
  final databaseName = "contact.db";

  //tables
  String user = '''
  CREATE TABLE users(
    userid  INTEGER PRIMARY KEY AUTOINCREMENT,
    firstName TEXT,
    lastName TEXT,
    mobileNo TEXT UNIQUE,
    email TEXT
  )
  ''';

  //SQL  data base connection
  Future<Database> initDB() async {
    final databasepath = await getDatabasesPath();
    final path = join(databasepath, databaseName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(user);
      },
    );
  }

  Future<String> createNewNumber(ContactModel contactModel) async {
    try {
      final Database db = await initDB();
      var res = await db.insert("users", contactModel.toMap());
      dev.log(res.toString());
      return 'success';
    } catch (e) {
      return 'This Mobile Number alredy Registered';
    }
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    final Database db = await initDB();
    return await db.query("users");
  }
}
