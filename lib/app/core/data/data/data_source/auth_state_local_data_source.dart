import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../constants/constants.dart';

abstract class AuthStateLocalDataSource {
  Future<Unit> setGuestMode();
  Future<Unit> setAuthMode();
  Future<String?> getAuthMode();
  Future<Unit> clearAuthMode();
}

@Injectable(as: AuthStateLocalDataSource)
class AuthStateLocalDataSourceImpl implements AuthStateLocalDataSource {
  final FlutterSecureStorage storage;

  AuthStateLocalDataSourceImpl(this.storage);

  @override
  Future<Unit> setGuestMode() async {
    await storage.write(
      key: Constants.authModeKey,
      value: Constants.guest,
    );
    return unit;
  }

  @override
  Future<Unit> setAuthMode() async {
    await storage.write(
      key: Constants.authModeKey,
      value: Constants.client,
    );
    return unit;
  }

  @override
  Future<String?> getAuthMode() {
    return storage.read(key: Constants.authModeKey);
  }

  @override
  Future<Unit> clearAuthMode() async {
    await storage.delete(key: Constants.authModeKey);
    return unit;
  }
}
