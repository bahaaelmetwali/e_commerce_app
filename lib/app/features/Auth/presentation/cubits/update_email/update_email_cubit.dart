import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/Auth/domain/use_cases/update_email_use_case.dart';

import '../../../../../core/errors/failure.dart';

part 'update_email_state.dart';

@injectable
class UpdateEmailCubit extends Cubit<UpdateEmailState> {
  UpdateEmailCubit(this.updateEmailUseCase) : super(UpdateEmailInitial());
  final UpdateEmailUseCase updateEmailUseCase;
  Future<void> updateEmail(UpdateEmailParams params) async {
    emit(UpdateEmailLoading());
    final result = await updateEmailUseCase.call(params);
    result.fold(
      (failure) => emit(UpdateEmailFailure(failure: failure)),
      (_) => emit(UpdateEmailSuccess()),
    );
  }
}

