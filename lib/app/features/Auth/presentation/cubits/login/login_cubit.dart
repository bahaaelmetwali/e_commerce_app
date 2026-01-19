import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data/domain/entities/token_entity.dart';
import '../../../../../core/data/domain/entities/cached_user_entity.dart';
import '../../../../../core/data/domain/use_cases/save_token_use_case.dart';
import '../../../../../core/data/domain/use_cases/save_user_info_use_case.dart';
import '../../../data/model/login_request_model.dart';
import '../../../domain/use_cases/login_use_case.dart';



part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase, this.saveTokenUseCase, this.saveUserInfoUseCase) : super(LoginInitial());
  final SaveTokenUseCase saveTokenUseCase;
  final SaveUserInfoUseCase saveUserInfoUseCase;
  final LoginUseCase loginUseCase;
  void login({required LoginRequestModel loginRequest}) async {
    emit(LoginLoading());
    final result = await loginUseCase(loginRequest);
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.toString())),
      (authEntity) => () {
    final userEntity = UserEntity(
          id: authEntity.id,
          name: authEntity.name,
          email: authEntity.email,
          avatar: authEntity.avatar,
        );
        final tokenEntity = TokenEntity(token: authEntity.token);
        saveTokenUseCase(tokenEntity);
        saveUserInfoUseCase(userEntity);
      }(),
    );
  }
}
