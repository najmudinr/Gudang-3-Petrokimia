import 'package:flutter/material.dart';
import 'package:gudanng3/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoring Gudang & Pengantongan',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(239, 175, 12, 100))
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}