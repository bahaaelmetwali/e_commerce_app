import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/use_cases/verify_pass_code_use_case.dart';

part 'verify_pass_code_state.dart';

@injectable
class VerifyPassCodeCubit extends Cubit<VerifyPassCodeState> {
  VerifyPassCodeCubit(this.verifyPassCodeUseCase)
    : super(VerifyPassCodeInitial());
  final VerifyPassCodeUseCase verifyPassCodeUseCase;
  void verifyPassCode({required VerifyPassCodeParams params}) async {
    emit(VerifyPassCodeLoading());
    final result = await verifyPassCodeUseCase(params);
    result.fold(
      (failure) =>
          emit(VerifyPassCodeFailure(errorMessage: failure.toString())),
      (_) => emit(VerifyPassCodeSuccess()),
    );
  }
}
