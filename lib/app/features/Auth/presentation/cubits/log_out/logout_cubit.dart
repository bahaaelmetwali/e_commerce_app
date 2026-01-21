import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/use_cases/logout_use_case.dart';

import '../../../../../core/errors/failure.dart';

part 'logout_state.dart';

@injectable
class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.logoutUseCase) : super(LogoutInitial());
  final LogoutUseCase logoutUseCase;
  Future<void> logout() async {

    emit(LogoutLoading());
    final result = await logoutUseCase();
    result.fold(
      (failure) => emit(LogoutFailure(failure)),
      (_) => emit(LogoutSuccess()),
    );
  }
}
