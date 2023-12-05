import 'dart:async';

import 'package:contacts_buddy/pages/home/home.dart';
import 'package:contacts_buddy/pages/welcome/welcome.dart';
import 'package:contacts_buddy/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:developer' as dev;

class SplashProvider extends ChangeNotifier {
  final storage = new FlutterSecureStorage();
  Future<void> splashScreenLoading(context) async {
    var fistLogin = await storage.read(key: kFirstTimeLog);
    try {
      if (fistLogin == 'true') {
        Timer(Duration(seconds: 3), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false,
          );
        });
      } else {
        Timer(Duration(seconds: 3), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            ),
          );
        });
      }
    } catch (e) {
      dev.log({e}.toString());
    }
  }

  Future<void> firstTimeLoginVerificationProcess(context) async {
    try {
      storage.write(key: kFirstTimeLog, value: 'true');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      dev.log(kFirstTimeLog);
    } catch (e) {
      dev.log({e}.toString());
    }
  }
}
