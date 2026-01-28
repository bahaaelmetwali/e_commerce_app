import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/chat/domain/use_cases/send_message_by_user_id_use_case.dart';

part 'send_by_user_id_state.dart';

@injectable
class SendByUserIdCubit extends Cubit<SendByUserIdState> {
  SendByUserIdCubit(this.sendMessageByUserIdUseCase) : super(SendByUserIdInitial());
final SendMessageByUserIdUseCase sendMessageByUserIdUseCase;

  Future<void> sendMessageByUserId(SendMessageByUserIdParams params) async {
    emit(SendByUserIdLoading());
    final result = await sendMessageByUserIdUseCase.call(params: params);
    result.fold(
      (l) => emit(SendByUserIdError(message: l.toString())),
      (r) => emit(SendByUserIdSuccess()),
    );
  }
}
