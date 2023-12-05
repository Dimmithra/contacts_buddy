import 'package:contacts_buddy/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:developer' as dev;

class DataBaseHelper {
  final databaseName = "contact.db";

  //tables
  String user = '''
  CREATE TABLE contactdetails(
    userid  INTEGER PRIMARY KEY AUTOINCREMENT,
    firstName TEXT,
    lastName TEXT,
    primaryMobileNo TEXT UNIQUE,
    secondoryNo TEXT,
    email TEXT,
    specialNote TEXT
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
      var res = await db.insert("contactdetails", contactModel.toMap());
      dev.log(res.toString());
      return 'success';
    } catch (e) {
      return 'This Mobile Number alredy Registered';
    }
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    final Database db = await initDB();
    return await db.query("contactdetails");
  }

  //delete
  Future<void> deleteItem(String primaryMobileNo) async {
    final Database db = await initDB();
    await db.delete('contactdetails',
        where: 'primaryMobileNo = ?', whereArgs: [primaryMobileNo]);
  }
}
