import 'package:flutter/material.dart';
import 'package:lbooks_app/models/models.dart';


class BookSlider extends StatefulWidget {

  final String? title;
  final List<Book?>? books;

  const BookSlider({Key? key, this.title, this.books}) : super(key: key);

  @override
  State<BookSlider> createState() => _BookSliderState();
}

class _BookSliderState extends State<BookSlider> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  Text(widget.title!, style: const TextStyle(fontSize:20, fontWeight: FontWeight.bold),),
          ),
          const SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.books!.length,
              itemBuilder: (_, int index){
                return  _BookPoster(book: widget.books![index]);
              }
            ),
          )
        ],
      ),
    );
  }
}

class _BookPoster extends StatelessWidget {
  final Book? book;

  const _BookPoster({
    Key? key, required this.book
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children:  [
          GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, 'details', arguments: book),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/imgs/no-image.jpg'), 
                image: NetworkImage(book!.volumeInfo!.imageLinks!.thumbnail!),
                width: 130,
                height: 185,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Text(
             book!.volumeInfo!.title!,
             overflow: TextOverflow.ellipsis,
             maxLines: 2,
             textAlign: TextAlign.center,
          )

        ]
      ),
    );
  }
}