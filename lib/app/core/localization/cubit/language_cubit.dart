import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/app/core/domain/entities/language/app_language_code_enum.dart';
import 'package:e_commerce_app/app/core/domain/use_cases/change_language_use_case.dart';
import 'package:e_commerce_app/app/core/domain/use_cases/get_language_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'language_state.dart';

@injectable
class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(this.appLanguageUseCase, {required this.changeLanguageUseCase})
    : super(const LanguageState(null));
  final GetAppLanguageUseCase appLanguageUseCase;
  final ChangeLanguageUseCase changeLanguageUseCase;
  Future<void> getSavedLanguage() async {
    final result = await appLanguageUseCase();
    result.fold(
      (failure) => emit(const LanguageState(null)),
      (language) => emit(LanguageState(language)),
    );
  }

  Future<void> changeLanguage(AppLanguageCodeEnum languageCode) async {
    final result = await changeLanguageUseCase(languageCode);
    result.fold(
      (failure) => emit(const LanguageState(null)),
      (_) => emit(LanguageState(languageCode)),
    );
  }
}
