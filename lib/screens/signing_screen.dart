import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lbooks_app/screens/screens.dart';

class SignInScreen extends StatelessWidget {
  static const String route = 'sign';

  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textStyle =
        TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.45));
    final name = TextEditingController();
    final email = TextEditingController();
    final foto = TextEditingController();
    final telefono = TextEditingController();
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
                'Bienvenido, Registre sus datos',
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
                  controller: name,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Ingrese su nombre',
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
                  controller: telefono,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Telefono',
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
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () async {
                        String nom = name.text;
                        String correo = email.text;
                        String celular = telefono.text;
                        final picker = ImagePicker();
                        final XFile? pickedFile = await picker.pickImage(
                          source: ImageSource.camera,
                          imageQuality: 100,
                        );
                        if (pickedFile == null) return;

                        FirebaseFirestore.instance
                            .collection("user")
                            .doc("9oGRHjPL6dFtX106w5MC")
                            .update({
                          "correo": correo,
                          "foto": pickedFile.path,
                          "nombre": nom,
                          "telefono": celular,
                        });
                      },
                      icon: const Icon(
                        Icons.photo,
                        color: Color(0xffFAC54C),
                      ),
                    ),
                    hintText: 'Usuario@gmail.com',
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
                    hintText: '**************',
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFAC54C)),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomeScreen.route);
                  },
                  child: Text(
                    'Registrarme',
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
                    'Recuerde seguirnos en nuestras redes sociales',
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
                        FontAwesomeIcons.instagram,
                        color: Colors.red,
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
                        FontAwesomeIcons.tiktok,
                        color: Colors.black,
                        size: 30,
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
                        FontAwesomeIcons.linkedin,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
