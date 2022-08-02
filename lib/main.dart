import 'package:flutter/material.dart';
import 'package:recipedia_app/views/start.dart';

void main() {
  runApp(const RecipediaApp());
}

class RecipediaApp extends StatelessWidget {
  const RecipediaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipedia',
      theme: ThemeData(
        fontFamily: 'Inter',
        primarySwatch: Colors.orange,
        primaryColor: Colors.white,
      ),
      home: const StartPage(),
    );
  }
}
