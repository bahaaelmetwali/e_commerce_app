import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:mega/app/core/errors/failure.dart';
import 'package:mega/app/core/utils/request_handler.dart';
import 'package:mega/app/features/chat/data/data_source/chat_data_source.dart';

import 'package:mega/app/features/chat/domain/entities/chat_detail_entity.dart';

import 'package:mega/app/features/chat/domain/entities/chat_list_entity.dart';

import 'package:mega/app/features/chat/domain/use_cases/fetch_chat_by_chat_Id_use_case.dart';

import 'package:mega/app/features/chat/domain/use_cases/fetch_chat_by_user_id_use_case.dart';

import 'package:mega/app/features/chat/domain/use_cases/send_message_by_chat_Id_use_case.dart';

import 'package:mega/app/features/chat/domain/use_cases/send_message_by_user_id_use_case.dart';

import '../../domain/repos/chat_repo.dart';

@Injectable(as: ChatRepo)
class ChatRepoImpl implements ChatRepo {
  final ChatDataSource chatDataSource;
  ChatRepoImpl(this.chatDataSource);
  @override
  Future<Either<Failure, ChatDetailEntity>> fetchChatByChatId({
    required FetchChatByChatIdParams params,
  }) async {
    return requestHandler(
      request: () async {
        final response = await chatDataSource.fetchChatByChatId(params: params);
        return response.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, ChatDetailEntity>> fetchChatByUserId({
    required FetchChatByUserIdParams params,
  }) {
    return requestHandler(
      request: () async {
        final response = await chatDataSource.fetchChatByUserId(params: params);
        return response.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, List<ChatListEntity>>> fetchChatList() {
    return requestHandler(
      request: () async {
        final response = await chatDataSource.fetchChatList();
        final List<ChatListEntity> chatListEntities = response
            .map((model) => model.toEntity())
            .toList();
        return chatListEntities;
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> sendMessageByChatId({
    required SendMessageByChatIdParams params,
  }) {
    return requestHandler(
      request: () async {
        await chatDataSource.sendMessageByChatId(params: params);
        return Future.value(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> sendMessageByUserId({
    required SendMessageByUserIdParams params,
  }) {
    return requestHandler(
      request: () async {
        await chatDataSource.sendMessageByUserId(params: params);
        return Future.value(unit);
      },
    );
  }
}
