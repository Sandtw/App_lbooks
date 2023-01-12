import 'dart:convert';
import 'package:lbooks_app/models/models.dart';

class VolumeCategoryResponse {
    VolumeCategoryResponse({
        this.kind,
        this.totalBooks,
        this.books,
    });

    String? kind;
    int? totalBooks;
    List<Book?>? books;

    factory VolumeCategoryResponse.fromJson(String str) => VolumeCategoryResponse.fromMap(json.decode(str));

    factory VolumeCategoryResponse.fromMap(Map<String, dynamic> json) => VolumeCategoryResponse(
        kind: json["kind"],
        totalBooks: json["totalBooks"],
        books: json["items"] == null ? [] : List<Book?>.from(json["items"]!.map((x) => Book.fromMap(x))),
    );


}


