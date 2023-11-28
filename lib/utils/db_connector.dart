import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DbConnector {
  Future<void> dbconnter(context, join) async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'contact.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE mycontact(id INTEGER PRIMARY KEY, firstname TEXT, lastnme TEXT,mobile TEXT,email TEXT)',
        );
      },
      version: 1,
    );
  }
}
