import 'package:contacts_buddy/pages/add_contact/addnew_contact.dart';
import 'package:contacts_buddy/utils/colors.dart';
import 'package:contacts_buddy/utils/main_body.dart';
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
      Provider.of<ContactProvider>(context, listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: 'Dashboard',
      appBarColor: kDefAppBarColor,
      automaticallyImplyLeading: false,
      appbarTitleColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Consumer(
            builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [],
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
