class CachedUserEntity {
  final String id;
  final String name;
  final String email;
  final String  ? avatar;
  final String role ;
  CachedUserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar, required this.role,
  });
}
