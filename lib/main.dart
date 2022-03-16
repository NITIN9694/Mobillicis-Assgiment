// ignore_for_file: prefer_const_constructors

import 'package:assignment/Screen/Barometer.dart';
import 'package:assignment/Screen/Gyroscope.dart';
import 'package:assignment/Screen/HomeScreen.dart';
import 'package:assignment/Screen/IP_address.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
