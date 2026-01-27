import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/chat/domain/entities/chat_detail_entity.dart';
import 'package:mega/app/features/chat/domain/repos/chat_repo.dart';

import '../../../../core/errors/failure.dart';

@singleton
class FetchChatByUserIdUseCase {
  final ChatRepo chatRepo;
  FetchChatByUserIdUseCase(this.chatRepo);

  Future<Either<Failure, ChatDetailEntity>> call(String userId) => chatRepo
      .fetchChatByUserId(params: FetchChatByUserIdParams(userId: userId));
}

class FetchChatByUserIdParams {
  final String userId;

  FetchChatByUserIdParams({required this.userId});
  Map<String, dynamic> toMap() => {'userId': userId};
}
