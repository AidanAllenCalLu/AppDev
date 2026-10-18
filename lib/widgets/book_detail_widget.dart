
import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailWidget extends StatelessWidget {
  final Book book;

  const BookDetailWidget({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: 280,
              child: Image.asset(
                book.imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.book,
                    size: 120,
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            book.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'By ${book.author}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Text(
            book.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
