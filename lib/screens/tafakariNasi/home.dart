import 'package:flutter/material.dart';

class TafakariHomeScreen extends StatefulWidget {
  static const routeName = '/tafakari-home';
  const TafakariHomeScreen({super.key});

  @override
  State<TafakariHomeScreen> createState() => _TafakariHomeScreenState();
}

class _TafakariHomeScreenState extends State<TafakariHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      appBar: AppBar(
        title: Text('Tafakari Nasi'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
          ],
        ),
      ),
    ));
  }
}
