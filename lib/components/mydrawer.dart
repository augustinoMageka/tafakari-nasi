import 'package:flutter/material.dart';
import 'package:tafakari/screens/tafakariScreen.dart';
import 'package:tafakari/screens/salaScreen.dart';
import 'package:tafakari/screens/aboutScreen.dart';

class MyDrawer extends StatelessWidget {
  final _kTextSyle = TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            // leading: Icon(Icons.people),
            title: Text('Tafakari Nasi', style: _kTextSyle),
            onTap: () {
              Navigator.of(context).pushNamed(TafakariHomeScreen.routeName);
            },
          ),
          ListTile(
            // leading: Icon),
            title: Text(
              'Sala',
              style: _kTextSyle,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(SalaScreen.routeName);
            },
          ),
          ListTile(
            // leading: Icon),
            title: Text(
              'Kuhusu Sisi',
              style: _kTextSyle,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(AboutScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
