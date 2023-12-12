import 'package:contacts_buddy/providers/contact_provider.dart';
import 'package:contacts_buddy/utils/colors.dart';
import 'package:contacts_buddy/utils/main_body.dart';
import 'package:contacts_buddy/widgets/common_btn.dart';
import 'package:contacts_buddy/widgets/common_loader.dart';
import 'package:contacts_buddy/widgets/common_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ContactProvider>(context, listen: false).clearData(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      appBarColor: kDefAppBarColor,
      title: "Edit Profile-${widget.firstName}",
      appbarTitleColor: kdefWhiteColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<ContactProvider>(
          builder: (context, contactProvider, child) {
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10),
                        // border: Border.all(
                        //   color: Colors.grey,
                        // ),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/edit.png',
                            ),
                            fit: BoxFit.cover,
                            scale: 20)),
                    // child: const Image(
                    //   image: AssetImage('assets/images/edit.png'),
                    //   fit: BoxFit.cover,
                    //   height: 120,
                    // ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFeil(
                    hinttext: widget.lastName,
                    label: 'First name: ${widget.firstName}',
                    controller: contactProvider.getfirstNameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFeil(
                    hinttext: widget.lastName,
                    label: 'Last name: ${widget.lastName}',
                    controller: contactProvider.getlastnameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFeil(
                    hinttext: widget.mobileNo1,
                    label: 'Mobile No 1: ${widget.mobileNo1}',
                    controller: contactProvider.getpmobileNoController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFeil(
                    hinttext: widget.mobileNo2,
                    label: 'Mobile No 2: ${widget.mobileNo2}',
                    controller: contactProvider.getsecMobileNoController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFeil(
                    hinttext: widget.email,
                    label: 'Email: ${widget.email}',
                    controller: contactProvider.getemailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextFeil(
                    hinttext: widget.spNote,
                    label: 'Special Note: ${widget.spNote}',
                    controller: contactProvider.getspecialCommentController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: contactProvider.getloadUpdateData
                        ? const CommonPageLoader()
                        : CommonBtn(
                            onPress: () {
                              contactProvider.updateContactRec(
                                context,
                                firstName: widget.firstName,
                                lastName: contactProvider
                                        .getlastnameController.text.isEmpty
                                    ? widget.lastName
                                    : contactProvider
                                        .getlastnameController.text,
                                primaryMobileNo: contactProvider
                                        .getpmobileNoController.text.isEmpty
                                    ? widget.mobileNo1
                                    : contactProvider
                                        .getpmobileNoController.text,
                                secondoryNo: contactProvider
                                        .getsecMobileNoController.text.isEmpty
                                    ? widget.mobileNo2
                                    : contactProvider
                                        .getsecMobileNoController.text,
                                email: contactProvider
                                        .getemailController.text.isEmpty
                                    ? widget.email
                                    : contactProvider.getemailController.text,
                                specialNote: contactProvider
                                        .getspecialCommentController
                                        .text
                                        .isEmpty
                                    ? widget.spNote
                                    : contactProvider
                                        .getspecialCommentController.text,
                              );
                            },
                            btnName: 'Submite',
                            fontColor: kdefWhiteColor,
                            backgroundColor: kPrimaryBtn,
                          ),
                  )
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
