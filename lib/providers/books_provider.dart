import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lbooks_app/models/models.dart';
import 'package:lbooks_app/helpers/debouncer.dart';

class BooksProvider extends ChangeNotifier {
  final String _apiKey = 'AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA';
  final String _baseUrl = 'www.googleapis.com';
  final String _q = 'subject:';
  final String _download = 'epub';
  final String _orderBy = 'newest';

  List<Book?>? thrillerBooks = [];
  List<Book?>? fantasyBooks = [];
  List<Book?>? horrorBooks = [];
  List<Book?>? healthBooks = [];

  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));
  final StreamController<List<Book?>?> _suggestionStreamController =
      new StreamController.broadcast();
  Stream<List<Book?>?> get suggestionStream =>
      _suggestionStreamController.stream;

  BooksProvider() {
    getThrilerBooks();
    getFantasyBooks();
    getHorrorBooks();
    getHealthBooks();
  }

  Future<String> _getJsonData(String category, [int maxResults = 15]) async {
    final url = Uri.https(_baseUrl, '/books/v1/volumes', {
      'q': _q + category,
      'download': _download,
      'orderBy': _orderBy,
      'key': _apiKey,
      'maxResults': '$maxResults'
    });

    final response = await http.get(url);
    return response.body;
  }

  getThrilerBooks() async {
    final jsonDataThriller = await _getJsonData('thriller');

    final thrillerResponse = VolumeCategoryResponse.fromJson(jsonDataThriller);

    thrillerBooks = thrillerResponse.books;

    notifyListeners();
  }

  getFantasyBooks() async {
    final jsonDataFantasy = await _getJsonData('fantasy');

    final fantasyResponse = VolumeCategoryResponse.fromJson(jsonDataFantasy);

    fantasyBooks = fantasyResponse.books;

    notifyListeners();
  }

  getHorrorBooks() async {
    final jsonDataHorror = await _getJsonData('horror');

    final horrorResponse = VolumeCategoryResponse.fromJson(jsonDataHorror);

    horrorBooks = horrorResponse.books;
    notifyListeners();
  }

  getHealthBooks() async {
    final jsonDataHealth = await _getJsonData('health');

    final healthResponse = VolumeCategoryResponse.fromJson(jsonDataHealth);

    healthBooks = healthResponse.books;
    notifyListeners();
  }

  Future<List<Book?>?> searchBooks(String query) async {
    final url = Uri.https(_baseUrl, '/books/v1/volumes', {
      'q': 'intitle:$query',
      'maxResult': '40',
      'download': _download,
      'orderBy': _orderBy,
      'key': _apiKey,
    });

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    print(searchResponse.books);
    return searchResponse.books;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    // Asincrono, porque es donde se va llamar eventualmente el searchMovies
    debouncer.onValue = (value) async {
      final results = await this.searchBooks(value);
      this._suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }
}
