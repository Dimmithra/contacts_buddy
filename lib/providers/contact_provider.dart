import 'package:contacts_buddy/database/database_helper.dart';
import 'package:contacts_buddy/model/contact_model.dart';
import 'package:contacts_buddy/pages/home/home.dart';
import 'package:contacts_buddy/utils/shared_pref.dart';
import 'package:contacts_buddy/widgets/common_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:developer' as dev;

import 'package:url_launcher/url_launcher.dart';

class ContactProvider extends ChangeNotifier {
  final db = DataBaseHelper();
  final storage = new FlutterSecureStorage();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController get getfirstNameController => firstNameController;

  TextEditingController lastnameController = TextEditingController();
  TextEditingController get getlastnameController => lastnameController;

  TextEditingController pmobileNoController = TextEditingController();
  TextEditingController get getpmobileNoController => pmobileNoController;

  TextEditingController secMobileNoController = TextEditingController();
  TextEditingController get getsecMobileNoController => secMobileNoController;

  TextEditingController emailController = TextEditingController();
  TextEditingController get getemailController => emailController;

  TextEditingController specialCommentController = TextEditingController();
  TextEditingController get getspecialCommentController =>
      specialCommentController;

  TextEditingController searchController = TextEditingController();
  TextEditingController get getsearchController => searchController;

  Future<void> clearData(context) async {
    getfirstNameController.clear();
    getlastnameController.clear();
    getpmobileNoController.clear();
    getsecMobileNoController.clear();
    getemailController.clear();
    getspecialCommentController.clear();
  }

  // createContact
  // Future<void> validation(context) async {
  //   Pattern reg = r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/';
  //   RegExp regex = RegExp(reg.toString());
  //   try {
  //     if (!regex.hasMatch(getmobileNoController.text)) {
  //       commonMessage(context, errorTxt: 'Mobile Number Formate Invalide')
  //           .show();
  //     } else {
  //       dev.log('message');
  //     }
  //   } catch (e) {
  //     dev.log(e.toString());
  //   }
  // }

  bool loadSaveData = false;
  bool get getloadSaveData => loadSaveData;
  setloadSaveData(val) {
    loadSaveData = val;
    notifyListeners();
  }

  ContactModel? contactModel;
  ContactModel? get getcontactModel => contactModel;
  setcontactModel(val) {
    contactModel;
    notifyListeners();
  }

