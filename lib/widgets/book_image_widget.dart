
import 'package:flutter/material.dart';
import '../models/book.dart';

class BookImageWidget extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookImageWidget({
    super.key,
    required this.book,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            book.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey.shade300,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.book,
                  size: 60,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
