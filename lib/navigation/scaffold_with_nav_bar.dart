

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  final String location;

  const ScaffoldWithNavBar({
    super.key,
    required this.child,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final selectedIndex = location.startsWith('/byTitle')
        ? 1
        : location.startsWith('/profile')
            ? 2
            : 0;

    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go('/byAuthor');
              break;
            case 1:
              context.go('/byTitle');
              break;
            case 2:
              context.go('/profile');
              break;
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_search),
            label: 'By Author',
          ),
          NavigationDestination(
            icon: Icon(Icons.sort_by_alpha),
            label: 'By Title',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
