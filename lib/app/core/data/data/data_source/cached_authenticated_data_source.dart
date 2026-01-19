import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../constants/constants.dart';
import '../model/token_model.dart';
import '../model/cached_user_model.dart';


abstract class CachedAuthenticatedDataSource {
  Future<Unit> saveToken(TokenModel token);
  Future<TokenModel?> getToken();
  Future<Unit> clearToken();
  Future<Unit> saveUserInfo(CachedUserModel user);
  Future<CachedUserModel?> getUserInfo();
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
  Future<Unit> clearUserInfo() async {
    await storage.delete(key: Constants.userKey);
    return unit;
  }

  @override
  Future<TokenModel?> getToken() {
    return storage.read(key: Constants.tokenKey).then((value) {
      if (value != null) {
        final decoded = jsonDecode(value);
        return TokenModel.fromJson(decoded);
      } else {
        return null;
      }
    });
  }

  @override
  Future<CachedUserModel?> getUserInfo() {
    return storage.read(key: Constants.userKey).then((value) {
      if (value != null) {
        final jsonDecoder = jsonDecode(value);
        return CachedUserModel.fromJson(jsonDecoder);
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
  Future<Unit> saveUserInfo(CachedUserModel user) {
    final cachedUser = jsonEncode(user.toJson());
    return storage
        .write(key: Constants.userKey, value: cachedUser)
        .then((_) => unit);
  }
}
