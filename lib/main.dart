import 'package:flutter/material.dart';
import 'package:lbooks_app/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Book reading',
      initialRoute: SplashScreen.route,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.route: (_) => const SplashScreen(),
        WelcomeScreen.route: (_) => const WelcomeScreen(),
        LoginScreen.route: (_) => const LoginScreen(),
        SignInScreen.route: (_) => const SignInScreen(),
        HomeScreen.route: (_) => const HomeScreen(),
      },
    );
  }
}
