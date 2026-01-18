import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/data/model/register_request_model.dart';
import 'package:mega/app/features/Auth/domain/entities/auth_entity.dart';
import 'package:mega/app/features/Auth/domain/use_cases/register_use_case.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit(this.registerUseCase) : super(RegisterCubitInitial());
  final RegisterUseCase registerUseCase;
  void register(RegisterRequestModel registerRequest) async {
    emit(RegisterCubitLoading());
    final result = await registerUseCase(registerRequest);
    result.fold(
      (failure) => emit(RegisterCubitFailure(errorMessage: failure.toString())),
      (authEntity) => emit(RegisterCubitSuccess(authEntity)),
    );
  }
}
