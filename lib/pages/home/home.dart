import 'package:contacts_buddy/pages/home/add_contact/addnew_contact.dart';
import 'package:contacts_buddy/pages/home/contact_Details/contact_Details.dart';
import 'package:contacts_buddy/utils/colors.dart';
import 'package:contacts_buddy/utils/main_body.dart';
import 'package:contacts_buddy/widgets/common_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Provider.of<contactProvider>(context, listen: false)
  //         .loadAllcontactRecords(context);
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
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 5,
              bottom: MediaQuery.of(context).size.height / 2),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonCard(
                  icon: Icon(Icons.add, color: kdefWhiteColor),
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewContactAdd(),
                      ),
                    );
                  },
                  name: 'Create New contact',
                  backgroundColor: Color.fromARGB(255, 0, 9, 88),
                ),
                CommonCard(
                  icon: Icon(Icons.search, color: kdefWhiteColor),
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContactDetail(),
                      ),
                    );
                  },
                  name: 'Search contact',
                  backgroundColor: Color.fromARGB(255, 0, 9, 88),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
