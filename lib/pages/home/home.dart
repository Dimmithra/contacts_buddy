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
      body: Container(
        decoration: BoxDecoration(
            // gradient: LinearGradient(colors: [
            //   // Colors.black,
            //   // backgroundColor.withOpacity(.72),
            // ]),
            ),
        child: Consumer<ContactProvider>(
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
                    controller: contactProvider.getsearchController,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            contactProvider.filter(
                                searchData:
                                    contactProvider.getsearchController.text);
                          });
                        },
                        icon: const Icon(Icons.search)),
                    onChanged: (p0) {
                      setState(() {
                        contactProvider.filter(
                            searchData:
                                contactProvider.getsearchController.text);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 75),
                  child: FutureBuilder<void>(
                    future: contactProvider.filter(
                        searchData: contactProvider.searchTerm),
                    builder: (context, snapshot) {
                      return ListView.builder(
                          itemCount: contactProvider.data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CommonContactCard(
                                    title: contactProvider.data[index]
                                        ['firstName'],
                                    subTitle: contactProvider.data[index]
                                        ['primaryMobileNo'],
                                    firstName:
                                        'F-Name:${contactProvider.data[index]['firstName']}',
                                    lastName:
                                        'L-Name:${contactProvider.data[index]['lastName']}',
                                    pMobileNo:
                                        'M-1:${contactProvider.data[index]['primaryMobileNo']}',
                                    secMobileNo:
                                        'M-2:${contactProvider.data[index]['secondoryNo']}',
                                    email:
                                        'E:${contactProvider.data[index]['email']}',
                                    specialNote:
                                        'SpNote:${contactProvider.data[index]['specialNote']}',
                                    delete: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            contactProvider.deleteRecord(
                                              context,
                                              mobileNo:
                                                  contactProvider.data[index]
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
                                            builder: (context) =>
                                                EditeContactScreen(
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
                                    mobile1: Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            contactProvider.launchCaller(
                                                context,
                                                contactNo:
                                                    contactProvider.data[index]
                                                        ['primaryMobileNo']);
                                          },
                                          icon: const Row(
                                            children: [
                                              Icon(
                                                Icons.phone,
                                                color: Colors.white,
                                                size: 35,
                                              ),
                                              Text(
                                                '1',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    mobile2: Column(
                                      children: [
                                        if (contactProvider.data[index]
                                                ['secondoryNo'] !=
                                            '')
                                          IconButton(
                                            onPressed: () {
                                              contactProvider.launchCaller(
                                                  context,
                                                  contactNo: contactProvider
                                                          .data[index]
                                                      ['secondoryNo']);
                                            },
                                            icon: const Row(
                                              children: [
                                                Icon(
                                                  Icons.phone,
                                                  color: Colors.white,
                                                  size: 35,
                                                ),
                                                Text(
                                                  '2',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                )
              ],
            );
          },
        ),
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
