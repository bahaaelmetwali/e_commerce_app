import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/use_cases/update_profile_use_case.dart';

part 'update_profile_state.dart';

@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this.updateProfileUseCase) : super(UpdateProfileInitial());
  final UpdateProfileUseCase updateProfileUseCase;
  Future<void> updateProfile(UpdateUserProfileParams params) async {
    emit(UpdateProfileLoading());
    final result = await updateProfileUseCase(params);
    result.fold(
      (failure) => emit(UpdateProfileFailure(failure)),
      (_) => emit(UpdateProfileSuccess()),
    );
  }
}
