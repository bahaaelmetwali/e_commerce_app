
class CachedUserEntity {
  final String id;
  final String name;
  final String email;
  final String  ? avatar;
  final RoleEnum role ;
  CachedUserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar, required this.role,
  });
}
enum RoleEnum { user, admin, owner }

extension RoleEnumExtension on RoleEnum {
  String get value {
    switch (this) {
      case RoleEnum.user:
        return 'user';
      case RoleEnum.admin:
        return 'admin';
      case RoleEnum.owner:
        return 'owner';
    }
  }

  static RoleEnum fromString(String value) {
    switch (value) {
      case 'admin':
        return RoleEnum.admin;
      case 'owner':
        return RoleEnum.owner;
      case 'user':
      default:
        return RoleEnum.user;
    }
  }
}

