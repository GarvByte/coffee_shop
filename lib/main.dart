import 'package:coffee_shop/pages/first_page.dart';
import 'package:coffee_shop/pages/second_page.dart';
import 'package:coffee_shop/pages/third_page.dart'; // Corrected typo
import 'package:coffee_shop/pages/fourth_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/first_page.dart': (context) => FirstPage(),
        '/second_page.dart': (context) => SecondPage(), // Corrected typo
        '/third_page.dart': (context) => ThirdPage(),
        '/fourth_page.dart': (context) => FourthPage(),
      },
    );
  }
}
