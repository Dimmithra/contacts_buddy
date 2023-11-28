import 'package:flutter/material.dart';

class MainBody extends StatefulWidget {
  const MainBody({
    super.key,
    required this.body,
    required this.title,
    this.floatingActionButton,
  });

  final Widget body;
  final String title;
  final Widget? floatingActionButton;
  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: widget.body,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
