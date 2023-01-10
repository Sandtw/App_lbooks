import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lbooks_app/screens/screens.dart';

class LoginScreen extends StatefulWidget {
  static const String route = 'login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var textStyle =
        TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.45));
    return Scaffold(
      backgroundColor: const Color(0xffD9D9D9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SafeArea(
                child: Center(
                  child: Image.asset(
                    'assets/imgs/iconoredondo.png',
                    height: 250,
                    width: 150,
                  ),
                ),
              ),
              Text(
                'Bienvenido, ingrese sus datos',
                style: textStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: ' usuario@gmail.com',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: ' **************',
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '¿Olvidaste tu contraseña?',
                    style: textStyle,
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFAC54C)
                    // gradient: const LinearGradient(
                    //   colors: [
                    //     Color.fromARGB(255, 209, 211, 47),
                    //     Color.fromARGB(221, 152, 114, 10),
                    //   ],
                    // ),
                    ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomeScreen.route);
                  },
                  child: Text(
                    'Ingresar',
                    style: GoogleFonts.libreBaskerville(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'O puede continuar con',
                    style: textStyle,
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.google,
                        color: Color(0xffFAC54C),
                        size: 40,
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
