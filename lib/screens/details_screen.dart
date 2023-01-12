import 'package:flutter/material.dart';
import 'package:lbooks_app/models/models.dart';

class DetailsScreen extends StatelessWidget {
  static const String route = 'details';
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //? El argumento es un objeto, tengo que especificarle que tipo de objeto es
    //? Le dice a dart que lo trate como un Book
    final Book book = ModalRoute.of(context)!.settings.arguments as Book;
    return Scaffold(
        backgroundColor: const Color(0xffD9D9D9),
        body: CustomScrollView(
          slivers: [
            _CustomAppBar(book: book),
            SliverList(
                delegate: SliverChildListDelegate([
              _PosterAndTtitle(book: book),
              _Overview(book: book),
            ])),
          ],
        ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Book book;
  const _CustomAppBar({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            book.volumeInfo!.title!,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/imgs/loading.gif'),
          image: NetworkImage(book.volumeInfo!.imageLinks!.smallThumbnail!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTtitle extends StatelessWidget {
  final Book book;
  const _PosterAndTtitle({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: const AssetImage('assets/imgs/no-image.jpg'),
            image: NetworkImage(book.volumeInfo!.imageLinks!.thumbnail!),
            height: 150,
            width: 110,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width - 190),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.volumeInfo!.title!,
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'por ${book.volumeInfo!.authors!.join(", ")}',
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    book.volumeInfo!.averageRating == 0
                        ? 'No disponible'
                        : '${book.volumeInfo!.averageRating}',
                    style: textTheme.caption,
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  final Book book;
  const _Overview({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        book.volumeInfo!.description!,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
