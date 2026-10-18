
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/book_cubit.dart';
import 'cubit/book_state.dart';
import 'pages/home_page.dart';
import 'pages/book_detail_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => BookCubit(),
      child: const BookClubApp(),
    ),
  );
}

class BookClubApp extends StatelessWidget {
  const BookClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Club App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          if (state is BookDetailLoaded) {
            return const BookDetailPage();
          }

          return const HomePage();
        },
      ),
    );
  }
}
