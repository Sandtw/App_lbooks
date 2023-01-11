import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lbooks_app/screens/screens.dart';

class WelcomeScreen extends StatelessWidget {
  static const String route = 'welcome';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'assets/imgs/welcome.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/icon/icon.png',
                      width: 180,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Bienvenido',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.libreBaskerville(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Los mejores libros para leer gratis',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dancingScript(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 350,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 209, 211, 47),
                          Color.fromARGB(221, 152, 114, 10),
                        ],
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.route);
                      },
                      child: Text(
                        'Iniciar Sesión',
                        style: GoogleFonts.libreBaskerville(
                          color: const Color.fromARGB(255, 19, 22, 52),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: 350,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 209, 211, 47),
                            Color.fromARGB(221, 152, 114, 10),
                          ],
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SignInScreen.route);
                        },
                        child: Text(
                          'Registrarse',
                          style: GoogleFonts.libreBaskerville(
                            color: const Color.fromARGB(255, 19, 22, 52),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
