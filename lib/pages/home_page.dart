import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/cubit/book_cubit.dart';
import 'package:test_1/cubit/book_state.dart';
import 'package:test_1/views/books_view.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sortBy = 'author'; 


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('Book Club Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // order bar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Row(
                children: [
                  Text(
                    'Sort by',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 1.43,
                      letterSpacing: 0.10,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sortBy = 'author';
                        context.read<BookCubit>().sortBooks(sortBy); 
                      });
                    },
                    child: Container(
                      height: 32,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: ShapeDecoration(
                        color: sortBy == 'author' ? Color(0xFFCAC4D0) : Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFCAC4D0)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(child: Text('Author')),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sortBy = 'title';
                        context.read<BookCubit>().sortBooks(sortBy); 
                      });
                    },
                    child: Container(
                      height: 32,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: ShapeDecoration(
                        color: sortBy == 'title' ? Color(0xFFCAC4D0) : Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFCAC4D0)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(child: Text('Title')),
                    ),
                  ),
                ],
              ),
            ),
            // books list
            Expanded(
              child: BlocBuilder<BookCubit, BookState>(
                builder: (context, state) {
                  if (state is BookLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is BookViewState) {
                    return BooksView(books: state.books);
                  }
                  // Failed to load books
                  return Center(child: Text('Failed to load', style: TextStyle(color: Colors.red, fontSize: 18)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}