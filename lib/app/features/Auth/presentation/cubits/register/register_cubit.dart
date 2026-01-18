import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';


import '../../../../../core/data/domain/entities/token_entity.dart';
import '../../../../../core/data/domain/entities/user_entity.dart';
import '../../../../../core/data/domain/use_cases/save_token_use_case.dart';
import '../../../../../core/data/domain/use_cases/save_user_info_use_case.dart';
import '../../../data/model/register_request_model.dart';
import '../../../domain/use_cases/register_use_case.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit(
    this.registerUseCase,
    this.saveTokenUseCase, {
    required this.saveUserInfoUseCase,
  }) : super(RegisterCubitInitial());
  final RegisterUseCase registerUseCase;
  final SaveTokenUseCase saveTokenUseCase;
  final SaveUserInfoUseCase saveUserInfoUseCase;
  void register(RegisterRequestModel registerRequest) async {
    emit(RegisterCubitLoading());
    final result = await registerUseCase(registerRequest);
    result.fold(
      (failure) => emit(RegisterCubitFailure(errorMessage: failure.toString())),
      (authEntity) {
        final userEntity = UserEntity(
          id: authEntity.id,
          name: authEntity.name,
          email: authEntity.email,
          avatar: authEntity.avatar,
        );
        final tokenEntity = TokenEntity(token: authEntity.token);
        saveTokenUseCase(tokenEntity);
        saveUserInfoUseCase(userEntity);
        emit(RegisterCubitSuccess());
      },
    );
  }
}
