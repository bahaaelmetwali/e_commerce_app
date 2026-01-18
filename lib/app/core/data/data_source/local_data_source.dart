import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../constants/constants.dart';

abstract class LocalAuthDataSource {
  Future<Unit> saveToken(String token);
  Future<String?> getToken();
  Future<Unit> clearToken();

  Future<Unit> setGuestMode();
  Future<Unit> setAuthMode();
  Future<String?> getAuthMode();
  Future<Unit> clearAuthMode();

  Future<Unit> saveUserInfo({required String name, required String email});
  Future<String?> getUserName();
  Future<String?> getUserEmail();
  Future<Unit> clearUserInfo();
}

@Injectable(as: LocalAuthDataSource)
class LocalAuthDataSourceImpl implements LocalAuthDataSource {
  final FlutterSecureStorage storage;

  LocalAuthDataSourceImpl(this.storage);

  @override
  Future<Unit> saveToken(String token) async {
    await storage.write(key: Constants.tokenKey, value: token);
    return unit;
  }

  @override
  Future<String?> getToken() => storage.read(key: Constants.tokenKey);

  @override
  Future<Unit> clearToken() async {
    await storage.delete(key: Constants.tokenKey);
    return unit;
  }

  @override
  Future<Unit> setGuestMode() async {
    await storage.write(key: Constants.authModeKey, value: 'guest');
    return unit;
  }

  @override
  Future<Unit> setAuthMode() async {
    await storage.write(key: Constants.authModeKey, value: 'auth');
    return unit;
  }

  @override
  Future<String?> getAuthMode() => storage.read(key: Constants.authModeKey);

  @override
  Future<Unit> clearAuthMode() async {
    await storage.delete(key: Constants.authModeKey);
    return unit;
  }

  @override
  Future<Unit> saveUserInfo({
    required String name,
    required String email,
  }) async {
    await storage.write(key: Constants.nameKey, value: name);
    await storage.write(key: Constants.emailKey, value: email);
    return unit;
  }

  @override
  Future<String?> getUserName() => storage.read(key: Constants.nameKey);

  @override
  Future<String?> getUserEmail() => storage.read(key: Constants.emailKey);

  @override
  Future<Unit> clearUserInfo() async {
    await storage.delete(key: Constants.nameKey);
    await storage.delete(key: Constants.emailKey);
    return unit;
  }
}
