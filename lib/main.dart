import 'package:flutter/material.dart';
import 'package:lbooks_app/screens/screens.dart';
import 'package:lbooks_app/providers/books_provider.dart';
import 'package:lbooks_app/services/auth_services.dart';
import 'package:lbooks_app/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
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
        '/': (context) => const Wrapper(),
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
