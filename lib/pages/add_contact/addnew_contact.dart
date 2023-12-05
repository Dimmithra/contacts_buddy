import 'package:contacts_buddy/providers/contact_provider.dart';
import 'package:contacts_buddy/utils/colors.dart';
import 'package:contacts_buddy/utils/main_body.dart';
import 'package:contacts_buddy/widgets/common_btn.dart';
import 'package:contacts_buddy/widgets/common_loader.dart';
import 'package:contacts_buddy/widgets/common_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewContactAdd extends StatefulWidget {
  const NewContactAdd({super.key});

  @override
  State<NewContactAdd> createState() => _NewContactAddState();
}

class _NewContactAddState extends State<NewContactAdd> {
  final formKey = GlobalKey<FormState>();
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
        title: 'New Contact',
        appBarColor: kDefAppBarColor,
        appbarTitleColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Consumer<ContactProvider>(
              builder: (context, contactProvider, child) {
                return Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/contact_person.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                          //
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonTextFeil(
                        hinttext: 'First Name',
                        label: 'First Name',
                        validation: true,
                        controller: contactProvider.firstNameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonTextFeil(
                        hinttext: 'Last Name',
                        label: 'Last Name',
                        validation: true,
                        controller: contactProvider.getlastnameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonTextFeil(
                        hinttext: 'Primary Mobile Number',
                        label: 'Primary Mobile Number',
                        validation: true,
                        maxLength: 15,
                        textInputType: TextInputType.number,
                        controller: contactProvider.getpmobileNoController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonTextFeil(
                        hinttext: 'Secondary Mobile Number',
                        label: 'Secondary Mobile Number',
                        maxLength: 15,
                        textInputType: TextInputType.number,
                        controller: contactProvider.getsecMobileNoController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonTextFeil(
                        hinttext: 'Email',
                        label: 'Email',
                        controller: contactProvider.emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonTextFeil(
                        hinttext: 'Special Note',
                        label: 'Special Note',
                        controller: contactProvider.getspecialCommentController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: contactProvider.getloadSaveData
                            ? const CommonPageLoader()
                            : CommonBtn(
                                backgroundColor: kPrimaryBtn,
                                onPress: () {
                                  setState(() {
                                    if (formKey.currentState!.validate()) {
                                      contactProvider.createAccount(context);
                                    }
                                  });
                                },
                                btnName: 'Done',
                                fontColor: Colors.white,
                              ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}
