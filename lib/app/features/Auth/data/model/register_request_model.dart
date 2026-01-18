class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String? avatar;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    this.avatar,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };

    if (avatar != null && avatar!.isNotEmpty) {
      data['avatar'] = avatar;
    }

    return data;
  }
}
