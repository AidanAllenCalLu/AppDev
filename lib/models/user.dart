class User {
  final String email;

  const User({required this.email});

  factory User.createMockUser() {
    return const User(email: 'student@example.com');
  }
}