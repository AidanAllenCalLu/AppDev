
part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {}

final class AuthenticationWithEmailEvent
    extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationWithEmailEvent({
    required this.email,
    required this.password,
  });
}

final class AuthenticationErrorEvent
    extends AuthenticationEvent {
  final String errorText;

  AuthenticationErrorEvent({
    required this.errorText,
  });
}

final class AuthenticationSignOutEvent
    extends AuthenticationEvent {}

final class AuthenticationDemoLoginEvent
    extends AuthenticationEvent {}
