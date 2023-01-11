import 'package:flutter/material.dart';
import 'package:lbooks_app/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route = 'splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), (() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
        (route) => false,
      );
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
            "assets/icon/icon.png",
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: CircularProgressIndicator(
              color: Colors.amberAccent,
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
