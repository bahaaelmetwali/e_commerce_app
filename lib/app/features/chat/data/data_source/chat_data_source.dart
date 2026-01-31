import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/constants/constants.dart';
import 'package:mega/app/core/helper/api_helper.dart';
import 'package:mega/app/features/chat/data/models/chat_detail_model.dart';
import 'package:mega/app/features/chat/data/models/chat_list_model.dart';
import '../../domain/use_cases/fetch_chat_by_chat_Id_use_case.dart';
import '../../domain/use_cases/fetch_chat_by_user_id_use_case.dart';
import '../../domain/use_cases/send_message_by_chat_Id_use_case.dart';
import '../../domain/use_cases/send_message_by_user_id_use_case.dart';

abstract class ChatDataSource {
  Future<List<ChatListModel>> fetchChatList();

  Future<ChatDetailModel> fetchChatByUserId({
    required FetchChatByUserIdParams params,
  });
  Future<ChatDetailModel> fetchChatByChatId({
    required FetchChatByChatIdParams params,
  });
  Future<Unit> sendMessageByChatId({required SendMessageByChatIdParams params});
  Future<Unit> sendMessageByUserId({required SendMessageByUserIdParams params});
}

@Injectable(as: ChatDataSource)
class ChatDataSourceImpl implements ChatDataSource {
  final ApiHelper apiHelper;
  ChatDataSourceImpl(this.apiHelper);
  @override
  Future<ChatDetailModel> fetchChatByChatId({
    required FetchChatByChatIdParams params,
  }) async {
    final response = await apiHelper.get(
      endPoint: '${Constants.getAllConversationEndPoint}/${params.id}/messages',
    );
    final ChatDetailModel chatDetailModel = ChatDetailModel.fromJson(
      response.data,
    );
    return Future.value(chatDetailModel);
  }

  @override
  Future<ChatDetailModel> fetchChatByUserId({
    required FetchChatByUserIdParams params,
  }) async {
    final response = await apiHelper.get(
      endPoint: '${Constants.getChatByUserIdEndPoint}/${params.userId}',
    );
    final ChatDetailModel chatDetailModel = ChatDetailModel.fromJson(
      response["data"],
    );
    return Future.value(chatDetailModel);
  }

  @override
  Future<List<ChatListModel>> fetchChatList() {
    final response = apiHelper.get(
      endPoint: Constants.getAllConversationEndPoint,
    );
    return Future.value(
      (response as List).map((e) => ChatListModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<Unit> sendMessageByChatId({
    required SendMessageByChatIdParams params,
  }) {
    apiHelper.post(
      endPoint:
          '${Constants.getAllConversationEndPoint}/${params.chatId}/send/',

      formData: params.toFormData(),
    );
    return Future.value(unit);
  }

  @override
  Future<Unit> sendMessageByUserId({
    required SendMessageByUserIdParams params,
  }) {
    apiHelper.post(
      endPoint: Constants.sendByUserIdEndPoint,
      queryParameters: params.toMap(),
      formData: params.toFormData(),
    );
    return Future.value(unit);
  }
}
