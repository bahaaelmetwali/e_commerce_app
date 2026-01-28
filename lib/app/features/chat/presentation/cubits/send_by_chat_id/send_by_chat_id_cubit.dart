import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/chat/domain/use_cases/send_message_by_chat_Id_use_case.dart';

part 'send_by_chat_id_state.dart';

@injectable
class SendByChatIdCubit extends Cubit<SendByChatIdState> {
  SendByChatIdCubit(this.sendMessageByChatIdUseCase) : super(SendByChatIdInitial());
final SendMessageByChatIdUseCase sendMessageByChatIdUseCase;

  Future<void> sendMessageByChatId(SendMessageByChatIdParams params) async {
    emit(SendByChatIdLoading());
    final result = await sendMessageByChatIdUseCase.call(params: params);
    result.fold(
      (l) => emit(SendByChatIdError(message: l.toString())),
      (r) => emit(SendByChatIdSuccess()),
    );
  }
}
