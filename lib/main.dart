import 'package:flutter/material.dart';
import 'package:ramene/view/login/login.dart';

import 'view/home/home.dart';
import 'view/profile/profile.dart';

import 'navigator/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
    );
  }
}
