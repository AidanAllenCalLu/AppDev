
import 'package:equatable/equatable.dart';
import '../models/book.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

// The app is loading its books.
class BookLoading extends BookState {
  const BookLoading();
}

// The book list is visible.
class BookListLoaded extends BookState {
  final List<Book> books;
  final bool sortByTitle;

  const BookListLoaded({
    required this.books,
    required this.sortByTitle,
  });

  @override
  List<Object?> get props => [books, sortByTitle];
}

// A selected book's details are visible.
class BookDetailLoaded extends BookState {
  final Book book;

  const BookDetailLoaded(this.book);

  @override
  List<Object?> get props => [book];
}
