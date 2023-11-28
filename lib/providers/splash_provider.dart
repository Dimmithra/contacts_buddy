import 'dart:ffi';

import 'package:contacts_buddy/pages/home/home.dart';
import 'package:contacts_buddy/pages/welcome/welcome.dart';
import 'package:contacts_buddy/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends ChangeNotifier {
  Future<void> splashScreenLoading(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      bool? boolValue = prefs.getBool('kFirstTimeLog');
      if (boolValue == 'true') {
        dev.log(boolValue.toString());
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ));
      } else {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const WelcomeScreen();
          },
        ));
      }
    } catch (e) {
      dev.log({e}.toString());
    }
  }

  Future<void> firstTimeLoginVerificationProcess(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.setBool('kFirstTimeLog', true);
      dev.log(prefs.toString());
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
