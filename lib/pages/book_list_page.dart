
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/book_cubit.dart';
import '../cubit/book_state.dart';
import '../widgets/book_image_widget.dart';

class BookListPage extends StatefulWidget {
  final bool sortByTitle;

  const BookListPage({
    super.key,
    required this.sortByTitle,
  });

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final cubit = context.read<BookCubit>();

      if (widget.sortByTitle) {
        cubit.sortByTitle();
      } else {
        cubit.sortByAuthor();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final detailPath =
        widget.sortByTitle ? '/byTitle/detail' : '/byAuthor/detail';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            widget.sortByTitle ? 'Books by Title' : 'Books by Author',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: BlocBuilder<BookCubit, BookState>(
            builder: (context, state) {
              if (state is BookLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is BookListLoaded) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    final book = state.books[index];

                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: BookImageWidget(
                        book: book,
                        onTap: () {
                          context.push(
                            detailPath,
                            extra: book,
                          );
                        },
                      ),
                    );
                  },
                );
              }

              return const Center(
                child: Text('Unable to load books.'),
              );
            },
          ),
        ),
      ],
    );
  }
}
