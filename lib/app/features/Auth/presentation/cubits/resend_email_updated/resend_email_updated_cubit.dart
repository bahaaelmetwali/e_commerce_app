import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/use_cases/resend_email_update_use_case.dart';

import '../../../../../core/errors/failure.dart';

part 'resend_email_updated_state.dart';

@injectable
class ResendEmailUpdatedCubit extends Cubit<ResendEmailUpdatedState> {
  ResendEmailUpdatedCubit(this.resendEmailUpdateUseCase) : super(ResendEmailUpdatedInitial());
final  ResendEmailUpdateUseCase resendEmailUpdateUseCase;

  Future<void> resendEmailUpdated(
      ) async {
    emit(ResendEmailUpdatedLoading());
    final result = await resendEmailUpdateUseCase.call();
    result.fold(
      (failure) => emit(ResendEmailUpdatedFailure(failure: failure)),
      (_) => emit(ResendEmailUpdatedSuccess()),
    );
  }
}
