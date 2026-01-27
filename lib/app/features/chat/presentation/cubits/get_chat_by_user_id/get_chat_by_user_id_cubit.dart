import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/chat/domain/use_cases/fetch_chat_by_user_id_use_case.dart';

import '../../../domain/entities/chat_detail_entity.dart';

part 'get_chat_by_user_id_state.dart';

@injectable
class GetChatByUserIdCubit extends Cubit<GetChatByUserIdState> {
  GetChatByUserIdCubit(this.fetchChatByUserIdUseCase) : super(GetChatByUserIdInitial());
  final FetchChatByUserIdUseCase fetchChatByUserIdUseCase;

  Future<void> fetchChatByUserId(String userId) async {
    emit(GetChatByUserIdLoading());
    final result = await fetchChatByUserIdUseCase.call(userId);
    result.fold(
      (l) => emit(GetChatByUserIdError(message: l.toString())),
      (r) => emit(GetChatByUserIdSuccess(chatDetail: r)),
    );
  }
}
