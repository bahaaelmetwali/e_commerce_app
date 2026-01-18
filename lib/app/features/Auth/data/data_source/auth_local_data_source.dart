import 'package:dartz/dartz.dart';
import 'package:mega/app/core/helper/push_token_helper.dart';
import 'package:mega/app/features/Auth/data/model/push_token_model.dart';

abstract class AuthLocalDataSource {
  Future<PushTokenModel?> getToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final PushTokenHelper pushTokenHelper;
  AuthLocalDataSourceImpl(this.pushTokenHelper);
  @override
  Future<PushTokenModel?> getToken() async {
    final String? pushToken = await pushTokenHelper.getFcmToken();
    final PushTokenModel? token = PushTokenModel.fromFirebase(pushToken!);
    if (token != null) {
      return token;
    }
  }
}
