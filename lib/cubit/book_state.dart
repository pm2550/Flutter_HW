import '../models/book.dart';

abstract class BookState {}
class BookInitial extends BookState {}
class BookViewState extends BookState {
  final List<Book> books;
  BookViewState(this.books);
}




abstract class DetailState {}
class DetailInitial extends DetailState {}
class DetailViewState extends DetailState {
  final Book book;
  DetailViewState(this.book);
}
