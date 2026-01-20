import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/features/menu/domain/use_cases/rate_app_use_case.dart';

import '../../../../../core/errors/failure.dart';

part 'rate_app_state.dart';

@injectable
class RateAppCubit extends Cubit<RateAppState> {
  RateAppCubit(this.rateAppUseCase) : super(RateAppInitial());
final RateAppUseCase rateAppUseCase ;

  Future<void> rateApp(RateAppParams params) async {
    emit(RateAppLoading());
    final result = await rateAppUseCase.call(params);
    result.fold(
      (failure) => emit(RateAppError(failure: failure)),
      (_) => emit(RateAppSuccess()),
    );
  }
}
