import 'dart:convert';

class Book {
    Book({
        this.id,
        this.etag,
        this.selfLink,
        this.volumeInfo,
        this.accessInfo,
    });

    String? id;
    String? etag;
    String? selfLink;
    VolumeInfo? volumeInfo;
    AccessInfo? accessInfo;

    factory Book.fromJson(String str) => Book.fromMap(json.decode(str));

    factory Book.fromMap(Map<String, dynamic> json) => Book(
        id: json["id"],
        volumeInfo: VolumeInfo.fromMap(json["volumeInfo"]),
        accessInfo: AccessInfo.fromMap(json["accessInfo"]),
    );

}

class AccessInfo {
    AccessInfo({
        this.epub,
        this.pdf,
        this.webReaderLink,
    });

   
    Epub? epub;
    Epub? pdf;
    String? webReaderLink;

    factory AccessInfo.fromJson(String str) => AccessInfo.fromMap(json.decode(str));


    factory AccessInfo.fromMap(Map<String, dynamic> json) => AccessInfo(
        epub: Epub.fromMap(json["epub"]),
        pdf: Epub.fromMap(json["pdf"]),
        webReaderLink: json["webReaderLink"],
    );
}


class Epub {
    Epub({
        this.isAvailable,
        this.acsTokenLink,
    });

    bool? isAvailable;
    String? acsTokenLink;

    factory Epub.fromJson(String str) => Epub.fromMap(json.decode(str));


    factory Epub.fromMap(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
        acsTokenLink: json["acsTokenLink"],
    );
}


class VolumeInfo {
    VolumeInfo({
        this.title,
        this.subtitle,
        this.authors,
        this.publisher,
        this.publishedDate,
        this.description,
        this.readingModes,
        this.pageCount,
        this.categories,
        this.averageRating,
        this.ratingsCount,
        this.allowAnonLogging,
        this.contentVersion,
        this.imageLinks,
        this.language,
        this.previewLink,
        this.infoLink,
        this.canonicalVolumeLink,
    });

    String? title;
    String? subtitle;
    List<String?>? authors;
    String? publisher;
    String? publishedDate;
    String? description;
    ReadingModes? readingModes;
    int? pageCount;
    List<String?>? categories;
    double? averageRating;
    int? ratingsCount;
    bool? allowAnonLogging;
    String? contentVersion;
    ImageLinks? imageLinks;
    String? language;
    String? previewLink;
    String? infoLink;
    String? canonicalVolumeLink;

    factory VolumeInfo.fromJson(String str) => VolumeInfo.fromMap(json.decode(str));

    factory VolumeInfo.fromMap(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        subtitle: json["subtitle"],
        authors: json["authors"] == null ? [] : List<String?>.from(json["authors"]!.map((x) => x)),
        publisher: json["publisher"],
        publishedDate: json["publishedDate"],
        description: json["description"],
        readingModes: ReadingModes.fromMap(json["readingModes"]),
        pageCount: json["pageCount"],
        categories: json["categories"] == null ? [] : List<String?>.from(json["categories"]!.map((x) => x)),
        averageRating: json["averageRating"] == null ?  0 : json["averageRating"].toDouble(),
        ratingsCount: json["ratingsCount"],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        imageLinks: ImageLinks.fromMap(json["imageLinks"]),
        language: json["language"],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
    );

}

class ImageLinks {
    ImageLinks({
        this.smallThumbnail,
        this.thumbnail,
    });

    String? smallThumbnail;
    String? thumbnail;

    factory ImageLinks.fromJson(String str) => ImageLinks.fromMap(json.decode(str));

    factory ImageLinks.fromMap(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
    );
}


class ReadingModes {
    ReadingModes({
        this.text,
        this.image,
    });

    bool? text;
    bool? image;

    factory ReadingModes.fromJson(String str) => ReadingModes.fromMap(json.decode(str));

    factory ReadingModes.fromMap(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
    );
}