import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/about_app_entity.dart';
import '../../../domain/use_cases/about_app_use_case.dart';

part 'about_app_state.dart';

@injectable
class AboutAppCubit extends Cubit<AboutAppState> {
  AboutAppCubit(this.aboutAppUseCase) : super(AboutAppInitial());
  final AboutAppUseCase aboutAppUseCase;
  Future<void> getAboutApp() async {
    emit(AboutAppLoading());
    final result = await aboutAppUseCase();
    result.fold(
      (failure) => emit(AboutAppError(failure: failure)),
      (aboutAppEntity) => emit(AboutAppLoaded(aboutAppEntity: aboutAppEntity)),
    );
  }
}

