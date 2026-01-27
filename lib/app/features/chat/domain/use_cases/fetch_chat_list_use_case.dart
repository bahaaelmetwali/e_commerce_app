import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/chat/domain/repos/chat_repo.dart';

import '../../../../core/errors/failure.dart';
import '../entities/chat_list_entity.dart';

@singleton
class FetchChatListUseCase {
  final ChatRepo chatRepo;

  FetchChatListUseCase(this.chatRepo);

  Future<Either<Failure, List<ChatListEntity>>> call() =>
      chatRepo.fetchChatList();
}
