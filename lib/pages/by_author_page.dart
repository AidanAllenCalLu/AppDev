
import 'package:flutter/material.dart';

import 'book_list_page.dart';

class ByAuthorPage extends StatelessWidget {
  const ByAuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BookListPage(
      sortByTitle: false,
    );
  }
}
