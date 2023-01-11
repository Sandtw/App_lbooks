import 'package:flutter/material.dart';
import 'package:lbooks_app/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Book reading',
      // debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
