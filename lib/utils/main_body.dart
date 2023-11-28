import 'package:contacts_buddy/utils/colors.dart';
import 'package:flutter/material.dart';

class MainBody extends StatefulWidget {
  const MainBody({
    super.key,
    required this.body,
    required this.title,
    this.floatingActionButton,
    this.appBarColor,
    this.appbarTitleColor,
    this.automaticallyImplyLeading = true,
  });

  final Widget body;
  final String title;
  final Widget? floatingActionButton;
  final Color? appBarColor;
  final Color? appbarTitleColor;
  final bool automaticallyImplyLeading;
  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.appBarColor,
        centerTitle: true,
        automaticallyImplyLeading: widget.automaticallyImplyLeading,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            color: widget.appbarTitleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: widget.body,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
