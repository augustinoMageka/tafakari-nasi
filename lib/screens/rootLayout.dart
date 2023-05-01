import 'package:flutter/material.dart';
import 'package:tafakari/components/mydrawer.dart';

class RootLayout extends StatelessWidget {
  final Widget body;
  final String appBarTitle;
  RootLayout({required this.body, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            appBarTitle,
          ),
          elevation: 0,
        ),
        drawer: MyDrawer(),
        body: body,
      ),
    ));
  }
}
