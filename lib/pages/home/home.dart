import 'package:contacts_buddy/pages/add_contact/addnew_contact.dart';
import 'package:contacts_buddy/utils/colors.dart';
import 'package:contacts_buddy/utils/main_body.dart';
import 'package:contacts_buddy/widgets/common_contact_card.dart';
import 'package:contacts_buddy/widgets/common_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/contact_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ContactProvider>(context, listen: false)
          .loadAllContactRecords(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: 'Welcome',
      appBarColor: kDefAppBarColor,
      automaticallyImplyLeading: false,
      appbarTitleColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Consumer<ContactProvider>(
            builder: (context, contactProvider, child) {
              if (contactProvider.getloadHomeData) {
                return const CommonPageLoader();
              }
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    for (int i = 0; i < contactProvider.data.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CommonContactCard(
                          title: contactProvider.data[i]['firstName'],
                          subTitle: contactProvider.data[i]['primaryMobileNo'],
                          firstName:
                              'Firstname:${contactProvider.data[i]['primaryMobileNo']}',
                          lastName:
                              'Last name:${contactProvider.data[i]['lastName']}',
                          pMobileNo:
                              'Mobile No 1:${contactProvider.data[i]['primaryMobileNo']}',
                          secMobileNo:
                              'Mobile No 2:${contactProvider.data[i]['secondoryNo']}',
                          email: 'Email:${contactProvider.data[i]['email']}',
                          specialNote:
                              'Special Note:${contactProvider.data[i]['specialNote']}',
                        ),
                      )
                  ],
                ),
              );
            },
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewContactAdd(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.green,
          size: 45,
        ),
      ),
    );
  }
}
