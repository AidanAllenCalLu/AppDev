

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/book.dart';
import '../widgets/book_detail_widget.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: BookDetailWidget(book: book),
    );
  }
}
