

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/authentication/authentication_bloc.dart';
import 'cubit/book_cubit.dart';
import 'navigation/router.dart';
import 'repositories/authentication/authentication_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationRepository>(
      create: (_) => OktaAuthenticationRepository(),
      child: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(
          context.read<AuthenticationRepository>(),
        ),
        child: const BookClubApp(),
      ),
    );
  }
}

class BookClubApp extends StatelessWidget {
  const BookClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = context.read<AuthenticationBloc>();

    return BlocProvider<BookCubit>(
      create: (_) => BookCubit(),
      child: MaterialApp.router(
        title: 'Book Club App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        routerConfig: createBookClubRouter(authenticationBloc),
      ),
    );
  }
}
