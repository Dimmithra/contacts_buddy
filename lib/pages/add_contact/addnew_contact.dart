import 'package:contacts_buddy/providers/contact_provider.dart';
import 'package:contacts_buddy/utils/colors.dart';
import 'package:contacts_buddy/utils/main_body.dart';
import 'package:contacts_buddy/widgets/common_btn.dart';
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
      Provider.of<ContactProvider>(context, listen: false);
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
                      padding: EdgeInsets.all(8.0),
                      child: CommonTextFeil(
                        hinttext: 'First Name',
                        label: 'First Name',
                        validation: true,
                        controller: contactProvider.firstNameController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CommonTextFeil(
                        hinttext: 'Last Name',
                        label: 'Last Name',
                        validation: true,
                        controller: contactProvider.getlastnameController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CommonTextFeil(
                        hinttext: 'Mobile Number',
                        label: 'Mobile Number',
                        validation: true,
                        controller: contactProvider.getmobileNoController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CommonTextFeil(
                        hinttext: 'Email',
                        label: 'Email',
                        controller: contactProvider.emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: CommonBtn(
                          backgroundColor: kPrimaryBtn,
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                              // contactProvider.creatContactSave(context);
                            }
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
