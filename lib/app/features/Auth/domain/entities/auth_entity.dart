class AuthEntity {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String token;
  final bool isVerified;

  AuthEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.token,
    required this.isVerified,
  });
}
