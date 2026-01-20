import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/errors/failure.dart';
import 'package:mega/app/features/Auth/domain/use_cases/verify_email_use_case.dart';

part 'verify_email_updated_state.dart';

@injectable
class VerifyEmailUpdatedCubit extends Cubit<VerifyEmailUpdatedState> {
  VerifyEmailUpdatedCubit(this.verifyEmailUseCase)
    : super(VerifyEmailUpdatedInitial());
  final VerifyEmailUseCase verifyEmailUseCase;

  void verifyEmail({ required VerifyEmailOtpRequestParams params }) async {
    emit(VerifyEmailUpdatedLoading());
    final result = await verifyEmailUseCase(params);
    result.fold(
      (failure) => emit(VerifyEmailUpdatedFailure(failure: failure)),
      (_) => emit(VerifyEmailUpdatedSuccess()),
    );
  }}
