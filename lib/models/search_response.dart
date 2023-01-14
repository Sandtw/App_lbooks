import 'dart:convert';
import 'package:lbooks_app/models/models.dart';

class SearchResponse {
    SearchResponse({
        this.kind,
        this.totalBooks,
        this.books,
    });

    String? kind;
    int? totalBooks;
    List<Book?>? books;

    factory SearchResponse.fromJson(String str) => SearchResponse.fromMap(json.decode(str));

    factory SearchResponse.fromMap(Map<String, dynamic> json) => SearchResponse(
        kind: json["kind"],
        totalBooks: json["totalBooks"],
        books: json["items"] == null ? [] : List<Book?>.from(json["items"]!.map((x) => Book.fromMap(x))),
    );

}

