
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/authentication/authentication_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            context.read<AuthenticationBloc>().add(
              AuthenticationSignOutEvent(),
            );
          },
          icon: const Icon(Icons.logout),
          label: const Text('Log Out'),
        ),
      ),
    );
  }
}
