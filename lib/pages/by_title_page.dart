
import 'package:flutter/material.dart';

import 'book_list_page.dart';

class ByTitlePage extends StatelessWidget {
  const ByTitlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BookListPage(
      sortByTitle: true,
    );
  }
}
