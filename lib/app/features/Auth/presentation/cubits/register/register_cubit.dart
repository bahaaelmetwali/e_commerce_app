import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/data/domain/use_cases/save_token_use_case.dart';
import '../../../../../core/data/domain/use_cases/save_user_info_use_case.dart';
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
  void register(RegisterParams params) async {
    emit(RegisterCubitLoading());
    final result = await registerUseCase(params);
    result.fold(
      (failure) => emit(RegisterCubitFailure(errorMessage: failure.toString())),
      (authEntity) {
        emit(RegisterCubitSuccess());
      },
    );
  }
}
