import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fresh_room/firstpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: Skiper(),
  ));
}
