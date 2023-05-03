import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:tafakari/screens/tafakariScreen.dart';
import 'package:tafakari/screens/salaScreen.dart';
import 'package:tafakari/screens/aboutScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tafakari Nasi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: TafakariHomeScreen.routeName,
      routes: {
        TafakariHomeScreen.routeName: (context) => TafakariHomeScreen(),
        SalaScreen.routeName: (context) => SalaScreen(),
        AboutScreen.routeName: (context) => AboutScreen(),
      },
    );
  }
}
