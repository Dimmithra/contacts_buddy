import 'package:contacts_buddy/utils/colors.dart';
import 'package:contacts_buddy/utils/main_body.dart';
import 'package:contacts_buddy/widgets/common_btn.dart';
import 'package:contacts_buddy/widgets/common_textfeild.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditeContactScreen extends StatefulWidget {
  const EditeContactScreen({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.mobileNo1,
    required this.mobileNo2,
    required this.email,
    required this.spNote,
  });
  final String firstName;
  final String lastName;
  final String mobileNo1;
  final String mobileNo2;
  final String email;
  final String spNote;

  @override
  State<EditeContactScreen> createState() => _EditeContactScreenState();
}

class _EditeContactScreenState extends State<EditeContactScreen> {
  @override
  Widget build(BuildContext context) {
    return MainBody(
      appBarColor: kDefAppBarColor,
      title: widget.firstName,
      appbarTitleColor: kdefWhiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 223, 221, 221),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/edit.png'),
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CommonTextFeil(
                    hinttext: 'Last Name',
                    label: 'Last name: ${widget.lastName}',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CommonTextFeil(
                    hinttext: 'Mobile No 1',
                    label: 'Mobile No 1: ${widget.mobileNo1}',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CommonTextFeil(
                    hinttext: 'Mobile No 2',
                    label: 'Mobile No 2: ${widget.mobileNo2}',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CommonTextFeil(
                    hinttext: 'Email',
                    label: 'Email: ${widget.email}',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CommonTextFeil(
                    hinttext: 'Special Note',
                    label: 'Special Note: ${widget.spNote}',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CommonBtn(
                      onPress: () {},
                      btnName: 'Submite',
                      fontColor: kdefWhiteColor,
                      backgroundColor: kPrimaryBtn,
                    ),
                  )
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
