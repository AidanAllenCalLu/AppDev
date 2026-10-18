
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(const BookLoading()) {
    init();
  }

  final List<Book> _books = [];

  // Remember the currently selected sorting order.
  bool _sortByTitle = false;

  void init() {
    _books.addAll([
      const Book(
        title: 'The Great Gatsby',
        author: 'F. Scott Fitzgerald',
        description:
            'A novel about wealth, ambition, and the American Dream.',
        imageUrl: 'assets/images/great_gatsby.jpg',
      ),
      const Book(
        title: '1984',
        author: 'George Orwell',
        description:
            'A dystopian novel about surveillance and totalitarianism.',
        imageUrl: 'assets/images/1984.jpeg',
      ),
      const Book(
        title: 'To Kill a Mockingbird',
        author: 'Harper Lee',
        description:
            'A novel exploring justice, prejudice, and compassion.',
        imageUrl: 'assets/images/mockingbird.jpeg',
      ),
      const Book(
        title: 'Yesteryear',
        author: 'Caro Claire Burke',
        description:
            'A sharp satirical story about a social media influencer whose traditional lifestyle persona collides with reality.',
        imageUrl: 'assets/images/yesteryear.jpeg',
      ),
      const Book(
        title: 'Verity',
        author: 'Colleen Hoover',
        description: 'A continuous thriller favorite for readers looking for dark, fast-paced suspense',
        imageUrl: 'assets/images/verity.jpeg',
      ),
      const Book(
        title: 'Whistler',
        author: 'Ann Patchett',
        description:
            'A deeply human novel about the unexpected echoes of a reunited past.',
        imageUrl: 'assets/images/whistler.jpeg',
      ),


      
    ]);

    sortByAuthor();
  }

  void sortByAuthor() {
    _sortByTitle = false;

    final sortedBooks = List<Book>.of(_books)
      ..sort((a, b) => a.author.compareTo(b.author));

    emit(BookListLoaded(
      books: sortedBooks,
      sortByTitle: false,
    ));
  }

  void sortByTitle() {
    _sortByTitle = true;

    final sortedBooks = List<Book>.of(_books)
      ..sort((a, b) => a.title.compareTo(b.title));

    emit(BookListLoaded(
      books: sortedBooks,
      sortByTitle: true,
    ));
  }

  void showBookDetails(Book book) {
    emit(BookDetailLoaded(book));
  }

  // Return to the list using the previously selected sort order.
  void showBookList() {
    if (_sortByTitle) {
      sortByTitle();
    } else {
      sortByAuthor();
    }
  }
}
