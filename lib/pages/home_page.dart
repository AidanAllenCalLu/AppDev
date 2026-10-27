

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/book_cubit.dart';
import '../cubit/book_state.dart';
import '../widgets/book_image_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Club Home'),
      ),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          if (state is BookLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is BookListLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      ChoiceChip(
                        label: const Text('Author'),
                        selected: !state.sortByTitle,
                        onSelected: (_) {
                          context.read<BookCubit>().sortByAuthor();
                        },
                      ),
                      const SizedBox(width: 12),
                      ChoiceChip(
                        label: const Text('Title'),
                        selected: state.sortByTitle,
                        onSelected: (_) {
                          context.read<BookCubit>().sortByTitle();
                        },
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Books',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      final book = state.books[index];

                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: BookImageWidget(
                          book: book,
                          onTap: () {
                            context.push(
                              '/book-detail',
                              extra: book,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const Center(
            child: Text('Unable to load books.'),
          );
        },
      ),
    );
  }
}
