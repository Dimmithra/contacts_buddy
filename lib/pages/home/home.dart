import 'package:contacts_buddy/pages/home/add_contact/addnew_contact.dart';
import 'package:contacts_buddy/pages/home/contact_Details/contact_Details.dart';
import 'package:contacts_buddy/pages/home/edit_contact/edit_contact.dart';
import 'package:contacts_buddy/utils/colors.dart';
import 'package:contacts_buddy/utils/main_body.dart';
import 'package:contacts_buddy/widgets/common_card.dart';
import 'package:contacts_buddy/widgets/common_contact_card.dart';
import 'package:contacts_buddy/widgets/common_loader.dart';
import 'package:contacts_buddy/widgets/common_message.dart';
import 'package:contacts_buddy/widgets/common_textfeild.dart';
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
      body: Consumer<ContactProvider>(
        builder: (context, contactProvider, child) {
          if (contactProvider.getloadHomeData) {
            return const Center(child: CommonPageLoader());
          }
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonTextFeil(
                    hinttext: 'Search',
                    label: 'Search',
                    suffixIcon: Icon(
                      Icons.search,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 75),
                child: ListView.builder(
                    itemCount: contactProvider.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      // final item =
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CommonContactCard(
                              title: contactProvider.data[index]['firstName'],
                              subTitle: contactProvider.data[index]
                                  ['primaryMobileNo'],
                              firstName:
                                  'Firstname:${contactProvider.data[index]['firstName']}',
                              lastName:
                                  'Last name:${contactProvider.data[index]['lastName']}',
                              pMobileNo:
                                  'Mobile No 1:${contactProvider.data[index]['primaryMobileNo']}',
                              secMobileNo:
                                  'Mobile No 2:${contactProvider.data[index]['secondoryNo']}',
                              email:
                                  'Email:${contactProvider.data[index]['email']}',
                              specialNote:
                                  'Special Note:${contactProvider.data[index]['specialNote']}',
                              delete: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      contactProvider.deleteRecord(
                                        context,
                                        mobileNo: contactProvider.data[index]
                                            ['primaryMobileNo'],
                                      );
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 35,
                                  )),
                              updateIcon: IconButton(
                                onPressed: () {
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
                                        email:
                                            '${contactProvider.data[index]['email']}',
                                        spNote:
                                            '${contactProvider.data[index]['specialNote']}',
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                              mobile1: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                    size: 35,
                                  )),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ],
            // child: Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: ListView.builder(
            //       itemCount: contactProvider.data.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Column(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.all(5.0),
            //               child: CommonContactCard(
            //                 title: contactProvider.data[index]['firstName'],
            //                 subTitle: contactProvider.data[index]
            //                     ['primaryMobileNo'],
            //                 firstName:
            //                     'Firstname:${contactProvider.data[index]['firstName']}',
            //                 lastName:
            //                     'Last name:${contactProvider.data[index]['lastName']}',
            //                 pMobileNo:
            //                     'Mobile No 1:${contactProvider.data[index]['primaryMobileNo']}',
            //                 secMobileNo:
            //                     'Mobile No 2:${contactProvider.data[index]['secondoryNo']}',
            //                 email:
            //                     'Email:${contactProvider.data[index]['email']}',
            //                 specialNote:
            //                     'Special Note:${contactProvider.data[index]['specialNote']}',
            //                 delete: IconButton(
            //                     onPressed: () {
            //                       setState(() {
            //                         contactProvider.deleteRecord(
            //                           context,
            //                           mobileNo: contactProvider.data[index]
            //                               ['primaryMobileNo'],
            //                         );
            //                       });
            //                     },
            //                     icon: const Icon(
            //                       Icons.delete,
            //                       color: Colors.white,
            //                       size: 35,
            //                     )),
            //                 updateIcon: IconButton(
            //                     onPressed: () {
            //                       Navigator.push(
            //                         context,
            //                         MaterialPageRoute(
            //                           builder: (context) => EditeContactScreen(
            //                             firstName:
            //                                 '${contactProvider.data[index]['firstName']}',
            //                             lastName:
            //                                 '${contactProvider.data[index]['lastName']}',
            //                             mobileNo1:
            //                                 '${contactProvider.data[index]['primaryMobileNo']}',
            //                             mobileNo2:
            //                                 '${contactProvider.data[index]['secondoryNo']}',
            //                             email:
            //                                 '${contactProvider.data[index]['email']}',
            //                             spNote:
            //                                 '${contactProvider.data[index]['specialNote']}',
            //                           ),
            //                         ),
            //                       );
            //                     },
            //                     icon: const Icon(
            //                       Icons.edit,
            //                       color: Colors.white,
            //                       size: 35,
            //                     )),
            //               ),
            //             ),
            //           ],
            //         );
            //       }),
            // ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        child: const Icon(Icons.add, size: 35),
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
