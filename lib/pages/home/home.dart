import 'dart:io';

import 'package:contacts_buddy/pages/home/add_contact/addnew_contact.dart';
import 'package:contacts_buddy/pages/home/contact_Details/contact_Details.dart';
import 'package:contacts_buddy/pages/home/edit_contact/edit_contact.dart';
import 'package:contacts_buddy/utils/colors.dart';
import 'package:contacts_buddy/utils/main_body.dart';
import 'package:contacts_buddy/widgets/common_btn.dart';
import 'package:contacts_buddy/widgets/common_card.dart';
import 'package:contacts_buddy/widgets/common_contact_card.dart';
import 'package:contacts_buddy/widgets/common_loader.dart';
import 'package:contacts_buddy/widgets/common_message.dart';
import 'package:contacts_buddy/widgets/common_textfeild.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts_buddy/providers/contact_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
      Provider.of<ContactProvider>(context, listen: false)
          .initPackageInfo(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: 'Welcome',
      appBarColor: kDefAppBarColor,
      automaticallyImplyLeading: true,
      appbarTitleColor: Colors.white,
      drawer: Consumer<ContactProvider>(
        builder: (context, contactProvider, child) {
          return Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/drawer_image_light_mode.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  accountEmail: const Text(''),
                  accountName: Container(
                    child: Text(
                      "Welcome",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  currentAccountPicture: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/user_image.png'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTileCard(
                      title: const Text('Settings',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Change Mode'),
                                  Switch(
                                    value: contactProvider.getDarkTheme,
                                    onChanged: (value) {
                                      setState(() {
                                        contactProvider.toggleTheme();
                                      });
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                      finalPadding: EdgeInsets.all(10)),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              contactProvider.time,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              contactProvider.date,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Version ${contactProvider.packageInfo.version}',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                      // CommonBtn(
                      //     backgroundColor: contactProvider.darkMode
                      //         ? Colors.lightBlue
                      //         : Colors.grey,
                      //     fontColor: kdefWhiteColor,
                      //     onPress: () {
                      //       Navigator.pushAndRemoveUntil(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => exit(0),
                      //         ),
                      //         (route) => false,
                      //       );
                      //     },
                      //     btnName: 'Close'),
                      ),
                )
              ],
            ),
          );
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 227, 226, 226),
              Colors.white,
            ],
          ),
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
                    hinttextColor:
                        contactProvider.darkMode ? Colors.black : Colors.black,
                    labelColor:
                        contactProvider.darkMode ? Colors.black : Colors.black,
                    controller: contactProvider.getsearchController,
                    fillColor: contactProvider.darkMode
                        ? Colors.white
                        : kdefWhiteColor,
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
                  padding: const EdgeInsets.only(top: 75),
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
                                    baseColor: contactProvider.darkMode
                                        ? kDefAppBarColor
                                        : kdefWhiteColor,
                                    expandedColor: contactProvider.darkMode
                                        ? kDefAppBarColor
                                        : kdefWhiteColor,
                                    iconColor: contactProvider.darkMode
                                        ? kdefWhiteColor
                                        : kDefAppBarColor,
                                    titleColor: contactProvider.darkMode
                                        ? kdefWhiteColor
                                        : kDefAppBarColor,
                                    subTitleColor: contactProvider.darkMode
                                        ? kdefWhiteColor
                                        : kDefAppBarColor,
                                    title: contactProvider.data[index]
                                        ['firstName'],
                                    subTitle: contactProvider.data[index]
                                        ['primaryMobileNo'],
                                    firstName:
                                        '${contactProvider.data[index]['firstName']}',
                                    lastName:
                                        '${contactProvider.data[index]['lastName']}',
                                    pMobileNo:
                                        ':${contactProvider.data[index]['primaryMobileNo']}',
                                    secMobileNo:
                                        ':${contactProvider.data[index]['secondoryNo']}',
                                    email:
                                        '${contactProvider.data[index]['email']}',
                                    specialNote:
                                        'SpNote:${contactProvider.data[index]['specialNote']}',
                                    //delete button
                                    delete: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            commonMessage(context,
                                                errorTxt:
                                                    'Are you sure you Delete this ${contactProvider.data[index]['primaryMobileNo']} Number',
                                                btnType: 3,
                                                buttons: [
                                                  DialogButton(
                                                    color: kDeleteColor,
                                                    child: const Text("Delete",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                    onPressed: () {
                                                      (context);
                                                      contactProvider
                                                          .deleteRecord(
                                                        context,
                                                        mobileNo: contactProvider
                                                                .data[index]
                                                            ['primaryMobileNo'],
                                                      );
                                                    },
                                                  ),
                                                  DialogButton(
                                                    color: kPrimaryBtn,
                                                    child: const Text("cancel",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                    onPressed: () {
                                                      (context);
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                ]).show();
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
                                                color: kPrimaryBtn,
                                                size: 35,
                                              ),
                                              Text(
                                                '1',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: kPrimaryBtn,
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
                                                  color: kDefTextColor,
                                                  size: 35,
                                                ),
                                                Text(
                                                  '2',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: kDefTextColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                    share: () {
                                      contactProvider.onShare(
                                        context,
                                        fname: contactProvider.data[index]
                                            ['firstName'],
                                        lname: contactProvider.data[index]
                                            ['lastName'],
                                        mobile1: contactProvider.data[index]
                                            ['primaryMobileNo'],
                                        mobile2: contactProvider.data[index]
                                            ['secondoryNo'],
                                      );
                                    },
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
