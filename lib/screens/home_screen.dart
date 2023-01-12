import 'package:flutter/material.dart';
import 'package:lbooks_app/providers/books_provider.dart';
import 'package:provider/provider.dart';
import 'package:lbooks_app/widgets/books_slider.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Libros Populares')),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookSlider(
                books: booksProvider.thrillerBooks,
                title: 'Libros Populares de Terror'),
            BookSlider(
                books: booksProvider.fantasyBooks,
                title: 'Libros Populares de Fantasía'),
            BookSlider(
                books: booksProvider.horrorBooks,
                title: 'Libros Populares de Horror'),
            BookSlider(
                books: booksProvider.healthBooks,
                title: 'Libros Populares de Salud')
          ],
        ),
      ),
    );
  }
}
