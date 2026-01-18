import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/use_cases/forget_password_use_case.dart';

import '../../../data/model/forget_password_model.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordUseCase) : super(ForgetPasswordInitial());
  final ForgetPasswordUseCase forgetPasswordUseCase;
  Future<void> forgetPassword(ForgetPasswordModel forgetPasswordModel ) async {
    emit(ForgetPasswordLoading());
    final result = await forgetPasswordUseCase(
      forgetPasswordModel,
    );
    result.fold(
      (failure) => emit(ForgetPasswordFailure(failure.message)),
      (_) => emit(ForgetPasswordSuccess()),
    );
  }}
