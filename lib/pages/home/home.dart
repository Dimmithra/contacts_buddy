import 'package:contacts_buddy/pages/home/add_contact/addnew_contact.dart';
import 'package:contacts_buddy/pages/home/contact_Details/contact_Details.dart';
import 'package:contacts_buddy/pages/home/edit_contact/edit_contact.dart';
import 'package:contacts_buddy/utils/colors.dart';
import 'package:contacts_buddy/utils/main_body.dart';
import 'package:contacts_buddy/widgets/common_card.dart';
import 'package:contacts_buddy/widgets/common_contact_card.dart';
import 'package:contacts_buddy/widgets/common_loader.dart';
import 'package:contacts_buddy/widgets/common_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:contacts_buddy/providers/contact_provider.dart';

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
      body:
          // SingleChildScrollView(
          // child: Padding(
          //   padding: EdgeInsets.only(
          //       top: MediaQuery.of(context).size.height / 5,
          //       bottom: MediaQuery.of(context).size.height / 2),
          //   child: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         CommonCard(
          //           icon: Icon(Icons.add, color: kdefWhiteColor),
          //           onpress: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => const NewContactAdd(),
          //               ),
          //             );
          //           },
          //           name: 'Create New contact',
          //           backgroundColor: Color.fromARGB(255, 0, 9, 88),
          //         ),
          //         CommonCard(
          //           icon: Icon(Icons.search, color: kdefWhiteColor),
          //           onpress: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => const ContactDetail(),
          //               ),
          //             );
          //           },
          //           name: 'Search contact',
          //           backgroundColor: Color.fromARGB(255, 0, 9, 88),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // ),
          Consumer<ContactProvider>(
        builder: (context, contactProvider, child) {
          if (contactProvider.getloadHomeData) {
            return const Center(child: CommonPageLoader());
          }
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView.builder(
                itemCount: contactProvider.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CommonContactCard(
                      title: contactProvider.data[index]['firstName'],
                      subTitle: contactProvider.data[index]['primaryMobileNo'],
                      firstName:
                          'Firstname:${contactProvider.data[index]['firstName']}',
                      lastName:
                          'Last name:${contactProvider.data[index]['lastName']}',
                      pMobileNo:
                          'Mobile No 1:${contactProvider.data[index]['primaryMobileNo']}',
                      secMobileNo:
                          'Mobile No 2:${contactProvider.data[index]['secondoryNo']}',
                      email: 'Email:${contactProvider.data[index]['email']}',
                      specialNote:
                          'Special Note:${contactProvider.data[index]['specialNote']}',
                      onpressDelete: () {
                        setState(() {
                          contactProvider.deleteRecord(
                            context,
                            mobileNo: contactProvider.data[index]
                                ['primaryMobileNo'],
                          );
                          // commonMessage(
                          //   context,
                          //   errorTxt: 'Are Sure Delete Contact Record',
                          //   btnType: 3,
                          //   buttons: [
                          //     // DialogButton(
                          //     //   color: kDeleteColor,
                          //     //   child: const Text(
                          //     //     'Yes',
                          //     //     style: TextStyle(
                          //     //       fontWeight: FontWeight.bold,
                          //     //       color: kdefWhiteColor,
                          //     //     ),
                          //     //   ),
                          //     //   onPressed: () {
                          //     //     setState(
                          //     //       () {
                          //     //         contactProvider.deleteRecord(
                          //     //           context,
                          //     //           mobileNo: contactProvider.data[index]
                          //     //               ['primaryMobileNo'],
                          //     //         );
                          //     //         Navigator.push(
                          //     //           context,
                          //     //           MaterialPageRoute(
                          //     //             builder: (context) => HomeScreen(),
                          //     //           ),
                          //     //         );
                          //     //       },
                          //     //     );
                          //     //   },
                          //     // ),
                          //     // DialogButton(
                          //     //   color: kPrimaryBtn,
                          //     //   child: const Text(
                          //     //     'NO',
                          //     //     style: TextStyle(
                          //     //       fontWeight: FontWeight.bold,
                          //     //       color: kdefWhiteColor,
                          //     //     ),
                          //     //   ),
                          //     //   onPressed: () {
                          //     //     Navigator.pop(context);
                          //     //   },
                          //     // ),
                          //   ],
                          // ).show();
                        });
                      },
                      onpressUpdate: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditeContactScreen(
                              firstName:
                                  '${contactProvider.data[index]['firstName']}',
                              lastName:
                                  '${contactProvider.data[index]['lastName']}',
                              mobileNo1:
                                  '${contactProvider.data[index]['primaryMobileNo']}',
                              mobileNo2:
                                  '${contactProvider.data[index]['secondoryNo']}',
                              email: '${contactProvider.data[index]['email']}',
                              spNote:
                                  '${contactProvider.data[index]['specialNote']}',
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewContactAdd(),
            ),
          );
        },
      ),
    );
  }
}
