import 'package:lbooks_app/models/models.dart';
import 'package:lbooks_app/providers/books_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookSearchDelegate extends SearchDelegate{

  @override
  String? get searchFieldLabel => "Buscar libro";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), 
      icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  Widget _emptyContainer(){
    return Container(
        child: const Center(
          child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 130),
        ),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return _emptyContainer();
    }

    final booksProvider = Provider.of<BooksProvider>(context, listen:false);
    booksProvider.getSuggestionsByQuery(query);

    return StreamBuilder(
      stream: booksProvider.suggestionStream,
      builder: (_, AsyncSnapshot<List<Book?>?> snapshot){
        if(!snapshot.hasData) return _emptyContainer();
        
        final books = snapshot.data!;
        return ListView.builder(
          itemCount: books.length,
          itemBuilder: (_, int index) => _BookItem(book: books[index]),
        );
      },
    );
  }
}

  class _BookItem extends StatelessWidget {
  final Book? book;
  const _BookItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage('assets/imgs/no-image.jpg'),
        image: NetworkImage(book!.volumeInfo!.imageLinks!.smallThumbnail!),
        width: 50,
        fit: BoxFit.contain,
      ),
      title: Text(book!.volumeInfo!.title!),
      subtitle: Text(
                'por ${book!.volumeInfo!.authors!.join(", ")}',
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: book);
      },
    );
  }

}


