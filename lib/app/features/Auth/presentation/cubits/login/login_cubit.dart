import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/data/model/login_request_model.dart';
import 'package:mega/app/features/Auth/domain/use_cases/login_use_case.dart';

import '../../../domain/entities/auth_entity.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());

final LoginUseCase loginUseCase ;
  void login({required LoginRequestModel loginRequest}) async {
    emit(LoginLoading());
    final result = await loginUseCase(loginRequest);
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.toString())),
      (authEntity) => emit(LoginSuccess(authEntity)),
    );
  }
}
