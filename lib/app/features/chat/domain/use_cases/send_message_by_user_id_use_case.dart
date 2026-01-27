import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../repos/chat_repo.dart';

@singleton
class SendMessageByUserIdUseCase {
  final ChatRepo chatRepo;
  SendMessageByUserIdUseCase(this.chatRepo);
    Future<Either<Failure, Unit>>  call({required SendMessageByUserIdParams params}) =>
      chatRepo.sendMessageByUserId(params: params);
}

class SendMessageByUserIdParams {
  final String userId;
  final String? text;
  final List<String>? media;
  SendMessageByUserIdParams({
    required this.userId,
    required this.text,
    this.media,
  });
  Map<String, dynamic> toMap() => {
    'recipientId': userId,
    'text': text,
    'media': media,
  };
}
