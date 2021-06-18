import 'package:flutter/material.dart';
import 'package:yousync/page/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouSync',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.yellow,
        appBarTheme: AppBarTheme(
          elevation: 1
        )
      ),
      home: HomePage(),
    );
  }
}
