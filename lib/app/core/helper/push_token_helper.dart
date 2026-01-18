import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class PushTokenHelper {
  final FirebaseMessaging _firebaseMessaging;

  PushTokenHelper(this._firebaseMessaging);

  Future<String?> getFcmToken() async {
    final token = await _firebaseMessaging.getToken();
    if (token != null && token.isNotEmpty) {
      return token;
    }
    return null;
  }
}
