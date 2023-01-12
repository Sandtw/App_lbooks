import 'package:flutter/material.dart';
import 'package:lbooks_app/screens/screens.dart';
import 'package:lbooks_app/providers/books_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BooksProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
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
        DetailsScreen.route: (_) => const DetailsScreen()
      },
    );
  }
}
