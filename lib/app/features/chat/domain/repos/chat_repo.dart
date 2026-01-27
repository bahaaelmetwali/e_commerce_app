import 'package:dartz/dartz.dart';
import 'package:mega/app/features/chat/domain/entities/chat_detail_entity.dart';
import 'package:mega/app/features/chat/domain/entities/chat_list_entity.dart';
import 'package:mega/app/features/chat/domain/use_cases/fetch_chat_by_chat_Id_use_case.dart';
import 'package:mega/app/features/chat/domain/use_cases/fetch_chat_by_user_id_use_case.dart';

import '../../../../core/errors/failure.dart';
import '../use_cases/send_message_by_chat_Id_use_case.dart';
import '../use_cases/send_message_by_user_id_use_case.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<ChatListEntity>>> fetchChatList();

  Future<Either<Failure, ChatDetailEntity>>fetchChatByUserId({
    required FetchChatByUserIdParams params,
  });
  Future<Either<Failure, ChatDetailEntity>>fetchChatByChatId({
    required FetchChatByChatIdParams params,
  });
  Future<Either<Failure, Unit>> sendMessageByChatId({
  required  SendMessageByChatIdParams params,
  });
    Future<Either<Failure, Unit>>  sendMessageByUserId({
    required SendMessageByUserIdParams params,
  });
}
