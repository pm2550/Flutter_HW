import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/cubit/book_state.dart';
import '../models/book.dart';
import '../repositories/book_repository.dart';



class BookCubit extends Cubit<BookState> {
  final BookRepository repository;
  BookCubit(this.repository) : super(BookInitial()) {
    emit(BookViewState(repository.books)); 
  }

  void sortBooks(String sortBy) {
    final books = List<Book>.from(repository.books)
      ..sort((a, b) => sortBy == 'author'
          ? a.author.compareTo(b.author)
          : a.title.compareTo(b.title));
    emit(BookViewState(books));
  }
}


class DetailCubit extends Cubit<DetailState> {

  DetailCubit() : super(DetailInitial());
  void showDetail(Book book) {
    emit(DetailViewState(book));
  }

}