class ProfileEntity {
  final String id;
  final String name;
  final String email;
  final String role;
  final bool isVerified;

  final String? avatar;
  final DateTime createdAt;
  final int rating;
  final int tokenVersion;
  final String? fcmToken;
  final String? traderRequestStatus;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.isVerified,
    required this.createdAt,
    required this.rating,
    required this.tokenVersion,
    this.avatar,
    this.fcmToken,
    this.traderRequestStatus,
  });
}
