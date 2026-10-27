


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
    return SizedBox(
      width: 150,
      height: 230,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              book.imageUrl,
              width: 150,
              height: 230,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 150,
                  height: 230,
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
      ),
    );
  }
}
