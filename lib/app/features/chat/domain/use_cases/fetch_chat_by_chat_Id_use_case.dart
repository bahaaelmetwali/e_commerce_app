import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/chat/domain/repos/chat_repo.dart';

import '../../../../core/errors/failure.dart';
import '../entities/chat_detail_entity.dart';

@singleton
class FetchChatByChatIdUseCase {
  final ChatRepo chatRepo;
  FetchChatByChatIdUseCase(this.chatRepo);
    Future<Either<Failure, ChatDetailEntity>> call(FetchChatByChatIdParams params) =>
      chatRepo.fetchChatByChatId(params: params);
}

class FetchChatByChatIdParams {
  final String id;

  FetchChatByChatIdParams({required this.id});
  Map<String, dynamic> toMap() => {'conversationId': id};
}
