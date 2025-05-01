import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import '../cubit/book_cubit.dart';
import '../pages/detail_page.dart';

class BooksView extends StatelessWidget {
  final List<Book> books;
  const BooksView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Books',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF1D1B20),
                  fontSize: 28,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 1.29,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: books.map((book) {
                return GestureDetector(
                  onTap: () {
                    // Jump to detail page
                    // and show book detail
                    context.read<DetailCubit>().showDetail(book);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetailPage()),
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 166.67,
                    margin: const EdgeInsets.only(right: 10),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 100,
                            height: 166.67,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(book.imageAsset),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}