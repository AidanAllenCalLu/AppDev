

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/authentication/authentication_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Club Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<AuthenticationBloc>().add(
              AuthenticationDemoLoginEvent(),
            );
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
