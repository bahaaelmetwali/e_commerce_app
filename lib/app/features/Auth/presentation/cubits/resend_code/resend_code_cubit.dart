import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/use_cases/resend_verification_code_use_case.dart';

part 'resend_code_state.dart';

@injectable
class ResendCodeCubit extends Cubit<ResendCodeState> {
  ResendCodeCubit(this.resendVerificationCodeUseCase) : super(ResendCodeInitial());
final ResendVerificationCodeUseCase resendVerificationCodeUseCase;
  void resendCode() async {
    emit(ResendCodeLoading());
    final result = await resendVerificationCodeUseCase();
    result.fold(
      (failure) => emit(ResendCodeFailure(errorMessage: failure.toString()  )),
      (_) => emit(ResendCodeSuccess()),
    );
  }
}
