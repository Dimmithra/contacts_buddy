import 'package:contacts_buddy/database/database_helper.dart';
import 'package:contacts_buddy/model/contact_model.dart';
import 'package:contacts_buddy/pages/home/home.dart';
import 'package:contacts_buddy/widgets/common_message.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:developer' as dev;

class ContactProvider extends ChangeNotifier {
  final db = DataBaseHelper();
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
      setcontactModel(null);
      List<Map<String, dynamic>> contactRecord = await db.getAllData();
      data.clear();
      data.addAll(contactRecord);
    } catch (e) {
      dev.log(e.toString());
    } finally {
      setloadHomeData(false);
    }
  }

  Future<void> deleteRecord(context, {required String mobileNo}) async {
    DataBaseHelper().deleteItem(mobileNo);
  }
}
