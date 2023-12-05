import 'package:contacts_buddy/pages/add_contact/addnew_contact.dart';
import 'package:contacts_buddy/pages/contact_Details/contact_Details.dart';
import 'package:contacts_buddy/utils/colors.dart';
import 'package:contacts_buddy/utils/main_body.dart';
import 'package:contacts_buddy/widgets/common_card.dart';
import 'package:contacts_buddy/widgets/common_contact_card.dart';
import 'package:contacts_buddy/widgets/common_loader.dart';
import 'package:contacts_buddy/widgets/common_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../providers/contact_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Provider.of<ContactProvider>(context, listen: false)
  //         .loadAllContactRecords(context);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: 'Welcome',
      appBarColor: kDefAppBarColor,
      automaticallyImplyLeading: false,
      appbarTitleColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  CommonCard(
                    onpress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewContactAdd(),
                        ),
                      );
                    },
                    name: 'Create New Contact',
                    backgroundColor: Color.fromARGB(255, 0, 9, 88),
                  ),
                  CommonCard(
                    onpress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactDetail(),
                        ),
                      );
                    },
                    name: 'Search Contact',
                    backgroundColor: Color.fromARGB(255, 0, 9, 88),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
