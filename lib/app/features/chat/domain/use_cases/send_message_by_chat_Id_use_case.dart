// ignore: file_names
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/chat/domain/repos/chat_repo.dart';

import '../../../../core/errors/failure.dart';

@singleton
class SendMessageByChatIdUseCase {
  final ChatRepo chatRepo;
  SendMessageByChatIdUseCase(this.chatRepo);
  Future<Either<Failure, Unit>> call({
    required SendMessageByChatIdParams params,
  }) => chatRepo.sendMessageByChatId(params: params);
}

class SendMessageByChatIdParams {
  final String chatId;
  final String? text;
  final List<String>? media;

  SendMessageByChatIdParams({required this.chatId, this.text, this.media});

  Map<String, dynamic> toMap() => {
    if (text != null) 'text': text,
    if (media != null) 'media': media,
  };
}
