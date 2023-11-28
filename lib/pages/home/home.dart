import 'package:contacts_buddy/utils/main_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: 'Dashboard',
      body: SingleChildScrollView(child: Column()),
    );
  }
}
