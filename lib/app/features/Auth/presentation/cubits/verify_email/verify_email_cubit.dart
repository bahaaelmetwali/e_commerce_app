import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/use_cases/verify_email_use_case.dart';


part 'verify_email_state.dart';


@injectable
class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit(this.verifyEmailUseCase) : super(VerifyEmailInitial());
  final VerifyEmailUseCase verifyEmailUseCase;
  void verifyEmail({ required VerifyEmailOtpRequestParams params }) async {
    emit(VerifyEmailLoading());
    final result = await verifyEmailUseCase(params);
    result.fold(
      (failure) => emit(VerifyEmailFailure(errorMessage: failure.toString())),
      (_) => emit(VerifyEmailSuccess()),
    );
  }
}