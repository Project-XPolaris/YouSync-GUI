import 'package:flutter/material.dart';
import 'package:yousync/page/start/start.dart';

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
        primaryColor: Colors.blue,
        accentColor: Colors.orange,
        appBarTheme: AppBarTheme(
          elevation: 1
        ),
      ),
      home: StartPage(),
    );
  }
}
