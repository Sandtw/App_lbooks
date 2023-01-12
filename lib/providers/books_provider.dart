import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lbooks_app/models/models.dart';
import 'package:provider/provider.dart';

class BooksProvider extends ChangeNotifier{
  final String _apiKey = 'AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA';
  final String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';
  final String _q = 'subject:';
  final String _download = 'epub';
  final String _orderBy = 'newest';

  List<Book?>? thrillerBooks = [];
  List<Book?>? fantasyBooks = [];
  List<Book?>? horrorBooks = [];
  List<Book?>? healthBooks = [];

  
   MoviesProvider(){
      getPopularBooks();
  }

   Future<String> _getJsonData(String category) async{
      final url = Uri.https(_baseUrl, '', {
        'q': _q+category,
        'download': _download,
        'orderBy': _orderBy,
        'key': _apiKey,
      });

      final response = await http.get(url);
      return response.body;
  }

    getPopularBooks() async {
    final jsonDataThriller = await this._getJsonData('thriller');
    final jsonDataFantasy = await this._getJsonData('fantasy');
    final jsonDataHorror = await this._getJsonData('horror');
    final jsonDataHealth = await this._getJsonData('health');

    final thrillerResponse = VolumeCategoryResponse.fromJson(jsonDataThriller);
    final fantasyResponse = VolumeCategoryResponse.fromJson(jsonDataFantasy);
    final horrorResponse = VolumeCategoryResponse.fromJson(jsonDataHorror);
    final healthResponse = VolumeCategoryResponse.fromJson(jsonDataHealth);


    // Listado de películas populares List<Movie>, quiero de todas las pages en una sola lista
    thrillerBooks = thrillerResponse.books;
    fantasyBooks = fantasyResponse.books;
    horrorBooks = horrorResponse.books;
    healthBooks = healthResponse.books;

    notifyListeners();
  }
}