import 'package:flutter/material.dart';
import 'package:flutter_project/hidden_drawer.dart';
import 'package:flutter_project/page/home_page.dart';
import 'package:flutter_project/splash.dart';
import 'package:flutter_project/start_page.dart';
import 'page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}




