import 'package:contacts_buddy/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ionicons/ionicons.dart';

Alert commonMessage(
  context, {
  required String errorTxt,
  bool showIcon = true,
  int btnType = 1,
  List<DialogButton>? buttons,
}) =>
    Alert(
      onWillPopActive: buttons != null,
      context: context,
      style: const AlertStyle(
        backgroundColor: kdefWhiteColor,
      ),
      closeIcon: Container(),
      content: Column(
        children: [
          if (showIcon)
            Icon(
              btnType == 1
                  ? Ionicons.alert_circle
                  : btnType == 2
                      ? Ionicons.warning
                      : Ionicons.information_circle,
              color: btnType == 1
                  ? kErrorMessage
                  : btnType == 2
                      ? kWarnningMessage
                      : kPrimaryBtn,
              size: 50,
            ),
          if (showIcon)
            Text(
              btnType == 1
                  ? 'Error'
                  : btnType == 2
                      ? "Warning"
                      : "Information",
              style: TextStyle(
                color: btnType == 1
                    ? kErrorMessage
                    : btnType == 2
                        ? kWarnningMessage
                        : kPrimaryBtn,
                fontWeight: FontWeight.bold,
              ),
            ),
          // if (showIcon) const
          // CustomHeightBox(size: 20),
          Text(
            errorTxt,
            style: const TextStyle(
              fontSize: 17,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
      buttons: buttons ?? [],
    );
