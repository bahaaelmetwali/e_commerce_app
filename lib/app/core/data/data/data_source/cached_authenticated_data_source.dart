import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';


import '../../../constants/constants.dart';
import '../model/token_model.dart';
import '../model/user_model.dart';

abstract class CachedAuthenticatedDataSource {
  Future<Unit> saveToken(TokenModel token);
  Future<TokenModel?> getToken();
  Future<Unit> clearToken();

  Future<Unit> setGuestMode();
  Future<Unit> setAuthMode();
  Future<String?> getAuthMode();
  Future<Unit> clearAuthMode();

  Future<Unit> saveUserInfo(UserModel user);
  Future<UserModel?> getUserInfo();
  Future<Unit> clearUserInfo();
}

@Injectable(as: CachedAuthenticatedDataSource)
class CachedAuthenticatedDataSourceImpl
    implements CachedAuthenticatedDataSource {
  final FlutterSecureStorage storage;

  CachedAuthenticatedDataSourceImpl(this.storage);

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
  Future<Unit> clearUserInfo() async {
    await storage.delete(key: Constants.userKey);
    return unit;
  }

  @override
  Future<TokenModel?> getToken() {
    return storage.read(key: Constants.tokenKey).then((value) {
      if (value != null) {
        return TokenModel.fromJson({'token': value});
      } else {
        return null;
      }
    });
  }

  @override
  Future<UserModel?> getUserInfo() {
    final response = storage.read(key: Constants.userKey);
    return response.then((value) {
      if (value != null) {
        final jsonDecoder = jsonDecode(value);
        return UserModel.fromJson(jsonDecoder);
      } else {
        return null;
      }
    });
  }

  @override
  Future<Unit> saveToken(TokenModel token) {
    final cachedToken = jsonEncode(token.toJson());
    return storage
        .write(key: Constants.tokenKey, value: cachedToken)
        .then((_) => unit);
  }

  @override
  Future<Unit> saveUserInfo(UserModel user) {
    final cachedUser = jsonEncode(user.toJson());
    return storage
        .write(key: Constants.userKey, value: cachedUser)
        .then((_) => unit);
  }
}