  //create new account
  Future<void> createAccount(context) async {
    setloadSaveData(true);
    try {
      setcontactModel(null);
      var res = await db.createNewNumber(
        ContactModel(
          firstName: getfirstNameController.text,
          lastName: getlastnameController.text,
          primaryMobileNo: getpmobileNoController.text,
          secondoryNo: getsecMobileNoController.text,
          email: emailController.text,
          specialNote: getspecialCommentController.text,
        ),
      );
      ContactModel temp = ContactModel();

      if (res == 'success') {
        setcontactModel(temp);
        commonMessage(context,
            errorTxt: 'Mobile Number Save Success',
            btnType: 3,
            buttons: [
              DialogButton(
                child:
                    const Text("okay", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  loadAllContactRecords(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              )
            ]).show();
      } else {
        commonMessage(context, errorTxt: res, btnType: 1).show();
      }
    } catch (e) {
      dev.log({e}.toString());
    } finally {
      setloadSaveData(false);
    }
  }

  bool loadHomeData = false;
  bool get getloadHomeData => loadHomeData;
  setloadHomeData(val) {
    loadHomeData = val;
    notifyListeners();
  }

  List<Map<String, dynamic>> data = [];

  Future<void> loadAllContactRecords(context) async {
    setloadHomeData(true);
    try {
      // setcontactModel(null);
      List<Map<String, dynamic>> contactRecord = await db.getAllData();
      data.clear();
      data.addAll(contactRecord);
      // data.sort((a, b) {
      //   final String nameA = a['lastName'].toString().toLowerCase();
      //   final String nameB = b['lastName'].toString().toLowerCase();
      //   return nameA.compareTo(nameB);
      // });
      // data.sort((a, b) =>
      //     (a['lastName'] as String).compareTo(b['lastName'] as String));
    } catch (e) {
      dev.log(e.toString());
    } finally {
      setloadHomeData(false);
    }
  }

  bool loadDeleteRec = false;
  bool get getloadDeleteRec => loadDeleteRec;
  setloadDeleteRec(val) {
    loadDeleteRec = val;
    notifyListeners();
  }

  Future<void> deleteRecord(context, {required String mobileNo}) async {
    try {
      setloadDeleteRec(true);
      var res = await DataBaseHelper().deleteItem(mobileNo);
      notifyListeners();
      if (res == 'success') {
        commonMessage(
          context,
          errorTxt: 'Delete Contact recode Succes Success',
          btnType: 3,
          buttons: [
            DialogButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false,
                );
              },
            )
          ],
        ).show();
      } else {
        commonMessage(context, errorTxt: 'Delete fail', btnType: 2).show();
      }
    } catch (e) {
      dev.log('$e');
    } finally {
      setloadDeleteRec(false);
    }
  }

  //update

  bool loadUpdateData = false;
  bool get getloadUpdateData => loadUpdateData;
  setloadUpdateData(val) {
    loadUpdateData = val;
    notifyListeners();
  }

  Future<void> updateContactRec(
    context, {
    required String firstName,
    required String lastName,
    required String primaryMobileNo,
    required String secondoryNo,
    required String email,
    required String specialNote,
  }) async {
    setloadUpdateData(true);
    try {
      var res = await DataBaseHelper().updateContactRecorde(firstName, lastName,
          primaryMobileNo, secondoryNo, email, specialNote);
      if (res == 'success') {
        commonMessage(
          context,
          errorTxt: 'Contact Recode Modification \n Success',
          btnType: 3,
          buttons: [
            DialogButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false,
                );
              },
            )
          ],
        ).show();
      } else {
        commonMessage(context,
                errorTxt: 'Contact Recode Modification \n fail', btnType: 1)
            .show();
      }
    } catch (e) {
      dev.log('$e');
    } finally {
      setloadUpdateData(false);
    }
  }

  // List<ContactModel> contactModelList = [];
  // List<ContactModel?> get getcontactModelList => contactModelList;

  // List<ContactModel> searchResult = [];
  // List<ContactModel?> get getsearchResult => searchResult;
  // Future<void> onSearchTextChanged(context, {required String text}) async {
  //   // searchResult.clear();
  //   List<Map<String, dynamic>> contactRecord = await db.getAllData();
  //   dev.log('list: $contactRecord');
  //   if (text.isEmpty) {
  //     dev.log('input: $text');
  //     commonMessage(context, errorTxt: 'search cannot be blank').show();
  //   }
  //   //  else {
  //   getcontactModelList.forEach((contactDetail) {
  //     if (contactDetail!.firstName!.contains(text) ||
  //         contactDetail.primaryMobileNo!.contains(text)) {
  //       // searchResult.add(contactDetail);
  //       dev.log('input suucees: $text');
  //       commonMessage(context, errorTxt: "$contactDetail").show();
  //     }
  //   });
  //   // }
  // }

  //launch number
  Future<void> launchCaller(context, {String? contactNo}) async {
    var url = "tel:$contactNo";
    // "tel:1234567";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String searchTerm = '';
  // List<Map<String, dynamic>> filteredData = [];
  String get getsearchTerm => searchTerm;
  List<Map<String, dynamic>> get getfilteredData => data;

  Future<void> filter({String? searchData}) async {
    // var res = await DataBaseHelper().filterData(searchTerm: searchData);+
    searchTerm = "$searchData";
    data = await DataBaseHelper().filterData(searchTerm: "$searchData");
    data.clear();
    dev.log("filter $data");
    notifyListeners();
  }

  bool darkMode = false;
  bool get getDarkTheme => darkMode;

  Future<void> loadTheme() async {
    String? theme = await storage.read(key: kThemeStyle);
    if (theme != null) {
      darkMode = theme == 'dark';
    }
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    darkMode = !darkMode;
    await storage.write(key: kThemeStyle, value: darkMode ? 'dark' : 'light');
    notifyListeners();
  }

//share contact record
  Future<void> onShare(
    BuildContext context, {
    String? fname,
    String? lname,
    String? mobile1,
    String? mobile2,
  }) async {
    await Share.share("$fname $lname \n ${mobile1!} \n ${mobile2!}",
        subject: 'Share Contact Number');
  }
}
