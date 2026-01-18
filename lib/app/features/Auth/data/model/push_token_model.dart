import '../../domain/entities/push_token_entity.dart';

class PushTokenModel extends PushTokenEntity {
  const PushTokenModel(String value) : super(value);

  factory PushTokenModel.fromFirebase(String token) {
    return PushTokenModel(token);
  }
}
