
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../blocs/authentication/authentication_bloc.dart';
import '../models/book.dart';
import '../pages/book_detail_page.dart';
import '../pages/by_author_page.dart';
import '../pages/by_title_page.dart';
import '../pages/login_page.dart';
import '../pages/profile_page.dart';
import '../utilities/stream_to_listenable.dart';
import 'scaffold_with_nav_bar.dart';

class RouteName {
  static const home = 'home';
  static const byAuthor = 'byAuthor';
  static const byAuthorDetail = 'byAuthorDetail';
  static const byTitle = 'byTitle';
  static const byTitleDetail = 'byTitleDetail';
  static const profile = 'profile';
  static const login = 'login';
}

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'Root');

final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'Shell');

GoRouter createBookClubRouter(
  AuthenticationBloc authenticationBloc,
) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: StreamToListenable([
      authenticationBloc.stream,
    ]),

    redirect: (context, state) {
      final isLoggedIn =
          authenticationBloc.state is AuthenticationAuthenticated;
      final isLoggingIn = state.uri.path == '/login';

      if (isLoggedIn && isLoggingIn) {
        return '/byAuthor';
      }

      if (!isLoggedIn && !isLoggingIn) {
        return '/login';
      }

      return null;
    },

    routes: [
      GoRoute(
        path: '/',
        name: RouteName.home,
        redirect: (context, state) => '/byAuthor',
      ),

      GoRoute(
        path: '/login',
        name: RouteName.login,
        builder: (context, state) => const LoginPage(),
      ),

      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithNavBar(
            location: state.uri.path,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/byAuthor',
            name: RouteName.byAuthor,
            builder: (context, state) => const ByAuthorPage(),
            routes: [
              GoRoute(
                path: 'detail',
                name: RouteName.byAuthorDetail,
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) {
                  final book = state.extra as Book;
                  return BookDetailPage(book: book);
                },
              ),
            ],
          ),

          GoRoute(
            path: '/byTitle',
            name: RouteName.byTitle,
            builder: (context, state) => const ByTitlePage(),
            routes: [
              GoRoute(
                path: 'detail',
                name: RouteName.byTitleDetail,
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) {
                  final book = state.extra as Book;
                  return BookDetailPage(book: book);
                },
              ),
            ],
          ),

          GoRoute(
            path: '/profile',
            name: RouteName.profile,
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
  );
}
