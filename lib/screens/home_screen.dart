import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lbooks_app/providers/books_provider.dart';
import 'package:lbooks_app/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:lbooks_app/widgets/books_slider.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:lbooks_app/search/search_delegate.dart';

import '../services/auth_services.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final foto = ModalRoute.of(context)!.settings.arguments as String;
    // FileImage(
    //                     File(foto),
    //                   ),
    final booksProvider = Provider.of<BooksProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xffD9D9D9),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _MyHeaderHome(),
          ),
          _SliverBody(booksProvider: booksProvider)
        ],
      ),
    );
  }
}

const double _maxHeaderExtent = 230;
const double _minHeaderExtent = 100;

const double _maxImageSize = 160;
const double _minImageSize = 40;

Future getDataFirebase() async {
  final document = await FirebaseFirestore.instance
      .collection("user")
      .doc("9oGRHjPL6dFtX106w5MC")
      .get();

  return document;
}

class _MyHeaderHome extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = MediaQuery.of(context).size;
    final percent = shrinkOffset / _maxHeaderExtent;
    final currentSizeImage =
        (_maxImageSize * (1 - percent)).clamp(_minImageSize, _maxImageSize);
    final authService = Provider.of<AuthService>(context);
    return FutureBuilder(
      future: getDataFirebase(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            decoration: const BoxDecoration(
              color: Color(0xffFAC54C),
              image: DecorationImage(
                  image: AssetImage('assets/imgs/overlay.png'),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  left: size.width / 5.5,
                  height: 150,
                  child: Container(
                    margin: const EdgeInsets.only(left: 30),
                    decoration: BoxDecoration(
                      color: const Color(0xffFAC54C).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Bienvenido ${snapshot.data["nombre"]}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  left: (135 * (1 - percent)).clamp(1, 135),
                  height: currentSizeImage,
                  child: Transform.rotate(
                    angle: vector.radians(360 * percent),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      maxRadius: 60,
                      backgroundImage: FileImage(File(snapshot.data["foto"])),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 50,
                  child: IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      authService.signOut();
                      Navigator.pushReplacementNamed(
                          context, WelcomeScreen.route);
                    },
                  ),
                ),
                Positioned(
                  right: 45,
                  top: 50,
                  child: IconButton(
                    onPressed: () => showSearch(
                        context: context, delegate: BookSearchDelegate()),
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _minHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _SliverBody extends StatelessWidget {
  const _SliverBody({
    Key? key,
    required this.booksProvider,
  }) : super(key: key);

  final BooksProvider booksProvider;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(
            height: 25,
          ),
          BookSlider(
            books: booksProvider.thrillerBooks,
            title: 'Libros Populares de Terror',
          ),
          BookSlider(
            books: booksProvider.fantasyBooks,
            title: 'Libros Populares de Fantasía',
          ),
          BookSlider(
            books: booksProvider.horrorBooks,
            title: 'Libros Populares de Horror',
          ),
          BookSlider(
            books: booksProvider.healthBooks,
            title: 'Libros Populares de Salud',
          )
        ],
      ),
    );
  }
}
