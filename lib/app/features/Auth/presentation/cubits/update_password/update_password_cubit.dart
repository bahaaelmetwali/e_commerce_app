import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/errors/failure.dart';
import 'package:mega/app/features/Auth/domain/use_cases/change_password_use_case.dart';

part 'update_password_state.dart';

@injectable
class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit(this.changePasswordUseCase)
    : super(UpdatePasswordInitial());
  final ChangePasswordUseCase changePasswordUseCase;
  Future<void> updatePassword(ChangePasswordParams params) async {
    emit(UpdatePasswordLoading());
    final result = await changePasswordUseCase.call(params);
    result.fold(
      (failure) => emit(UpdatePasswordFailure(failure)),
      (_) => emit(UpdatePasswordSuccess()),
    );
  }
}
