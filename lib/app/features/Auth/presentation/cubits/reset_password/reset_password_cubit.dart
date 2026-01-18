import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/use_cases/reset_password_use_case.dart';

import '../../../data/model/reset_password_model.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.resetPasswordUseCase) : super(ResetPasswordInitial());
  final ResetPasswordUseCase resetPasswordUseCase;

  Future<void> resetPassword(ResetPasswordModel resetPasswordModel) async {
    emit(ResetPasswordLoadingState());
    final result = await resetPasswordUseCase(resetPasswordModel);
    result.fold(
      (failure) => emit(ResetPasswordErrorState(failure.toString())),
      (_) => emit(ResetPasswordSuccessState()),
    );
  }
}
